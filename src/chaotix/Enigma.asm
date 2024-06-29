; ---------------------------------------------------------------------------
                movea.w	d0,a3
		move.b	(a0)+,d0
		ext.w	d0
		movea.w	d0,a5
		move.b	(a0)+,d4
		lsl.b	#3,d4
		movea.w	(a0)+,a2
		adda.w	a3,a2
		movea.w	(a0)+,a4
		adda.w	a3,a4
		move.w	(a0)+,d5
		moveq	#$10,d6

loc_74CFE:
		moveq	#7,d0
		move.w	d6,d7
		sub.w	d0,d7
		move.w	d5,d1
		lsr.w	d7,d1
		andi.w	#$7F,d1
		cmpi.w	#$40,d1
		bcc.s	loc_74D16
		moveq	#6,d0
		lsr.w	#1,d1

loc_74D16:
		sub.w	d0,d6
		cmpi.w	#9,d6
		bcc.s	loc_74D24
		addq.w	#8,d6
		asl.w	#8,d5
		move.b	(a0)+,d5

loc_74D24:
		moveq	#$F,d2
		and.w	d1,d2
		sub.w	d2,d1
		jmp	loc_74D2E(pc,d1.w)
; ---------------------------------------------------------------------------

loc_74D2E:
		move.w	a2,(a1)+
		addq.w	#1,a2
		dbf	d2,loc_74D2E
		bra.w	loc_74CFE
; ---------------------------------------------------------------------------
		nop
		nop

loc_74D3E:
		move.w	a4,(a1)+
		dbf	d2,loc_74D3E
		bra.w	loc_74CFE
; ---------------------------------------------------------------------------
		nop
		nop
		nop
		bra.w	loc_74DB0
; ---------------------------------------------------------------------------
		nop
		nop
		nop
		nop
		nop
		nop
		bra.w	loc_74DB0
; ---------------------------------------------------------------------------
		nop
		nop
		nop
		nop
		nop
		nop
		bsr.w	loc_74DC2

loc_74D72:
		move.w	d1,(a1)+
		dbf	d2,loc_74D72
		bra.w	loc_74CFE
; ---------------------------------------------------------------------------
		nop
		bsr.w	loc_74DC2

loc_74D82:
		move.w	d1,(a1)+
		addq.w	#1,d1
		dbf	d2,loc_74D82
		bra.w	loc_74CFE
; ---------------------------------------------------------------------------
		bsr.w	loc_74DC2

loc_74D92:
		move.w	d1,(a1)+
		subq.w	#1,d1
		dbf	d2,loc_74D92
		bra.w	loc_74CFE
; ---------------------------------------------------------------------------
		cmpi.w	#$F,d2
		beq.s	loc_74DB0

loc_74DA4:
		bsr.s	loc_74DC2
		move.w	d1,(a1)+
		dbf	d2,loc_74DA4
		bra.w	loc_74CFE
; ---------------------------------------------------------------------------

loc_74DB0:
		cmpi.w	#$10,d6
		bne.s	loc_74DB8
		subq.w	#1,a0

loc_74DB8:
		move.l	a0,d0
		andi.w	#$FFFE,d0
		movea.l	d0,a0
		rts
; ---------------------------------------------------------------------------

loc_74DC2:
		move.w	a3,d3
		move.b	d4,d1
		bpl.s	loc_74DD2
		subq.w	#1,d6
		btst	d6,d5
		beq.s	loc_74DD2
		ori.w	#$8000,d3

loc_74DD2:
		add.b	d1,d1
		bpl.s	loc_74DE0
		subq.w	#1,d6
		btst	d6,d5
		beq.s	loc_74DE0
		addi.w	#$4000,d3

loc_74DE0:
		add.b	d1,d1
		bpl.s	loc_74DEE
		subq.w	#1,d6
		btst	d6,d5
		beq.s	loc_74DEE
		addi.w	#$2000,d3

loc_74DEE:
		add.b	d1,d1
		bpl.s	loc_74DFC
		subq.w	#1,d6
		btst	d6,d5
		beq.s	loc_74DFC
		ori.w	#$1000,d3

loc_74DFC:
		add.b	d1,d1
		bpl.s	loc_74E0A
		subq.w	#1,d6
		btst	d6,d5
		beq.s	loc_74E0A
		ori.w	#$800,d3

loc_74E0A:
		move.w	d5,d1
		move.w	d6,d7
		sub.w	a5,d7
		bcc.s	loc_74E2E
		moveq	#$10,d6
		add.w	d7,d6
		swap	d1
		move.b	(a0)+,d1
		lsl.w	#8,d1
		move.b	(a0)+,d1
		move.w	d1,d5
		lsr.l	d6,d1
		move.w	a5,d0
		add.w	d0,d0
		and.w	locret_74E60(pc,d0.w),d1
		add.w	d3,d1
		rts
; ---------------------------------------------------------------------------

loc_74E2E:
		beq.s	loc_74E4E
		lsr.w	d7,d1
		move.w	a5,d0
		add.w	d0,d0
		and.w	locret_74E60(pc,d0.w),d1
		add.w	d3,d1
		move.w	a5,d0
		sub.w	d0,d6
		cmpi.w	#9,d6
		bcc.s	locret_74E4C
		addq.w	#8,d6
		asl.w	#8,d5
		move.b	(a0)+,d5

locret_74E4C:
		rts
; ---------------------------------------------------------------------------

loc_74E4E:
		moveq	#$10,d6
		move.w	a5,d0
		add.w	d0,d0
		and.w	locret_74E60(pc,d0.w),d1
		add.w	d3,d1
		move.b	(a0)+,d5
		lsl.w	#8,d5
		move.b	(a0)+,d5

locret_74E60:
		rts
; ---------------------------------------------------------------------------
		dc.w 1
		dc.w 3
		dc.w 7
		dc.w $F
		dc.w $1F
		dc.w $3F
		dc.w $7F
		dc.w $FF
		dc.w $1FF
		dc.w $3FF
		dc.w $7FF
		dc.w $FFF
		dc.w $1FFF
		dc.w $3FFF
		dc.w $7FFF
		dc.w $FFFF