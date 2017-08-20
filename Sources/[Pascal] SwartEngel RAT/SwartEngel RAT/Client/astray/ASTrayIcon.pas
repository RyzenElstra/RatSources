{
 ASTrayIcon Component 1.0 Copyright © 1997
        Andrey Abakumov (aga@oficina.rnd.su)

 RXTrayIcon Component Copyright © 1997
        Fedor Koshevnikov  (kosh@masterbank.msk.ru)
        Igor Pavluk        (pavluk@masterbank.msk.ru)
        Serge Korolev      (korolev@masterbank.msk.ru)

Thank for idea and text of a component
	Eric Lawrence
	Lead Programmer
	Delta Programming Group
	deltagrp@juno.com or deltagrp@keynetcorp.net
This is generally intended to be used with one of the TASKTRAY components.

ASTrayIcon is inherited from RXTrayIcon, but add one
the very useful thing - is possible to remove display
of a task of taskbar

Set the property HideForm for removals of a task with
taskbar
}
unit ASTrayIcon;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  RXShell;

type
  TDuplicateComponent = class(Exception);
  { Define a Form not Owner object exception }
  TFormNotOwner = class(Exception);

  TASTrayIcon = class(TRxTrayIcon)
  private
   FHideForm:Boolean;
   
   OldWndProc: TFarProc;
   NewWndProc: Pointer;

   Procedure SetHideForm(Value:Boolean);

   Procedure HookParent;
   Procedure UnhookParent;
   Procedure HookWndProc(var Message: TMessage);

  protected
    { Protected declarations }
  public
   constructor Create(AOwner: TComponent); override;
   destructor Destroy;override;
   Procedure Loaded; override;
   Procedure ProcessEnabled;
   
  published
    property HideForm: Boolean
             read FHideForm
             write SetHideForm
             default True;

  end;

procedure Register;

implementation

constructor TASTrayIcon.Create(AOwner: TComponent);
var
  i: word;
  CompCount: byte;			
begin
 inherited Create(AOwner);
 FHideForm:=True;
 NewWndProc := nil;
 OldWndProc := nil;
 CompCount := 0;                       { Initialise Component Count to zero }
 { If we are designing at present }
 If (csDesigning in ComponentState) Then
   If (AOwner is TForm)
    Then
     With (AOwner as TForm) Do
      begin
      For i := 0 To ComponentCount - 1 Do { Check if there is already one of us! }
       If Components[i] is TASTrayIcon Then inc(CompCount);

      If CompCount > 1 Then Raise TDuplicateComponent.Create ('There is already a TASTrayIcon component on this Form');
      end
    Else
     Raise TFormNotOwner.Create('The owner of TASTrayIcon Component is not a TForm');
HookParent;
end;

destructor TASTrayIcon.Destroy;
begin
 UnhookParent;
 inherited Destroy;
end;

procedure TASTrayIcon.Loaded;
begin
 inherited Loaded;                     { Always call inherited Loaded method }
 If not (csDesigning in ComponentState) Then ProcessEnabled;
end;

Procedure TASTrayIcon.SetHideForm(Value:Boolean);
begin
  If Value <> FHideForm Then
   begin
   FHideForm := Value;
   ProcessEnabled;
   end;
end;

Procedure TASTrayIcon.ProcessEnabled;
begin
If FHideform
 Then ShowWindow(FindWindow(nil,@Application.Title[1]),sw_hide)
 Else ShowWindow(FindWindow(nil,@Application.Title[1]),sw_restore);
end;

procedure TASTrayIcon.HookParent;
begin
If owner=nil Then Exit;
OldWndProc := TFarProc(GetWindowLong((owner as tform).Handle, GWL_WNDPROC));
NewWndProc := MakeObjectInstance(HookWndProc);
SetWindowLong((owner as tform).Handle, GWL_WNDPROC, LongInt(NewWndProc));
end;

procedure TASTrayIcon.UnhookParent;
begin
If (owner <> NIL) and assigned(OldWndProc) Then
  SetWindowLong((owner as tform).Handle, GWL_WNDPROC, LongInt(OldWndProc));
If assigned(NewWndProc) Then
  FreeObjectInstance(NewWndProc);
NewWndProc := NIL;
OldWndProc := NIL;
end;

procedure TASTrayIcon.HookWndProc(var Message: TMessage);
begin
If owner = NIL Then Exit;
If (message.msg=wm_showwindow)
 Then
  begin
  If (message.wparam<>0) Then ProcessEnabled;
  end;
message.Result := CallWindowProc(OldWndProc, (owner as tform).Handle, message.Msg, message.wParam, message.lParam);
end;

procedure Register;
begin
  RegisterComponents('Standard', [TASTrayIcon]);
end;

end.
