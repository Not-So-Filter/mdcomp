; sign-extends a 32-bit integer to 64-bit
; all RAM addresses are run through this function to allow them to work in both 16-bit and 32-bit addressing modes
ramaddr function x,(-(x&$80000000)<<1)|x

; Variables (v) and Flags (f)

	phase ramaddr ( $FFFF0000 )
v_ram_start:
			ds.b	$8000		; padding
v_ngfx_buffer:		ds.b	$200		; Nemesis graphics decompression buffer
			ds.b	$7E00		; padding
			
v_ram_end:
    if * > 0	; Don't declare more space than the RAM can contain!
	fatal "The RAM variable declarations are too large by $\{*} bytes."
    endif
	dephase

	!org 0