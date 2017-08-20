; -------------------------------------------------------------
; Super fast packer/unpacker. Compression method - modified RLE
; Copyright (c), July 1994 by Aleksey Kuznetsov (Kiev, Ukraine)
; -------------------------------------------------------------
; Adapted for Delphi32/BCB32: May 14, 2002 by Aleksey Kuznetsov
; for 16bit version see http://utilmind.com/delphi/sfpack16.zip
; LAST MODIFIED: June 09, 2002
; -------------------------------------------------------------
; E-mail:   info@utilmind.com
; Homepage: http://www.utilmind.com, http://www.appcontrols.com
; -------------------------------------------------------------

	.386
	.model	FLAT

	public	SFPack		; (Source, Target: Pointer; SourceSize: LongInt): LongInt;
	public	SFUnpack	; (Source, Target: Pointer; SourceSize: LongInt): LongInt;

	public  SFCalcTargetSz	; (SourceSize: LongInt): LongInt; // calculates target size for packing

	.code

; WARNING for SFPackSeg and SFUnpackSeg routines !!!
; --------------------------------------------------
; Size of one block of memory should not exceed 64 Kb!!!

; WARNING for ALL rotutines !!!
;------------------------------
; The size of memory for Target should be more than 256 bytes!!!

; function SFPackSeg(Source, Target: Pointer; SourceSize: LongInt): LongInt;
SFPackSeg proc

; -----------------------------
; ->	EAX	Source
;	EDX	Target
;	ECX	SourceSize
; <-	EAX	return value
; -----------------------------

; Preparation...
	cld
	mov	esi, eax	; Source
	mov	edi, eax	; Source
	mov	ebp, edx	; Target always in EBP
	mov	edx, ecx	; save SourceSize in EDX
	add	edi, ecx	; EDI = *Source + SourceSize

;-------------------------------------------------------------------------------
; The character after source data block should not be equal to last character.
; This should be done to avoid compressing the data outside of source data block.
; However we should return that byte at the end
	mov	al, [edi]	; reading LAST byte
	push	eax		; PUSH it to find the original byte at the end
	push	edi		; PUSH it to find the position of replaced byte at the end
	push	esi		; PUSH Source for future use (*1*) at the begin of packing
	push	edi		; PUSH Source + SourceSize for future use (*2*) at the begin of packing

	mov	al, [edi-1]	; FIX: June 9, 2002 (we should take *previous* byte)
	inc	eax
	stosb			; REPLACING LAST BYTE ([*Source + SourceSize + 1] = [*Source + SourceSize] + 1)

; Checking source (looking for unused character)...
;   ...first cleaning 256 bytes at the Target
	xor	eax, eax	; clear registers
	mov	cx, 40h		; WARN!: SourceSize should be less than 64K in order to have this work propertly
	mov	edi, ebp	; restore Target
rep	stosd			; clear at least 256 bytes in Target

; Looking for unused byte and setting "1" to the cell in chartable, if byte is used
	mov	edi, ebp	; restore Target
	mov	ecx, edx	; restore SourceSize from EDX
	inc	eax		; mov	eax, 1
	mov	ebx, eax	; mov	ebx, 1
@@SCAN_ID:
	lodsb
	mov	[edi+eax], bl	; set 1 to chartable
	loop	@@SCAN_ID

; Find unused character
	mov	eax, ebx	; mov	eax, 1
	mov	ecx, ebx	; mov	ecx, 1
	mov	ch, al		; mov	ecx, 101h
				; WARN!: SourceSize should be less than 64K in order to have this work propertly
rep	scasb
	dec	ebx		; mov	ebx, 0
	cmp	cx, bx		; if all characters used
	pop	ecx		; POP (*2*) ECX = *Source + SourceSize
	pop	esi		; POP (*1*) ESI = Source
	je	@@SMART_PACK

; Copressing with identification symbol...
	mov	edx, edi	; current position in Target (unused char)
	mov	edi, ebp
	sub	edx, edi
	dec	edx		; DL = unused char
	mov	[edi], dx
	add	edi, 2
	jmp short @@ID_PACK
@@ST_ID_PACK:
	stosb
@@ID_PACK:
	cmp	ecx, esi
	je	@@FINISH
	lodsw
	dec	esi
	cmp	al, ah
	jne	@@ST_ID_PACK
	cmp	ax, [esi+1]
	jne	@@ST_ID_PACK
	mov	[edi], dl
	inc	edi
	stosb
	mov	ebx, esi	; save Source in EBX

; Determinate full length of chain
	add	esi, 2
@@PASS_CHAIN:
	inc	esi
	cmp	al, [esi]
	je	@@PASS_CHAIN

	mov	eax, esi
	sub	eax, ebx	; determinate position
	or	ah, ah
	jz	@@LESS_256_ID
	mov	byte ptr [edi], 0
	inc	edi
	stosw
	jmp short @@ID_PACK
@@LESS_256_ID:
	stosb
	jmp short @@ID_PACK

; Compressing without identification symbol...
@@SMART_PACK:
	mov	ebx, edx	; restore SourceSize from EDX (btw, EDX can be freely modified since now)
	add	ebx, ebp	; EBX = *Target + SourceSize
	inc	ebx		;       + 1
	push	ebx		; PUSH (*3*) *Target + SourceSize form joining the blocks at the end of packing
	mov	edi, ebp	; restore Target (it broken after SCASB)
	add	edi, 2
@@CYCLE_SP:
	cmp	ecx, esi	; if all data checked (ESI == *Source + SourceSize ??)
	je	@@END_SMART_PACK
	lodsw			; load 2 bytes
	stosb			; store 1 byte to target
	dec	esi
	cmp	al, ah		; if 1st <> 2nd
	jne	@@CYCLE_SP
	cmp	ax, [esi+1]	; if 1st <> 3rd
	jne	@@CYCLE_SP
	cmp	al, [esi+3]	; if 1st <> 4th
	jne	@@CYCLE_SP

; We have a chain of 4 equal bytes
	sub	ebx, 2
	mov	edx, edi	; EDX used for swapping
	sub	edx, ebp	; - Target
	mov	[ebx], dx	; write pointer to chain
	mov	edx, esi	; save current pointer to Source in EDX

; Determinate full length of chain
	add	esi, 3
@@PASSCHAIN:
	inc	esi
	cmp	al, [esi]
	je	@@PASSCHAIN

	mov	eax, esi
	sub	eax, edx	; EAX now contains the length of chain
	or	ah, ah		; if chain contains less than 256 characters
	jz	@@LESS_256
; if chain over 256 characters
	mov	byte ptr [edi], 0 ; write 0 to current target pointer (means that chain over 256 characters)
	inc	edi
	stosw			; write the length of chain (if > 256 chars)
	jmp short @@CYCLE_SP
@@LESS_256:
	stosb			; write the length of chain (if <= 256 chars)
	jmp short @@CYCLE_SP
@@END_SMART_PACK:
	mov	eax, edi
	sub	eax, ebp	; determinate the total size of target buffer (without pointers at the end)
	mov	[ebp], ax	; write the total size of target buffer to beginning

; Join target buffer with pointers
	pop	ecx		; POP (*3*) *Target + SourceSize
	sub	ecx, ebx	; determinate the length of "block of pointers" (in ECX)
	mov	esi, ebx	; ESI = * beginning of "block of pointers"
rep	movsb
@@FINISH:

; Restore last byte
	pop	ebx
	pop	eax
	mov	[ebx], al

; Generating return value
	mov	eax, edi
	sub	eax, ebp	; return value in EAX (total target size)

	ret
endp


; function SFUnpackSeg(Source, Target: Pointer; SourceSize: LongInt): LongInt;
SFUnpackSeg proc

; -----------------------------
; ->	EAX	Source
;	EDX	Target
;	ECX	SourceSize
; <-	EAX	return value
; -----------------------------

; Preparation...
	cld
	push	edx		; PUSH Target for future use at the end (to determinate return value)
	mov	ebp, eax	; Source always in EBP
	mov	esi, eax	; Source
	mov	edi, edx	; Target
	mov	ebx, ecx	; SourceSize
	add	ebx, eax	; EBX = *Source + SourceSize
	mov	eax, ecx	; this is to clear high word of EAX (will required for ECX on smart unpacking)

; Checking the compression method...
	mov	edx, esi	; Source
	lodsw			; get length of source data block or compressing method
	add	edx, eax	; EDX = *Source + DataSize
	cmp	ah, 0		; check compression method (if 0 then compressed with identifier)
				; NOTE: in case if it compressed without identifier,
				; the block size can NOT be less than 256 bytes anyway :-)
	jne	@@SMART_UNPACK  ; if first byte <> 0 then it was smartpacked
				; next, 2nd byte is the identification symbol
	sub	edx, ebp	; restore identification symbol in DH
	mov	ecx, eax	; this is to clear all ECX bytes except CL

; Decompressing with identification symbol...
@@SIMPLE_UNPACK:
	cmp	ebx, esi
	je	@@FINISH_UNPACK
	lodsb
	cmp	al, dl
	je	@@IDENT
	stosb
	jmp short @@SIMPLE_UNPACK
@@IDENT:
	lodsb
	mov	cl, [esi]
	inc	esi
	or	cl, cl
	jnz	@@LESS256_ID
	mov	cx, [esi]
	add	esi, 2
@@LESS256_ID:
	inc	ecx
rep	stosb
	jmp short @@SIMPLE_UNPACK

; Decompressing without identification symbol...
@@SMART_UNPACK:
	cmp	edx, ebx	; if DataSize == *Source + SourceSize
	je	@@END_SMART_UNPACK
	sub	ebx, 2
	mov	ecx, eax	; this is to clear high word of ECX
	mov	cx, [ebx]	; filling the low word (retrieving pointer to insert chain)
	add	ecx, ebp	; determinating exact pointer to insert the chain
	sub	ecx, esi	; --//--
	dec	ecx		; --//--
rep	movsb
	lodsb
	mov	cl, [esi]
	inc	esi
	or	cl, cl
	jnz	@@LESS256
	mov	cx, [esi]
	add	esi, 2
@@LESS256:
	inc	ecx
rep	stosb
	jmp short @@SMART_UNPACK

@@END_SMART_UNPACK:
	mov	ecx, edx	; ECX = *Source + DataSize
	sub	ecx, esi
rep	movsb			; complete unpacking
@@FINISH_UNPACK:

	pop	edx		; POP Target
	mov	eax, edi
	sub	eax, edx	; determinate return value (size of unpacked file)

	ret
endp


; function SFPack(Source, Target: Pointer; SourceSize: LongInt): LongInt;
SFPack proc

; -----------------------------
; ->	EAX	Source
;	EDX	Target
;	ECX	SourceSize
; <-	EAX	return value
; -----------------------------

	push	ebx
	push	esi
	push	edi
	push	ebp
	pushf

	mov	[edx], ecx	; write original file size (4 bytes of header)
	push	edx		; save original pointer to Target (required to calculate return value)
	add	edx, 4
	mov	ebx, ecx	; EBX used as counter (total SourceSize initially)

@@PACK64:
	or	ebx, ebx	; if EBX == 0 then done
	jz	@@END_PACK64

	mov	ecx, 0FFFDh
	cmp	ebx, ecx	; if SourceSize > $FFFF then
	jg	@@LAST_BLOCK
	mov	ecx, ebx	; BlockSize := SourceSize
@@LAST_BLOCK:
	sub	ebx, ecx	; SourceSize := SourceSize - BlockSize

	push	ebx		; save local counter
;-------------------------------------------------------------------------------
	push	eax		; save current pointer to Source
	push	ecx		; save size of current block
	push	edx		; save current pointer to Target
	add	edx, 2		; reserve 2 bytes for length of compressed block

	call	SFPackSeg	; PACK THIS 64K BLOCK!

	pop	edx		; restore current pointer to Target
	mov	[edx], ax	; write size of compressed block (it's always WORD value)
	add	edx, eax	; *Target = *Target + (size of compressed block)
	add	edx, 2
	pop	ecx		; restore size of current block
	pop	eax		; restore current pointer to Source
	add	eax, ecx	; *Source = *Source + (size of current block)
;-------------------------------------------------------------------------------
	pop	ebx		; restore local counter

	jmp short @@PACK64
@@END_PACK64:

	pop	ebx		; restore original pointer to Target (required to calculate return value)
	mov	eax, edx
	sub	eax, ebx	; calculate return value

	popf
	pop	ebp
	pop	edi
	pop	esi
	pop	ebx

	ret
endp


; function SFUnpack(Source, Target: Pointer; SourceSize: LongInt): LongInt;
SFUnpack proc

; -----------------------------
; ->	EAX	Source
;	EDX	Target
;	ECX	SourceSize
; <-	EAX	return value
; -----------------------------

	push	ebx
	push	esi
	push	edi
	push	ebp
	pushf

	push	edx		; save original pointer to Target (required to calculate return value)
	mov	ebx, ecx	; EBX used as counter (total SourceSize initially)
	xor	ecx, ecx

@@UNPACK64:
	or	ebx, ebx	; if EBX == 0 then done
	jz	@@END_UNPACK64

	mov	cx, [eax]	; retrieve block size to ECX
	add	eax, 2		; *Source = *Source + 2
	sub	ebx, ecx	; SourceSize = SourceSize - BlockSize
	sub	ebx, 2		;   - 2

	push	ebx		; save local counter
;-------------------------------------------------------------------------------
	push	eax		; save current pointer to Source
	push	ecx		; save size of current block
	push	edx		; save current pointer to Target

	call	SFUnpackSeg	; UNPACK THIS 64K BLOCK!

	pop	edx		; restore current pointer to Target
	add	edx, eax	; *Target = *Target + (size of decompressed block)
	pop	ecx		; restore size of current block
	pop	eax		; restore current pointer to Source
	add	eax, ecx	; *Source = *Source + (size of current block)
;-------------------------------------------------------------------------------
	pop	ebx		; restore local counter

	jmp short @@UNPACK64
@@END_UNPACK64:

	pop	ebx		; restore original pointer to Target (required to calculate return value)
	mov	eax, edx
	sub	eax, ebx	; calculate return value

	popf
	pop	ebp
	pop	edi
	pop	esi
	pop	ebx
	ret
endp


; function SFCalcTargetSz(SourceSize: LongInt): LongInt;
SFCalcTargetSz proc

; -----------------------------
; ->	EAX	SourceSize
; <-	EAX	return value
; -----------------------------
;	function CalcTargetSizeForPacking(SourceSize: DWord): DWord;
;	begin
;	  if SourceSize < $FF then
;	    Result := $FF
;	  else
;	    Result := SourceSize;
;	  inc(Result, (SourceSize div $FFFF + 1) shl 2 + 4);
;	end;
; -----------------------------

	push	ebx

	cmp	eax, 0FFh
	jge	@@ENOUGH	; if greater or equal
	mov	eax, 0FFh
@@ENOUGH:
	mov	ecx, eax

	xor	edx, edx
	mov	ebx, 0FFFFh
	div	ebx

	inc	eax
	shl	eax, 2
	add	eax, 4		; 4 bytes required to write original file size

	add	eax, ecx

	pop	ebx
	ret
endp

	end
