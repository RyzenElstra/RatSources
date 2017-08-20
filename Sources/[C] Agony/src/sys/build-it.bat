@echo off
build -c
rd /S /Q binary
del buildchk_w2K_x86.log
rd /S /Q objchk_w2K_x86 
ren i386 binary