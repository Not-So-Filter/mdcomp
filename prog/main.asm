; ===========================================================================
; ---------------------------------------------------------------------------
; Main Program
; ---------------------------------------------------------------------------

__DEBUG__ = 1

	include "MacroSetup.asm"
	include	"Constants.asm"
	include	"Variables.asm"
	include	"Macros.asm"
	include	"Debugger.asm"

StartROM:	dc.l 0	; Initial stack pointer value
		dc.l StartGame			; Start of program
		dc.l BusError			; Bus error
		dc.l AddressError		; Address error (4)
		dc.l IllegalInstr		; Illegal instruction
		dc.l ZeroDivide			; Division by zero
		dc.l ChkInstr			; CHK exception
		dc.l TrapvInstr			; TRAPV exception (8)
		dc.l PrivilegeViol		; Privilege violation
		dc.l Trace				; TRACE exception
		dc.l Line1010Emu		; Line-A emulator
		dc.l Line1111Emu		; Line-F emulator (12)
		dc.l ErrorExcept		; Unused (reserved)
		dc.l ErrorExcept		; Unused (reserved)
		dc.l ErrorExcept		; Unused (reserved)
		dc.l ErrorExcept		; Unused (reserved) (16)
		dc.l ErrorExcept		; Unused (reserved)
		dc.l ErrorExcept		; Unused (reserved)
		dc.l ErrorExcept		; Unused (reserved)
		dc.l ErrorExcept		; Unused (reserved) (20)
		dc.l ErrorExcept		; Unused (reserved)
		dc.l ErrorExcept		; Unused (reserved)
		dc.l ErrorExcept		; Unused (reserved)
		dc.l ErrorExcept		; Unused (reserved) (24)
		dc.l ErrorExcept		; Spurious exception
		dc.l ErrorTrap			; IRQ level 1
		dc.l ErrorTrap			; IRQ level 2
		dc.l ErrorTrap			; IRQ level 3 (28)
		dc.l 0				; IRQ level 4 (horizontal retrace interrupt)
		dc.l ErrorTrap			; IRQ level 5
		dc.l 0				; IRQ level 6 (vertical retrace interrupt)
		dc.l ErrorTrap			; IRQ level 7 (32)
		dc.l ErrorTrap			; TRAP #00 exception
		dc.l ErrorTrap			; TRAP #01 exception
		dc.l ErrorTrap			; TRAP #02 exception
		dc.l ErrorTrap			; TRAP #03 exception (36)
		dc.l ErrorTrap			; TRAP #04 exception
		dc.l ErrorTrap			; TRAP #05 exception
		dc.l ErrorTrap			; TRAP #06 exception
		dc.l ErrorTrap			; TRAP #07 exception (40)
		dc.l ErrorTrap			; TRAP #08 exception
		dc.l ErrorTrap			; TRAP #09 exception
		dc.l ErrorTrap			; TRAP #10 exception
		dc.l ErrorTrap			; TRAP #11 exception (44)
		dc.l ErrorTrap			; TRAP #12 exception
		dc.l ErrorTrap			; TRAP #13 exception
		dc.l ErrorTrap			; TRAP #14 exception
		dc.l ErrorTrap			; TRAP #15 exception (48)
		dc.l ErrorTrap			; Unused (reserved)
		dc.l ErrorTrap			; Unused (reserved)
		dc.l ErrorTrap			; Unused (reserved)
		dc.l ErrorTrap			; Unused (reserved)
		dc.l ErrorTrap			; Unused (reserved)
		dc.l ErrorTrap			; Unused (reserved)
		dc.l ErrorTrap			; Unused (reserved)
		dc.l ErrorTrap			; Unused (reserved)
		dc.l ErrorTrap			; Unused (reserved)
		dc.l ErrorTrap			; Unused (reserved)
		dc.l ErrorTrap			; Unused (reserved)
		dc.l ErrorTrap			; Unused (reserved)
		dc.l ErrorTrap			; Unused (reserved)
		dc.l ErrorTrap			; Unused (reserved)
		dc.l ErrorTrap			; Unused (reserved)
		dc.l ErrorTrap			; Unused (reserved)
		dc.b	"SEGA MEGA DRIVE "
		dc.b	"(C)SEGA 1989.JAN"
		dc.b	"                                                "
		dc.b	"                                                "
		dc.b	"GM XXXXXXXXXXX"
		dc.w	0
		dc.b	"J               "
		dc.l	StartROM
		dc.l	FinishROM-1
		dc.l	v_ram_start
		dc.l	v_ram_end-1
		dc.l	$20202020
		dc.l	$20202020
		dc.l	$20202020
		dc.b	"                                                    "
		dc.b	"JUE             "

ErrorTrap:
		bra.s	ErrorTrap

; ---------------------------------------------------------------------------
; Start of code (Setup)
; ---------------------------------------------------------------------------

StartGame:
		moveq	#$F,d0					; get only the version number
		and.b	(z80_version).l,d0			; load hardware version/region
		beq.s	SG_NoTMSS				; if the version is 0, branch (no TMSS in this machine)
		move.l	#"SEGA",(security_addr).l	; give TMSS the string "SEGA" so it unlocks the VDP
		moveq	#0,d0					; clear d0

SG_NoTMSS:
		move.w	#$0100,d1				; prepare Z80 value/VDP register increment
		move.w	d1,(z80_bus_request).l			; request Z80 to stop
		move.w	d0,(z80_reset).l			; request Z80 reset on (resets YM2612)
		lea	(vdp_data_port).l,a5			; load VDP data port
		lea	4(a5),a6				; load VDP control port
		lea	$11(a5),a4				; load PSG port
		move.b	#$9F,(a4)				; mute all PSG channels
		move.b	#$BF,(a4)				; ''
		move.b	#$DF,(a4)				; ''
		move.b	#$FF,(a4)				; ''
		move.w	d1,(z80_reset).l			; request Z80 reset off

		KDebug.WriteLine "Starting to measure performance of decompression..."
		lea	Art_Compressed(pc),a0
		lea	(v_ngfx_buffer).w,a1
		moveq	#0,d0
		KDebug.StartTimer
		bsr.s	EniDec
		KDebug.EndTimer 	; this will print number of cycles measured
		
LoopGame:
		bra.s	LoopGame

		include	"../src/optimized/Enigma.asm"
		
Art_Compressed:	binclude	"../art/art.eni"
		even
; ==============================================================
; --------------------------------------------------------------
; Debugging modules
; --------------------------------------------------------------

	include	"ErrorHandler.asm"

; --------------------------------------------------------------
; WARNING!
;	DO NOT put any data from now on! DO NOT use ROM padding!
;	Symbol data should be appended here after ROM is compiled
;	by ConvSym utility, otherwise debugger modules won't be able
;	to resolve symbol names.
; --------------------------------------------------------------

FinishROM:
		end