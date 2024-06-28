; =============== S U B R O U T I N E =======================================


NemDec:				 ; CODE XREF: ROM:00074CD8↓p
				        ; DATA XREF: initial_pc_entry+59E↑o
		lea     sub_749B8(pc),a3
		lea     ($C00000).l,a4
		bra.s   loc_7493A
; ---------------------------------------------------------------------------
		lea     sub_749CE(pc),a3

loc_7493A:		              ; CODE XREF: NemDec+A↑j
		lea     (unk_FFDD56).w,a1
		move.w  (a0)+,d2
		bpl.s   loc_74946
		adda.w  #$A,a3

loc_74946:		              ; CODE XREF: NemDec+16↑j
		lsl.w   #3,d2
		movea.w d2,a5
		moveq   #8,d3
		moveq   #0,d2
		bsr.w   sub_749E4
		move.b  (a0)+,d5
		asl.w   #8,d5
		move.b  (a0)+,d5
		moveq   #$10,d6
; End of function NemDec

; START OF FUNCTION CHUNK FOR sub_74994

loc_7495A:		              ; CODE XREF: sub_74994+8↓j
		move.b  d6,d7
		subq.b  #8,d7
		move.w  d5,d1
		lsr.w   d7,d1
		cmpi.b  #$FC,d1
		bcc.s   loc_7499E
		andi.w  #$FF,d1
		add.w   d1,d1
		sub.b   (a1,d1.w),d6
		moveq   #0,d0
		move.b  1(a1,d1.w),d0

loc_74978:		              ; CODE XREF: sub_74994+22↓j
		cmpi.b  #9,d6
		bcc.s   loc_74984
		addq.b  #8,d6
		asl.w   #8,d5
		move.b  (a0)+,d5

loc_74984:		              ; CODE XREF: sub_74994-18↑j
		moveq   #$F,d1
		and.w   d0,d1
		lsr.w   #4,d0

loc_7498A:		              ; CODE XREF: sub_74994:loc_74998↓j
		lsl.l   #4,d4
		or.b    d1,d4
		subq.w  #1,d3
		bne.s   loc_74998
		jmp     (a3)
; END OF FUNCTION CHUNK FOR sub_74994

; =============== S U B R O U T I N E =======================================


sub_74994:		              ; CODE XREF: sub_749B8+6↓j
				        ; ROM:000749CA↓j ...

; FUNCTION CHUNK AT 0007495A SIZE 0000003A BYTES

		moveq   #0,d4
		moveq   #8,d3

loc_74998:		              ; CODE XREF: sub_74994-4↑j
		dbf     d0,loc_7498A
		bra.s   loc_7495A
; ---------------------------------------------------------------------------

loc_7499E:		              ; CODE XREF: sub_74994-2E↑j
		cmpi.b  #$F,d6
		bcc.s   loc_749AA
		addq.b  #8,d6
		asl.w   #8,d5
		move.b  (a0)+,d5

loc_749AA:		              ; CODE XREF: sub_74994+E↑j
		subi.b  #$D,d6
		move.w  d5,d1
		lsr.w   d6,d1
		moveq   #$7F,d0
		and.w   d1,d0
		bra.s   loc_74978
; End of function sub_74994


; =============== S U B R O U T I N E =======================================


sub_749B8:		              ; DATA XREF: NemDec↑o
				        ; ROM:00074B6C↓o ...
		move.l  d4,(a4)
		subq.w  #1,a5
		move.w  a5,d4
		bne.s   sub_74994
		rts
; End of function sub_749B8

; ---------------------------------------------------------------------------
		eor.l   d4,d2
		move.l  d2,(a4)
		subq.w  #1,a5
		move.w  a5,d4
		bne.s   sub_74994
		rts

; =============== S U B R O U T I N E =======================================


sub_749CE:		              ; DATA XREF: NemDec+C↑o
		move.l  d4,(a4)+
		subq.w  #1,a5
		move.w  a5,d4
		bne.s   sub_74994
		rts
; End of function sub_749CE

; ---------------------------------------------------------------------------
		eor.l   d4,d2
		move.l  d2,(a4)+
		subq.w  #1,a5
		move.w  a5,d4
		bne.s   sub_74994
		rts

; =============== S U B R O U T I N E =======================================


sub_749E4:		              ; CODE XREF: NemDec+24↑p
				        ; ROM:00074B84↓p ...
		move.b  (a0)+,d0

loc_749E6:		              ; CODE XREF: sub_749E4+E↓j
		cmpi.b  #$FF,d0
		bne.s   loc_749EE
		rts
; ---------------------------------------------------------------------------

loc_749EE:		              ; CODE XREF: sub_749E4+6↑j
		move.b  d0,d7

loc_749F0:		              ; CODE XREF: sub_749E4+38↓j
		move.b  (a0)+,d0
		bmi.s   loc_749E6
		moveq   #$F,d1
		and.w   d1,d7
		and.w   d0,d1
		ext.w   d0
		add.w   d0,d0
		or.w    word_74A1E(pc,d0.w),d7
		subq.w  #8,d1
		neg.w   d1
		move.b  (a0)+,d0
		lsl.w   d1,d0
		add.w   d0,d0
		moveq   #1,d5
		lsl.w   d1,d5
		subq.w  #1,d5

loc_74A12:		              ; CODE XREF: sub_749E4+34↓j
		move.w  d7,(a1,d0.w)
		addq.w  #2,d0
		dbf     d5,loc_74A12
		bra.s   loc_749F0
; End of function sub_749E4

; ---------------------------------------------------------------------------
word_74A1E:     dc.w 0		  ; DATA XREF: sub_749E4+1A↑r
		dc.w $100
		dc.w $200
		dc.w $300
		dc.w $400
		dc.w $500
		dc.w $600
		dc.w $700
		dc.w $800
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w $10
		dc.w $110
		dc.w $210
		dc.w $310
		dc.w $410
		dc.w $510
		dc.w $610
		dc.w $710
		dc.w $810
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w $20
		dc.w $120
		dc.w $220
		dc.w $320
		dc.w $420
		dc.w $520
		dc.w $620
		dc.w $720
		dc.w $820
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w $30
		dc.w $130
		dc.w $230
		dc.w $330
		dc.w $430
		dc.w $530
		dc.w $630
		dc.w $730
		dc.w $830
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w $40
		dc.w $140
		dc.w $240
		dc.w $340
		dc.w $440
		dc.w $540
		dc.w $640
		dc.w $740
		dc.w $840
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w $50
		dc.w $150
		dc.w $250
		dc.w $350
		dc.w $450
		dc.w $550
		dc.w $650
		dc.w $750
		dc.w $850
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w $60
		dc.w $160
		dc.w $260
		dc.w $360
		dc.w $460
		dc.w $560
		dc.w $660
		dc.w $760
		dc.w $860
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w $70
		dc.w $170
		dc.w $270
		dc.w $370
		dc.w $470
		dc.w $570
		dc.w $670
		dc.w $770
		dc.w $870
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
; ---------------------------------------------------------------------------
		lea     (dword_FFDF56).w,a1

loc_74B22:		              ; CODE XREF: ROM:00074B28↓j
		tst.l   (a1)
		beq.s   loc_74B2A
		addq.w  #6,a1
		bra.s   loc_74B22
; ---------------------------------------------------------------------------

loc_74B2A:		              ; CODE XREF: ROM:00074B24↑j
		move.w  (a0)+,d0
		bmi.s   locret_74B36

loc_74B2E:		              ; CODE XREF: ROM:00074B32↓j
		move.l  (a0)+,(a1)+
		move.w  (a0)+,(a1)+
		dbf     d0,loc_74B2E

locret_74B36:		           ; CODE XREF: ROM:00074B2C↑j
		rts
; ---------------------------------------------------------------------------
		bsr.s   sub_74B4C
		lea     (dword_FFDF56).w,a1
		move.w  (a0)+,d0
		bmi.s   locret_74B4A

loc_74B42:		              ; CODE XREF: ROM:00074B46↓j
		move.l  (a0)+,(a1)+
		move.w  (a0)+,(a1)+
		dbf     d0,loc_74B42

locret_74B4A:		           ; CODE XREF: ROM:00074B40↑j
		rts

; =============== S U B R O U T I N E =======================================


sub_74B4C:		              ; CODE XREF: ROM:00074B38↑p
		lea     (dword_FFDF56).w,a1
		moveq   #$F,d0

loc_74B52:		              ; CODE XREF: sub_74B4C+A↓j
		clr.l   (a1)+
		clr.w   (a1)+
		dbf     d0,loc_74B52
		rts
; End of function sub_74B4C

; ---------------------------------------------------------------------------
		tst.l   (dword_FFDF56).w
		beq.s   locret_74BAE
		tst.w   (word_FFDFCE).w
		bne.s   locret_74BAE
		movea.l (dword_FFDF56).w,a0
		lea     sub_749B8(pc),a3
		lea     (unk_FFDD56).w,a1
		move.w  (a0)+,d2
		bpl.s   loc_74B7C
		adda.w  #$A,a3

loc_74B7C:		              ; CODE XREF: ROM:00074B76↑j
		andi.w  #$7FFF,d2
		move.w  d2,(word_FFDFCE).w
		bsr.w   sub_749E4
		move.b  (a0)+,d5
		asl.w   #8,d5
		move.b  (a0)+,d5
		moveq   #$10,d6
		moveq   #0,d0
		move.l  a0,(dword_FFDF56).w
		move.l  a3,(dword_FFDFCA).w
		move.l  d0,(dword_FFDFB6).w
		move.l  d0,(dword_FFDFBA).w
		move.l  d0,(dword_FFDFBE).w
		move.l  d5,(dword_FFDFC2).w
		move.l  d6,(dword_FFDFC6).w

locret_74BAE:		           ; CODE XREF: ROM:00074B60↑j
				        ; ROM:00074B66↑j
		rts
; ---------------------------------------------------------------------------
		movea.w #8,a5
		bsr.w   sub_74994
		addi.w  #$20,(word_FFDFCE).w ; ' '
		subq.w  #1,a6
		move.w  a6,d7
		beq.s   loc_74BC6
		rts
; ---------------------------------------------------------------------------

loc_74BC6:		              ; CODE XREF: ROM:00074BC2↑j
		lea     (unk_FFDD56).w,a1
		lea     ($C00000).l,a4
		move.l  (a2)+,d0
		beq.s   locret_74C0E
		movea.l d0,a0
		lea     sub_749B8(pc),a3
		move.w  (a0)+,d0
		bpl.s   loc_74BE2
		adda.w  #$A,a3

loc_74BE2:		              ; CODE XREF: ROM:00074BDC↑j
		andi.w  #$7FFF,d0
		movea.w d0,a6
		moveq   #0,d0
		move.w  (a2)+,d0
		move.w  d0,(word_FFDFCE).w
		lsl.l   #2,d0
		lsr.w   #2,d0
		ori.w   #$4000,d0
		swap    d0
		move.l  d0,4(a4)
		bsr.w   sub_749E4
		moveq   #0,d2
		moveq   #0,d0
		move.b  (a0)+,d5
		asl.w   #8,d5
		move.b  (a0)+,d5
		moveq   #$10,d6

locret_74C0E:		           ; CODE XREF: ROM:00074BD2↑j
		rts
; ---------------------------------------------------------------------------
		tst.w   (word_FFDFCE).w
		beq.w   locret_74CA8
		move.w  #6,(word_FFDFD0).w
		moveq   #0,d0
		move.w  (word_FFDF5A).w,d0
		addi.w  #$C0,(word_FFDF5A).w
		bra.s   loc_74C44
; ---------------------------------------------------------------------------
		tst.w   (word_FFDFCE).w
		beq.s   locret_74CA8
		move.w  #3,(word_FFDFD0).w
		moveq   #0,d0
		move.w  (word_FFDF5A).w,d0
		addi.w  #$60,(word_FFDF5A).w ; '`'

loc_74C44:		              ; CODE XREF: ROM:00074C2A↑j
		lea     ($C00004).l,a4
		lsl.l   #2,d0
		lsr.w   #2,d0
		ori.w   #$4000,d0
		swap    d0
		move.l  d0,(a4)
		subq.w  #4,a4
		movea.l (dword_FFDF56).w,a0
		move.l  (dword_FFDFB6).w,d0
		move.l  (dword_FFDFBA).w,d1
		move.l  (dword_FFDFBE).w,d2
		move.l  (dword_FFDFC2).w,d5
		move.l  (dword_FFDFC6).w,d6
		movea.l (dword_FFDFCA).w,a3
		lea     (unk_FFDD56).w,a1

loc_74C78:		              ; CODE XREF: ROM:00074C8A↓j
		movea.w #8,a5
		bsr.w   sub_74994
		subq.w  #1,(word_FFDFCE).w
		beq.s   loc_74CAA
		subq.w  #1,(word_FFDFD0).w
		bne.s   loc_74C78
		move.l  a0,(dword_FFDF56).w
		move.l  d0,(dword_FFDFB6).w
		move.l  d1,(dword_FFDFBA).w
		move.l  d2,(dword_FFDFBE).w
		move.l  d5,(dword_FFDFC2).w
		move.l  d6,(dword_FFDFC6).w
		move.l  a3,(dword_FFDFCA).w

locret_74CA8:		           ; CODE XREF: ROM:00074C14↑j
				        ; ROM:00074C30↑j
		rts
; ---------------------------------------------------------------------------

loc_74CAA:		              ; CODE XREF: ROM:00074C84↑j
		lea     (dword_FFDF56).w,a0
		moveq   #$15,d0

loc_74CB0:		              ; CODE XREF: ROM:00074CB4↓j
		move.l  6(a0),(a0)+
		dbf     d0,loc_74CB0
		rts
; ---------------------------------------------------------------------------
		movea.l a0,a1
		move.w  (a1)+,d1

loc_74CBE:		              ; CODE XREF: ROM:00074CE0↓j
		movea.l (a1)+,a0
		moveq   #0,d0
		move.w  (a1)+,d0
		lsl.l   #2,d0
		lsr.w   #2,d0
		ori.w   #$4000,d0
		swap    d0
		move.l  d0,($C00004).l
		movem.l d1/a1,-(sp)
		bsr.w   NemDec
		movem.l (sp)+,d1/a1
		dbf     d1,loc_74CBE
		rts