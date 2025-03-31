	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 12, 0	sdk_version 12, 1
	.globl	__Z5parseRNSt3__114basic_ifstreamIcNS_11char_traitsIcEEEE ; -- Begin function _Z5parseRNSt3__114basic_ifstreamIcNS_11char_traitsIcEEEE
	.p2align	2
__Z5parseRNSt3__114basic_ifstreamIcNS_11char_traitsIcEEEE: ; @_Z5parseRNSt3__114basic_ifstreamIcNS_11char_traitsIcEEEE
Lfunc_begin0:
	.cfi_startproc
	.cfi_personality 155, ___gxx_personality_v0
	.cfi_lsda 16, Lexception0
; %bb.0:
	stp	x28, x27, [sp, #-96]!           ; 16-byte Folded Spill
	stp	x26, x25, [sp, #16]             ; 16-byte Folded Spill
	stp	x24, x23, [sp, #32]             ; 16-byte Folded Spill
	stp	x22, x21, [sp, #48]             ; 16-byte Folded Spill
	stp	x20, x19, [sp, #64]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #80]             ; 16-byte Folded Spill
	add	x29, sp, #80                    ; =80
	sub	sp, sp, #1056                   ; =1056
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	.cfi_offset w21, -40
	.cfi_offset w22, -48
	.cfi_offset w23, -56
	.cfi_offset w24, -64
	.cfi_offset w25, -72
	.cfi_offset w26, -80
	.cfi_offset w27, -88
	.cfi_offset w28, -96
	mov	x22, x0
	mov	x26, x8
Lloh0:
	adrp	x8, ___stack_chk_guard@GOTPAGE
Lloh1:
	ldr	x8, [x8, ___stack_chk_guard@GOTPAGEOFF]
Lloh2:
	ldr	x8, [x8]
	stur	x8, [x29, #-96]
	mov	x1, #0
	mov	w2, #2
	bl	__ZNSt3__113basic_istreamIcNS_11char_traitsIcEEE5seekgExNS_8ios_base7seekdirE
	add	x8, sp, #16                     ; =16
	mov	x0, x22
	bl	__ZNSt3__113basic_istreamIcNS_11char_traitsIcEEE5tellgEv
	ldr	x20, [sp, #144]
	mov	x0, x22
	mov	x1, #0
	mov	w2, #0
	bl	__ZNSt3__113basic_istreamIcNS_11char_traitsIcEEE5seekgExNS_8ios_base7seekdirE
	cmp	x20, #0                         ; =0
	csinv	x0, x20, xzr, ge
	bl	__Znam
	mov	x21, x0
	mov	x0, x22
	mov	x1, x21
	mov	x2, x20
	bl	__ZNSt3__113basic_istreamIcNS_11char_traitsIcEEE4readEPcl
	ldr	x24, [x22, #136]
	cbz	x24, LBB0_3
; %bb.1:
	add	x23, x22, #16                   ; =16
	ldr	x8, [x23]
	ldr	x8, [x8, #48]
Ltmp0:
	mov	x0, x23
	blr	x8
Ltmp1:
; %bb.2:
	mov	x25, x0
	mov	x0, x24
	bl	_fclose
	orr	w19, w0, w25
	str	xzr, [x22, #136]
	ldr	x8, [x22, #16]
	ldr	x8, [x8, #24]
	mov	x0, x23
	mov	x1, #0
	mov	x2, #0
	blr	x8
	cbz	w19, LBB0_4
LBB0_3:
	ldr	x8, [x22]
	ldur	x8, [x8, #-24]
	add	x0, x22, x8
	ldr	w8, [x0, #32]
	orr	w1, w8, #0x4
	bl	__ZNSt3__18ios_base5clearEj
LBB0_4:
	str	x26, [sp, #8]                   ; 8-byte Folded Spill
	strb	wzr, [sp, #16]
	add	x8, x20, #3                     ; =3
	cmp	x20, #0                         ; =0
	csel	x8, x8, x20, lt
	asr	x8, x8, #2
	lsl	x9, x8, #5
	cmp	xzr, x8, lsr #59
	csinv	x0, x9, xzr, eq
	bl	__Znam
	mov	x22, x0
	cbz	x20, LBB0_31
; %bb.5:
	mov	x8, #0
	mov	x24, #0
	mov	w25, #0
	add	x26, x21, #1                    ; =1
	mov	w27, #12408
	mov	w28, #12409
	b	LBB0_9
LBB0_6:                                 ;   in Loop: Header=BB0_9 Depth=1
	add	x8, x22, x24, lsl #5
	stur	d0, [x8, #-32]
LBB0_7:                                 ;   in Loop: Header=BB0_9 Depth=1
	mov	x8, x23
LBB0_8:                                 ;   in Loop: Header=BB0_9 Depth=1
	add	x8, x8, #1                      ; =1
	cmp	x8, x20
	b.hs	LBB0_32
LBB0_9:                                 ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB0_28 Depth 2
                                        ;     Child Loop BB0_12 Depth 2
	ldrsb	w9, [x21, x8]
	sub	w10, w9, #48                    ; =48
	cmp	w10, #10                        ; =10
	b.hs	LBB0_18
LBB0_10:                                ;   in Loop: Header=BB0_9 Depth=1
	and	w19, w9, #0xff
	sub	w9, w19, #48                    ; =48
	sub	w10, w19, #45                   ; =45
	cmp	w9, #10                         ; =10
	and	w9, w10, #0xff
	ccmp	w9, #1, #0, hs
	mov	x23, x8
	b.hi	LBB0_13
; %bb.11:                               ;   in Loop: Header=BB0_9 Depth=1
	mov	x23, x8
LBB0_12:                                ;   Parent Loop BB0_9 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldrb	w19, [x26, x23]
	add	x23, x23, #1                    ; =1
	sub	w9, w19, #48                    ; =48
	sub	w10, w19, #45                   ; =45
	cmp	w9, #10                         ; =10
	and	w9, w10, #0xff
	ccmp	w9, #2, #0, hs
	b.lo	LBB0_12
LBB0_13:                                ;   in Loop: Header=BB0_9 Depth=1
	strb	wzr, [x21, x23]
	add	x0, x21, w8, sxtw
	bl	_atof
	strb	w19, [x21, x23]
	ldrh	w8, [sp, #16]
	eor	w8, w8, w27
	ldrb	w9, [sp, #18]
	orr	w8, w8, w9
	tst	w8, #0xffff
	b.eq	LBB0_6
; %bb.14:                               ;   in Loop: Header=BB0_9 Depth=1
	ldrh	w8, [sp, #16]
	eor	w8, w8, w28
	ldrb	w9, [sp, #18]
	orr	w8, w8, w9
	tst	w8, #0xffff
	b.eq	LBB0_22
; %bb.15:                               ;   in Loop: Header=BB0_9 Depth=1
	ldrh	w8, [sp, #16]
	mov	w9, #12664
	eor	w8, w8, w9
	ldrb	w9, [sp, #18]
	orr	w8, w8, w9
	tst	w8, #0xffff
	b.eq	LBB0_25
; %bb.16:                               ;   in Loop: Header=BB0_9 Depth=1
	ldrh	w8, [sp, #16]
	mov	w9, #12665
	eor	w8, w8, w9
	ldrb	w9, [sp, #18]
	orr	w8, w8, w9
	tst	w8, #0xffff
	b.ne	LBB0_7
; %bb.17:                               ;   in Loop: Header=BB0_9 Depth=1
	add	x8, x22, x24, lsl #5
	stur	d0, [x8, #-8]
	b	LBB0_7
LBB0_18:                                ;   in Loop: Header=BB0_9 Depth=1
	cmp	w9, #90                         ; =90
	b.le	LBB0_23
; %bb.19:                               ;   in Loop: Header=BB0_9 Depth=1
	cmp	w9, #91                         ; =91
	b.eq	LBB0_26
; %bb.20:                               ;   in Loop: Header=BB0_9 Depth=1
	cmp	w9, #123                        ; =123
	b.ne	LBB0_30
; %bb.21:                               ;   in Loop: Header=BB0_9 Depth=1
	and	x9, x25, #0x1
	add	x24, x24, x9
	b	LBB0_8
LBB0_22:                                ;   in Loop: Header=BB0_9 Depth=1
	add	x8, x22, x24, lsl #5
	stur	d0, [x8, #-24]
	b	LBB0_7
LBB0_23:                                ;   in Loop: Header=BB0_9 Depth=1
	cmp	w9, #34                         ; =34
	b.eq	LBB0_27
; %bb.24:                               ;   in Loop: Header=BB0_9 Depth=1
	cmp	w9, #45                         ; =45
	b.eq	LBB0_10
	b	LBB0_8
LBB0_25:                                ;   in Loop: Header=BB0_9 Depth=1
	add	x8, x22, x24, lsl #5
	stur	d0, [x8, #-16]
	b	LBB0_7
LBB0_26:                                ;   in Loop: Header=BB0_9 Depth=1
	ldr	w9, [sp, #16]
	mov	w10, #24944
	movk	w10, #29289, lsl #16
	eor	w9, w9, w10
	ldrh	w10, [sp, #20]
	mov	w11, #115
	eor	w10, w10, w11
	orr	w9, w9, w10
	cmp	w9, #0                          ; =0
	cset	w9, eq
	orr	w25, w25, w9
	b	LBB0_8
LBB0_27:                                ;   in Loop: Header=BB0_9 Depth=1
	add	x9, x8, #1                      ; =1
	mov	x19, x8
LBB0_28:                                ;   Parent Loop BB0_9 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldrb	w10, [x26, x19]
	add	x19, x19, #1                    ; =1
	cmp	w10, #34                        ; =34
	b.ne	LBB0_28
; %bb.29:                               ;   in Loop: Header=BB0_9 Depth=1
	add	x1, x21, w9, sxtw
	add	w8, w8, #1                      ; =1
	sub	x23, x19, w8, sxtw
	add	x0, sp, #16                     ; =16
	mov	x2, x23
	bl	_memcpy
	add	x8, sp, #16                     ; =16
	strb	wzr, [x8, w23, sxtw]
	add	x8, x19, #1                     ; =1
	b	LBB0_8
LBB0_30:                                ;   in Loop: Header=BB0_9 Depth=1
	cmp	w9, #93                         ; =93
	b.ne	LBB0_8
	b	LBB0_32
LBB0_31:
	mov	x24, #0
LBB0_32:
	mov	x0, x21
	bl	__ZdaPv
	ldr	x8, [sp, #8]                    ; 8-byte Folded Reload
	stp	x24, x20, [x8]
	str	x22, [x8, #16]
	ldur	x8, [x29, #-96]
Lloh3:
	adrp	x9, ___stack_chk_guard@GOTPAGE
Lloh4:
	ldr	x9, [x9, ___stack_chk_guard@GOTPAGEOFF]
Lloh5:
	ldr	x9, [x9]
	cmp	x9, x8
	b.ne	LBB0_34
; %bb.33:
	add	sp, sp, #1056                   ; =1056
	ldp	x29, x30, [sp, #80]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #64]             ; 16-byte Folded Reload
	ldp	x22, x21, [sp, #48]             ; 16-byte Folded Reload
	ldp	x24, x23, [sp, #32]             ; 16-byte Folded Reload
	ldp	x26, x25, [sp, #16]             ; 16-byte Folded Reload
	ldp	x28, x27, [sp], #96             ; 16-byte Folded Reload
	ret
LBB0_34:
	bl	___stack_chk_fail
LBB0_35:
Ltmp2:
	mov	x19, x0
	mov	x0, x24
	bl	_fclose
	mov	x0, x19
	bl	__Unwind_Resume
	.loh AdrpLdrGotLdr	Lloh0, Lloh1, Lloh2
	.loh AdrpLdrGotLdr	Lloh3, Lloh4, Lloh5
Lfunc_end0:
	.cfi_endproc
	.section	__TEXT,__gcc_except_tab
	.p2align	2
GCC_except_table0:
Lexception0:
	.byte	255                             ; @LPStart Encoding = omit
	.byte	255                             ; @TType Encoding = omit
	.byte	1                               ; Call site Encoding = uleb128
	.uleb128 Lcst_end0-Lcst_begin0
Lcst_begin0:
	.uleb128 Lfunc_begin0-Lfunc_begin0      ; >> Call Site 1 <<
	.uleb128 Ltmp0-Lfunc_begin0             ;   Call between Lfunc_begin0 and Ltmp0
	.byte	0                               ;     has no landing pad
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp0-Lfunc_begin0             ; >> Call Site 2 <<
	.uleb128 Ltmp1-Ltmp0                    ;   Call between Ltmp0 and Ltmp1
	.uleb128 Ltmp2-Lfunc_begin0             ;     jumps to Ltmp2
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp1-Lfunc_begin0             ; >> Call Site 3 <<
	.uleb128 Lfunc_end0-Ltmp1               ;   Call between Ltmp1 and Lfunc_end0
	.byte	0                               ;     has no landing pad
	.byte	0                               ;   On action: cleanup
Lcst_end0:
	.p2align	2
                                        ; -- End function
	.section	__TEXT,__text,regular,pure_instructions
	.private_extern	___clang_call_terminate ; -- Begin function __clang_call_terminate
	.globl	___clang_call_terminate
	.weak_def_can_be_hidden	___clang_call_terminate
	.p2align	2
___clang_call_terminate:                ; @__clang_call_terminate
; %bb.0:
	stp	x29, x30, [sp, #-16]!           ; 16-byte Folded Spill
	bl	___cxa_begin_catch
	bl	__ZSt9terminatev
                                        ; -- End function
	.globl	_main                           ; -- Begin function main
	.p2align	2
_main:                                  ; @main
Lfunc_begin1:
	.cfi_startproc
	.cfi_personality 155, ___gxx_personality_v0
	.cfi_lsda 16, Lexception1
; %bb.0:
	stp	d13, d12, [sp, #-144]!          ; 16-byte Folded Spill
	stp	d11, d10, [sp, #16]             ; 16-byte Folded Spill
	stp	d9, d8, [sp, #32]               ; 16-byte Folded Spill
	stp	x28, x27, [sp, #48]             ; 16-byte Folded Spill
	stp	x26, x25, [sp, #64]             ; 16-byte Folded Spill
	stp	x24, x23, [sp, #80]             ; 16-byte Folded Spill
	stp	x22, x21, [sp, #96]             ; 16-byte Folded Spill
	stp	x20, x19, [sp, #112]            ; 16-byte Folded Spill
	stp	x29, x30, [sp, #128]            ; 16-byte Folded Spill
	add	x29, sp, #128                   ; =128
	sub	sp, sp, #656                    ; =656
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	.cfi_offset w21, -40
	.cfi_offset w22, -48
	.cfi_offset w23, -56
	.cfi_offset w24, -64
	.cfi_offset w25, -72
	.cfi_offset w26, -80
	.cfi_offset w27, -88
	.cfi_offset w28, -96
	.cfi_offset b8, -104
	.cfi_offset b9, -112
	.cfi_offset b10, -120
	.cfi_offset b11, -128
	.cfi_offset b12, -136
	.cfi_offset b13, -144
Lloh6:
	adrp	x8, ___stack_chk_guard@GOTPAGE
Lloh7:
	ldr	x8, [x8, ___stack_chk_guard@GOTPAGEOFF]
Lloh8:
	ldr	x8, [x8]
	stur	x8, [x29, #-144]
	cmp	w0, #2                          ; =2
	b.ne	LBB2_5
; %bb.1:
	; InlineAsm Start
	mrs	x23, CNTVCT_EL0
	; InlineAsm End
	ldr	x21, [x1, #8]
	add	x8, sp, #64                     ; =64
	add	x0, x8, #424                    ; =424
Lloh9:
	adrp	x9, __ZTCNSt3__114basic_ifstreamIcNS_11char_traitsIcEEEE0_NS_13basic_istreamIcS2_EE@GOTPAGE
Lloh10:
	ldr	x9, [x9, __ZTCNSt3__114basic_ifstreamIcNS_11char_traitsIcEEEE0_NS_13basic_istreamIcS2_EE@GOTPAGEOFF]
	add	x20, x8, #16                    ; =16
	add	x8, x9, #64                     ; =64
	str	x8, [sp, #488]
	add	x8, x9, #24                     ; =24
	stp	x8, xzr, [sp, #64]
Ltmp3:
	str	x0, [sp, #32]                   ; 8-byte Folded Spill
	mov	x1, x20
	bl	__ZNSt3__18ios_base4initEPv
Ltmp4:
; %bb.2:
	str	xzr, [sp, #624]
	mov	w8, #-1
	str	w8, [sp, #632]
Lloh11:
	adrp	x22, __ZTVNSt3__114basic_ifstreamIcNS_11char_traitsIcEEEE@GOTPAGE
Lloh12:
	ldr	x22, [x22, __ZTVNSt3__114basic_ifstreamIcNS_11char_traitsIcEEEE@GOTPAGEOFF]
	add	x8, x22, #24                    ; =24
	add	x9, x22, #64                    ; =64
	str	x8, [sp, #64]
	str	x9, [sp, #488]
Ltmp6:
	mov	x0, x20
	bl	__ZNSt3__113basic_filebufIcNS_11char_traitsIcEEEC2Ev
Ltmp7:
; %bb.3:
	ldr	x8, [sp, #200]
	cbz	x8, LBB2_6
LBB2_4:
	ldr	x8, [sp, #64]
	ldur	x8, [x8, #-24]
	add	x9, sp, #64                     ; =64
	add	x0, x9, x8
	ldr	w8, [x0, #32]
	orr	w1, w8, #0x4
Ltmp11:
	bl	__ZNSt3__18ios_base5clearEj
Ltmp12:
	b	LBB2_9
LBB2_5:
Lloh13:
	adrp	x8, ___stderrp@GOTPAGE
Lloh14:
	ldr	x8, [x8, ___stderrp@GOTPAGEOFF]
Lloh15:
	ldr	x0, [x8]
	ldr	x8, [x1]
	str	x8, [sp]
Lloh16:
	adrp	x1, l_.str.6@PAGE
Lloh17:
	add	x1, x1, l_.str.6@PAGEOFF
	bl	_fprintf
	mov	w0, #1
	b	LBB2_19
LBB2_6:
Ltmp9:
Lloh18:
	adrp	x1, l_.str.15@PAGE
Lloh19:
	add	x1, x1, l_.str.15@PAGEOFF
	mov	x0, x21
	bl	_fopen
Ltmp10:
; %bb.7:
	str	x0, [sp, #200]
	cbz	x0, LBB2_4
; %bb.8:
	mov	w8, #8
	str	w8, [sp, #472]
LBB2_9:
Ltmp21:
	add	x8, sp, #40                     ; =40
	add	x0, sp, #64                     ; =64
	bl	__Z5parseRNSt3__114basic_ifstreamIcNS_11char_traitsIcEEEE
Ltmp22:
; %bb.10:
	; InlineAsm Start
	mrs	x24, CNTVCT_EL0
	; InlineAsm End
	ldr	x8, [sp, #48]
	str	x8, [sp]
Lloh20:
	adrp	x0, l_.str.7@PAGE
Lloh21:
	add	x0, x0, l_.str.7@PAGEOFF
	bl	_printf
	ldr	x25, [sp, #40]
	str	x25, [sp]
Lloh22:
	adrp	x0, l_.str.8@PAGE
Lloh23:
	add	x0, x0, l_.str.8@PAGEOFF
	bl	_printf
	ldr	x21, [sp, #56]
	cbz	x25, LBB2_13
; %bb.11:
	mov	x26, #0
	add	x27, x21, #16                   ; =16
	movi.2d	v10, #0000000000000000
	mov	x28, #40249
	movk	x28, #41554, lsl #16
	movk	x28, #57158, lsl #32
	movk	x28, #16273, lsl #48
	fmov	d11, #0.50000000
	mov	x19, #52429
	movk	x19, #52428, lsl #16
	movk	x19, #58572, lsl #32
	movk	x19, #16568, lsl #48
LBB2_12:                                ; =>This Inner Loop Header: Depth=1
	ldp	d0, d1, [x27, #-16]
	ldp	d2, d3, [x27], #32
	fsub	d4, d3, d1
	fmov	d5, x28
	fmul	d4, d4, d5
	fsub	d0, d2, d0
	fmul	d12, d0, d5
	fmul	d8, d1, d5
	fmul	d9, d3, d5
	fmul	d0, d4, d11
	bl	_sin
	fmul	d13, d0, d0
	mov.16b	v0, v8
	bl	_cos
	mov.16b	v8, v0
	mov.16b	v0, v9
	bl	_cos
	fmul	d8, d8, d0
	fmul	d0, d12, d11
	bl	_sin
	fmul	d0, d0, d0
	fmul	d0, d8, d0
	fadd	d0, d13, d0
	fsqrt	d0, d0
	bl	_asin
	fadd	d0, d0, d0
	fmov	d1, x19
	fmul	d0, d0, d1
	add	x26, x26, #1                    ; =1
	fsub	d0, d0, d10
	ucvtf	d1, x26
	fdiv	d0, d0, d1
	fadd	d10, d10, d0
	cmp	x25, x26
	b.ne	LBB2_12
	b	LBB2_14
LBB2_13:
	movi.2d	v10, #0000000000000000
LBB2_14:
	; InlineAsm Start
	mrs	x8, CNTVCT_EL0
	; InlineAsm End
	sub	x19, x8, x23
	sub	x23, x24, x23
	sub	x24, x8, x24
	stp	x23, x24, [sp, #8]
	str	x19, [sp]
Lloh24:
	adrp	x0, l_.str.9@PAGE
Lloh25:
	add	x0, x0, l_.str.9@PAGEOFF
	bl	_printf
	ucvtf	d0, x23
	ucvtf	d1, x19
	fdiv	d0, d0, d1
	ucvtf	d2, x24
	fdiv	d1, d2, d1
	stp	d0, d1, [sp]
Lloh26:
	adrp	x0, l_.str.10@PAGE
Lloh27:
	add	x0, x0, l_.str.10@PAGEOFF
	bl	_printf
	str	d10, [sp]
Lloh28:
	adrp	x0, l_.str.11@PAGE
Lloh29:
	add	x0, x0, l_.str.11@PAGEOFF
	bl	_printf
	cbz	x21, LBB2_16
; %bb.15:
	mov	x0, x21
	bl	__ZdaPv
LBB2_16:
	add	x8, x22, #24                    ; =24
	add	x9, x22, #64                    ; =64
	str	x8, [sp, #64]
	str	x9, [sp, #488]
Ltmp39:
	mov	x0, x20
	bl	__ZNSt3__113basic_filebufIcNS_11char_traitsIcEEED2Ev
Ltmp40:
; %bb.17:
Ltmp45:
Lloh30:
	adrp	x8, __ZTTNSt3__114basic_ifstreamIcNS_11char_traitsIcEEEE@GOTPAGE
Lloh31:
	ldr	x8, [x8, __ZTTNSt3__114basic_ifstreamIcNS_11char_traitsIcEEEE@GOTPAGEOFF]
	add	x1, x8, #8                      ; =8
	add	x0, sp, #64                     ; =64
	bl	__ZNSt3__113basic_istreamIcNS_11char_traitsIcEEED2Ev
Ltmp46:
; %bb.18:
	ldr	x0, [sp, #32]                   ; 8-byte Folded Reload
	bl	__ZNSt3__19basic_iosIcNS_11char_traitsIcEEED2Ev
	mov	w0, #0
LBB2_19:
	ldur	x8, [x29, #-144]
Lloh32:
	adrp	x9, ___stack_chk_guard@GOTPAGE
Lloh33:
	ldr	x9, [x9, ___stack_chk_guard@GOTPAGEOFF]
Lloh34:
	ldr	x9, [x9]
	cmp	x9, x8
	b.ne	LBB2_21
; %bb.20:
	add	sp, sp, #656                    ; =656
	ldp	x29, x30, [sp, #128]            ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #112]            ; 16-byte Folded Reload
	ldp	x22, x21, [sp, #96]             ; 16-byte Folded Reload
	ldp	x24, x23, [sp, #80]             ; 16-byte Folded Reload
	ldp	x26, x25, [sp, #64]             ; 16-byte Folded Reload
	ldp	x28, x27, [sp, #48]             ; 16-byte Folded Reload
	ldp	d9, d8, [sp, #32]               ; 16-byte Folded Reload
	ldp	d11, d10, [sp, #16]             ; 16-byte Folded Reload
	ldp	d13, d12, [sp], #144            ; 16-byte Folded Reload
	ret
LBB2_21:
	bl	___stack_chk_fail
LBB2_22:
Ltmp47:
	mov	x21, x0
	b	LBB2_24
LBB2_23:
Ltmp41:
	mov	x21, x0
Ltmp42:
Lloh35:
	adrp	x8, __ZTTNSt3__114basic_ifstreamIcNS_11char_traitsIcEEEE@GOTPAGE
Lloh36:
	ldr	x8, [x8, __ZTTNSt3__114basic_ifstreamIcNS_11char_traitsIcEEEE@GOTPAGEOFF]
	add	x1, x8, #8                      ; =8
	add	x0, sp, #64                     ; =64
	bl	__ZNSt3__113basic_istreamIcNS_11char_traitsIcEEED2Ev
Ltmp43:
LBB2_24:
Ltmp48:
	ldr	x0, [sp, #32]                   ; 8-byte Folded Reload
	bl	__ZNSt3__19basic_iosIcNS_11char_traitsIcEEED2Ev
Ltmp49:
	b	LBB2_42
LBB2_25:
Ltmp44:
	bl	___clang_call_terminate
LBB2_26:
Ltmp50:
	bl	___clang_call_terminate
LBB2_27:
Ltmp23:
	mov	x21, x0
	add	x8, x22, #24                    ; =24
	add	x9, x22, #64                    ; =64
	str	x8, [sp, #64]
	str	x9, [sp, #488]
Ltmp24:
	mov	x0, x20
	bl	__ZNSt3__113basic_filebufIcNS_11char_traitsIcEEED2Ev
Ltmp25:
; %bb.28:
Ltmp30:
Lloh37:
	adrp	x8, __ZTTNSt3__114basic_ifstreamIcNS_11char_traitsIcEEEE@GOTPAGE
Lloh38:
	ldr	x8, [x8, __ZTTNSt3__114basic_ifstreamIcNS_11char_traitsIcEEEE@GOTPAGEOFF]
	add	x1, x8, #8                      ; =8
	add	x0, sp, #64                     ; =64
	bl	__ZNSt3__113basic_istreamIcNS_11char_traitsIcEEED2Ev
Ltmp31:
; %bb.29:
Ltmp36:
	ldr	x0, [sp, #32]                   ; 8-byte Folded Reload
	bl	__ZNSt3__19basic_iosIcNS_11char_traitsIcEEED2Ev
Ltmp37:
	b	LBB2_42
LBB2_30:
Ltmp38:
	mov	x20, x0
	b	LBB2_34
LBB2_31:
Ltmp32:
	mov	x20, x0
	b	LBB2_33
LBB2_32:
Ltmp26:
	mov	x20, x0
Ltmp27:
Lloh39:
	adrp	x8, __ZTTNSt3__114basic_ifstreamIcNS_11char_traitsIcEEEE@GOTPAGE
Lloh40:
	ldr	x8, [x8, __ZTTNSt3__114basic_ifstreamIcNS_11char_traitsIcEEEE@GOTPAGEOFF]
	add	x1, x8, #8                      ; =8
	add	x0, sp, #64                     ; =64
	bl	__ZNSt3__113basic_istreamIcNS_11char_traitsIcEEED2Ev
Ltmp28:
LBB2_33:
Ltmp33:
	ldr	x0, [sp, #32]                   ; 8-byte Folded Reload
	bl	__ZNSt3__19basic_iosIcNS_11char_traitsIcEEED2Ev
Ltmp34:
LBB2_34:
	mov	x0, x20
	bl	___clang_call_terminate
LBB2_35:
Ltmp29:
	bl	___clang_call_terminate
LBB2_36:
Ltmp35:
	bl	___clang_call_terminate
LBB2_37:
Ltmp8:
	mov	x21, x0
	b	LBB2_40
LBB2_38:
Ltmp5:
	mov	x21, x0
	b	LBB2_41
LBB2_39:
Ltmp13:
	mov	x21, x0
Ltmp14:
	mov	x0, x20
	bl	__ZNSt3__113basic_filebufIcNS_11char_traitsIcEEED2Ev
Ltmp15:
LBB2_40:
Ltmp16:
Lloh41:
	adrp	x8, __ZTTNSt3__114basic_ifstreamIcNS_11char_traitsIcEEEE@GOTPAGE
Lloh42:
	ldr	x8, [x8, __ZTTNSt3__114basic_ifstreamIcNS_11char_traitsIcEEEE@GOTPAGEOFF]
	add	x1, x8, #8                      ; =8
	add	x0, sp, #64                     ; =64
	bl	__ZNSt3__113basic_istreamIcNS_11char_traitsIcEEED2Ev
Ltmp17:
LBB2_41:
Ltmp18:
	ldr	x0, [sp, #32]                   ; 8-byte Folded Reload
	bl	__ZNSt3__19basic_iosIcNS_11char_traitsIcEEED2Ev
Ltmp19:
LBB2_42:
	mov	x0, x21
	bl	__Unwind_Resume
LBB2_43:
Ltmp20:
	bl	___clang_call_terminate
	.loh AdrpLdrGotLdr	Lloh6, Lloh7, Lloh8
	.loh AdrpLdrGot	Lloh9, Lloh10
	.loh AdrpLdrGot	Lloh11, Lloh12
	.loh AdrpAdd	Lloh16, Lloh17
	.loh AdrpLdrGotLdr	Lloh13, Lloh14, Lloh15
	.loh AdrpAdd	Lloh18, Lloh19
	.loh AdrpAdd	Lloh22, Lloh23
	.loh AdrpAdd	Lloh20, Lloh21
	.loh AdrpAdd	Lloh28, Lloh29
	.loh AdrpAdd	Lloh26, Lloh27
	.loh AdrpAdd	Lloh24, Lloh25
	.loh AdrpLdrGot	Lloh30, Lloh31
	.loh AdrpLdrGotLdr	Lloh32, Lloh33, Lloh34
	.loh AdrpLdrGot	Lloh35, Lloh36
	.loh AdrpLdrGot	Lloh37, Lloh38
	.loh AdrpLdrGot	Lloh39, Lloh40
	.loh AdrpLdrGot	Lloh41, Lloh42
Lfunc_end1:
	.cfi_endproc
	.section	__TEXT,__gcc_except_tab
	.p2align	2
GCC_except_table2:
Lexception1:
	.byte	255                             ; @LPStart Encoding = omit
	.byte	155                             ; @TType Encoding = indirect pcrel sdata4
	.uleb128 Lttbase0-Lttbaseref0
Lttbaseref0:
	.byte	1                               ; Call site Encoding = uleb128
	.uleb128 Lcst_end1-Lcst_begin1
Lcst_begin1:
	.uleb128 Ltmp3-Lfunc_begin1             ; >> Call Site 1 <<
	.uleb128 Ltmp4-Ltmp3                    ;   Call between Ltmp3 and Ltmp4
	.uleb128 Ltmp5-Lfunc_begin1             ;     jumps to Ltmp5
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp6-Lfunc_begin1             ; >> Call Site 2 <<
	.uleb128 Ltmp7-Ltmp6                    ;   Call between Ltmp6 and Ltmp7
	.uleb128 Ltmp8-Lfunc_begin1             ;     jumps to Ltmp8
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp11-Lfunc_begin1            ; >> Call Site 3 <<
	.uleb128 Ltmp10-Ltmp11                  ;   Call between Ltmp11 and Ltmp10
	.uleb128 Ltmp13-Lfunc_begin1            ;     jumps to Ltmp13
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp21-Lfunc_begin1            ; >> Call Site 4 <<
	.uleb128 Ltmp22-Ltmp21                  ;   Call between Ltmp21 and Ltmp22
	.uleb128 Ltmp23-Lfunc_begin1            ;     jumps to Ltmp23
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp22-Lfunc_begin1            ; >> Call Site 5 <<
	.uleb128 Ltmp39-Ltmp22                  ;   Call between Ltmp22 and Ltmp39
	.byte	0                               ;     has no landing pad
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp39-Lfunc_begin1            ; >> Call Site 6 <<
	.uleb128 Ltmp40-Ltmp39                  ;   Call between Ltmp39 and Ltmp40
	.uleb128 Ltmp41-Lfunc_begin1            ;     jumps to Ltmp41
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp45-Lfunc_begin1            ; >> Call Site 7 <<
	.uleb128 Ltmp46-Ltmp45                  ;   Call between Ltmp45 and Ltmp46
	.uleb128 Ltmp47-Lfunc_begin1            ;     jumps to Ltmp47
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp46-Lfunc_begin1            ; >> Call Site 8 <<
	.uleb128 Ltmp42-Ltmp46                  ;   Call between Ltmp46 and Ltmp42
	.byte	0                               ;     has no landing pad
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp42-Lfunc_begin1            ; >> Call Site 9 <<
	.uleb128 Ltmp43-Ltmp42                  ;   Call between Ltmp42 and Ltmp43
	.uleb128 Ltmp44-Lfunc_begin1            ;     jumps to Ltmp44
	.byte	1                               ;   On action: 1
	.uleb128 Ltmp48-Lfunc_begin1            ; >> Call Site 10 <<
	.uleb128 Ltmp49-Ltmp48                  ;   Call between Ltmp48 and Ltmp49
	.uleb128 Ltmp50-Lfunc_begin1            ;     jumps to Ltmp50
	.byte	1                               ;   On action: 1
	.uleb128 Ltmp24-Lfunc_begin1            ; >> Call Site 11 <<
	.uleb128 Ltmp25-Ltmp24                  ;   Call between Ltmp24 and Ltmp25
	.uleb128 Ltmp26-Lfunc_begin1            ;     jumps to Ltmp26
	.byte	1                               ;   On action: 1
	.uleb128 Ltmp30-Lfunc_begin1            ; >> Call Site 12 <<
	.uleb128 Ltmp31-Ltmp30                  ;   Call between Ltmp30 and Ltmp31
	.uleb128 Ltmp32-Lfunc_begin1            ;     jumps to Ltmp32
	.byte	1                               ;   On action: 1
	.uleb128 Ltmp36-Lfunc_begin1            ; >> Call Site 13 <<
	.uleb128 Ltmp37-Ltmp36                  ;   Call between Ltmp36 and Ltmp37
	.uleb128 Ltmp38-Lfunc_begin1            ;     jumps to Ltmp38
	.byte	1                               ;   On action: 1
	.uleb128 Ltmp27-Lfunc_begin1            ; >> Call Site 14 <<
	.uleb128 Ltmp28-Ltmp27                  ;   Call between Ltmp27 and Ltmp28
	.uleb128 Ltmp29-Lfunc_begin1            ;     jumps to Ltmp29
	.byte	1                               ;   On action: 1
	.uleb128 Ltmp33-Lfunc_begin1            ; >> Call Site 15 <<
	.uleb128 Ltmp34-Ltmp33                  ;   Call between Ltmp33 and Ltmp34
	.uleb128 Ltmp35-Lfunc_begin1            ;     jumps to Ltmp35
	.byte	1                               ;   On action: 1
	.uleb128 Ltmp14-Lfunc_begin1            ; >> Call Site 16 <<
	.uleb128 Ltmp19-Ltmp14                  ;   Call between Ltmp14 and Ltmp19
	.uleb128 Ltmp20-Lfunc_begin1            ;     jumps to Ltmp20
	.byte	1                               ;   On action: 1
	.uleb128 Ltmp19-Lfunc_begin1            ; >> Call Site 17 <<
	.uleb128 Lfunc_end1-Ltmp19              ;   Call between Ltmp19 and Lfunc_end1
	.byte	0                               ;     has no landing pad
	.byte	0                               ;   On action: cleanup
Lcst_end1:
	.byte	1                               ; >> Action Record 1 <<
                                        ;   Catch TypeInfo 1
	.byte	0                               ;   No further actions
	.p2align	2
                                        ; >> Catch TypeInfos <<
	.long	0                               ; TypeInfo 1
Lttbase0:
	.p2align	2
                                        ; -- End function
	.section	__TEXT,__text,regular,pure_instructions
	.globl	__ZNSt3__114basic_ifstreamIcNS_11char_traitsIcEEED1Ev ; -- Begin function _ZNSt3__114basic_ifstreamIcNS_11char_traitsIcEEED1Ev
	.weak_def_can_be_hidden	__ZNSt3__114basic_ifstreamIcNS_11char_traitsIcEEED1Ev
	.p2align	2
__ZNSt3__114basic_ifstreamIcNS_11char_traitsIcEEED1Ev: ; @_ZNSt3__114basic_ifstreamIcNS_11char_traitsIcEEED1Ev
Lfunc_begin2:
	.cfi_startproc
	.cfi_personality 155, ___gxx_personality_v0
	.cfi_lsda 16, Lexception2
; %bb.0:
	stp	x20, x19, [sp, #-32]!           ; 16-byte Folded Spill
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	add	x29, sp, #16                    ; =16
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	mov	x19, x0
Lloh43:
	adrp	x8, __ZTVNSt3__114basic_ifstreamIcNS_11char_traitsIcEEEE@GOTPAGE
Lloh44:
	ldr	x8, [x8, __ZTVNSt3__114basic_ifstreamIcNS_11char_traitsIcEEEE@GOTPAGEOFF]
	add	x9, x8, #24                     ; =24
	str	x9, [x0]
	add	x8, x8, #64                     ; =64
	str	x8, [x0, #424]
	add	x0, x0, #16                     ; =16
Ltmp51:
	bl	__ZNSt3__113basic_filebufIcNS_11char_traitsIcEEED2Ev
Ltmp52:
; %bb.1:
Ltmp57:
Lloh45:
	adrp	x8, __ZTTNSt3__114basic_ifstreamIcNS_11char_traitsIcEEEE@GOTPAGE
Lloh46:
	ldr	x8, [x8, __ZTTNSt3__114basic_ifstreamIcNS_11char_traitsIcEEEE@GOTPAGEOFF]
	add	x1, x8, #8                      ; =8
	mov	x0, x19
	bl	__ZNSt3__113basic_istreamIcNS_11char_traitsIcEEED2Ev
Ltmp58:
; %bb.2:
	add	x0, x19, #424                   ; =424
	bl	__ZNSt3__19basic_iosIcNS_11char_traitsIcEEED2Ev
	mov	x0, x19
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp], #32             ; 16-byte Folded Reload
	ret
LBB3_3:
Ltmp59:
	mov	x20, x0
	b	LBB3_5
LBB3_4:
Ltmp53:
	mov	x20, x0
Ltmp54:
Lloh47:
	adrp	x8, __ZTTNSt3__114basic_ifstreamIcNS_11char_traitsIcEEEE@GOTPAGE
Lloh48:
	ldr	x8, [x8, __ZTTNSt3__114basic_ifstreamIcNS_11char_traitsIcEEEE@GOTPAGEOFF]
	add	x1, x8, #8                      ; =8
	mov	x0, x19
	bl	__ZNSt3__113basic_istreamIcNS_11char_traitsIcEEED2Ev
Ltmp55:
LBB3_5:
	add	x0, x19, #424                   ; =424
Ltmp60:
	bl	__ZNSt3__19basic_iosIcNS_11char_traitsIcEEED2Ev
Ltmp61:
; %bb.6:
	mov	x0, x20
	bl	__Unwind_Resume
LBB3_7:
Ltmp56:
	bl	___clang_call_terminate
LBB3_8:
Ltmp62:
	bl	___clang_call_terminate
	.loh AdrpLdrGot	Lloh43, Lloh44
	.loh AdrpLdrGot	Lloh45, Lloh46
	.loh AdrpLdrGot	Lloh47, Lloh48
Lfunc_end2:
	.cfi_endproc
	.section	__TEXT,__gcc_except_tab
	.p2align	2
GCC_except_table3:
Lexception2:
	.byte	255                             ; @LPStart Encoding = omit
	.byte	155                             ; @TType Encoding = indirect pcrel sdata4
	.uleb128 Lttbase1-Lttbaseref1
Lttbaseref1:
	.byte	1                               ; Call site Encoding = uleb128
	.uleb128 Lcst_end2-Lcst_begin2
Lcst_begin2:
	.uleb128 Ltmp51-Lfunc_begin2            ; >> Call Site 1 <<
	.uleb128 Ltmp52-Ltmp51                  ;   Call between Ltmp51 and Ltmp52
	.uleb128 Ltmp53-Lfunc_begin2            ;     jumps to Ltmp53
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp57-Lfunc_begin2            ; >> Call Site 2 <<
	.uleb128 Ltmp58-Ltmp57                  ;   Call between Ltmp57 and Ltmp58
	.uleb128 Ltmp59-Lfunc_begin2            ;     jumps to Ltmp59
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp58-Lfunc_begin2            ; >> Call Site 3 <<
	.uleb128 Ltmp54-Ltmp58                  ;   Call between Ltmp58 and Ltmp54
	.byte	0                               ;     has no landing pad
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp54-Lfunc_begin2            ; >> Call Site 4 <<
	.uleb128 Ltmp55-Ltmp54                  ;   Call between Ltmp54 and Ltmp55
	.uleb128 Ltmp56-Lfunc_begin2            ;     jumps to Ltmp56
	.byte	1                               ;   On action: 1
	.uleb128 Ltmp60-Lfunc_begin2            ; >> Call Site 5 <<
	.uleb128 Ltmp61-Ltmp60                  ;   Call between Ltmp60 and Ltmp61
	.uleb128 Ltmp62-Lfunc_begin2            ;     jumps to Ltmp62
	.byte	1                               ;   On action: 1
	.uleb128 Ltmp61-Lfunc_begin2            ; >> Call Site 6 <<
	.uleb128 Lfunc_end2-Ltmp61              ;   Call between Ltmp61 and Lfunc_end2
	.byte	0                               ;     has no landing pad
	.byte	0                               ;   On action: cleanup
Lcst_end2:
	.byte	1                               ; >> Action Record 1 <<
                                        ;   Catch TypeInfo 1
	.byte	0                               ;   No further actions
	.p2align	2
                                        ; >> Catch TypeInfos <<
	.long	0                               ; TypeInfo 1
Lttbase1:
	.p2align	2
                                        ; -- End function
	.section	__TEXT,__text,regular,pure_instructions
	.globl	__ZTv0_n24_NSt3__114basic_ifstreamIcNS_11char_traitsIcEEED1Ev ; -- Begin function _ZTv0_n24_NSt3__114basic_ifstreamIcNS_11char_traitsIcEEED1Ev
	.weak_def_can_be_hidden	__ZTv0_n24_NSt3__114basic_ifstreamIcNS_11char_traitsIcEEED1Ev
	.p2align	2
__ZTv0_n24_NSt3__114basic_ifstreamIcNS_11char_traitsIcEEED1Ev: ; @_ZTv0_n24_NSt3__114basic_ifstreamIcNS_11char_traitsIcEEED1Ev
Lfunc_begin3:
	.cfi_startproc
	.cfi_personality 155, ___gxx_personality_v0
	.cfi_lsda 16, Lexception3
; %bb.0:
	stp	x22, x21, [sp, #-48]!           ; 16-byte Folded Spill
	stp	x20, x19, [sp, #16]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #32]             ; 16-byte Folded Spill
	add	x29, sp, #32                    ; =32
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	.cfi_offset w21, -40
	.cfi_offset w22, -48
	ldr	x8, [x0]
	ldur	x8, [x8, #-24]
	add	x20, x0, x8
Lloh49:
	adrp	x8, __ZTVNSt3__114basic_ifstreamIcNS_11char_traitsIcEEEE@GOTPAGE
Lloh50:
	ldr	x8, [x8, __ZTVNSt3__114basic_ifstreamIcNS_11char_traitsIcEEEE@GOTPAGEOFF]
	add	x9, x8, #24                     ; =24
	str	x9, [x20]
	add	x19, x20, #424                  ; =424
	add	x8, x8, #64                     ; =64
	str	x8, [x20, #424]
	add	x0, x20, #16                    ; =16
Ltmp63:
	bl	__ZNSt3__113basic_filebufIcNS_11char_traitsIcEEED2Ev
Ltmp64:
; %bb.1:
Ltmp69:
Lloh51:
	adrp	x8, __ZTTNSt3__114basic_ifstreamIcNS_11char_traitsIcEEEE@GOTPAGE
Lloh52:
	ldr	x8, [x8, __ZTTNSt3__114basic_ifstreamIcNS_11char_traitsIcEEEE@GOTPAGEOFF]
	add	x1, x8, #8                      ; =8
	mov	x0, x20
	bl	__ZNSt3__113basic_istreamIcNS_11char_traitsIcEEED2Ev
Ltmp70:
; %bb.2:
	mov	x0, x19
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #16]             ; 16-byte Folded Reload
	ldp	x22, x21, [sp], #48             ; 16-byte Folded Reload
	b	__ZNSt3__19basic_iosIcNS_11char_traitsIcEEED2Ev
LBB4_3:
Ltmp71:
	mov	x21, x0
	b	LBB4_5
LBB4_4:
Ltmp65:
	mov	x21, x0
Ltmp66:
Lloh53:
	adrp	x8, __ZTTNSt3__114basic_ifstreamIcNS_11char_traitsIcEEEE@GOTPAGE
Lloh54:
	ldr	x8, [x8, __ZTTNSt3__114basic_ifstreamIcNS_11char_traitsIcEEEE@GOTPAGEOFF]
	add	x1, x8, #8                      ; =8
	mov	x0, x20
	bl	__ZNSt3__113basic_istreamIcNS_11char_traitsIcEEED2Ev
Ltmp67:
LBB4_5:
Ltmp72:
	mov	x0, x19
	bl	__ZNSt3__19basic_iosIcNS_11char_traitsIcEEED2Ev
Ltmp73:
; %bb.6:
	mov	x0, x21
	bl	__Unwind_Resume
LBB4_7:
Ltmp68:
	bl	___clang_call_terminate
LBB4_8:
Ltmp74:
	bl	___clang_call_terminate
	.loh AdrpLdrGot	Lloh49, Lloh50
	.loh AdrpLdrGot	Lloh51, Lloh52
	.loh AdrpLdrGot	Lloh53, Lloh54
Lfunc_end3:
	.cfi_endproc
	.section	__TEXT,__gcc_except_tab
	.p2align	2
GCC_except_table4:
Lexception3:
	.byte	255                             ; @LPStart Encoding = omit
	.byte	155                             ; @TType Encoding = indirect pcrel sdata4
	.uleb128 Lttbase2-Lttbaseref2
Lttbaseref2:
	.byte	1                               ; Call site Encoding = uleb128
	.uleb128 Lcst_end3-Lcst_begin3
Lcst_begin3:
	.uleb128 Ltmp63-Lfunc_begin3            ; >> Call Site 1 <<
	.uleb128 Ltmp64-Ltmp63                  ;   Call between Ltmp63 and Ltmp64
	.uleb128 Ltmp65-Lfunc_begin3            ;     jumps to Ltmp65
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp69-Lfunc_begin3            ; >> Call Site 2 <<
	.uleb128 Ltmp70-Ltmp69                  ;   Call between Ltmp69 and Ltmp70
	.uleb128 Ltmp71-Lfunc_begin3            ;     jumps to Ltmp71
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp70-Lfunc_begin3            ; >> Call Site 3 <<
	.uleb128 Ltmp66-Ltmp70                  ;   Call between Ltmp70 and Ltmp66
	.byte	0                               ;     has no landing pad
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp66-Lfunc_begin3            ; >> Call Site 4 <<
	.uleb128 Ltmp67-Ltmp66                  ;   Call between Ltmp66 and Ltmp67
	.uleb128 Ltmp68-Lfunc_begin3            ;     jumps to Ltmp68
	.byte	1                               ;   On action: 1
	.uleb128 Ltmp72-Lfunc_begin3            ; >> Call Site 5 <<
	.uleb128 Ltmp73-Ltmp72                  ;   Call between Ltmp72 and Ltmp73
	.uleb128 Ltmp74-Lfunc_begin3            ;     jumps to Ltmp74
	.byte	1                               ;   On action: 1
	.uleb128 Ltmp73-Lfunc_begin3            ; >> Call Site 6 <<
	.uleb128 Lfunc_end3-Ltmp73              ;   Call between Ltmp73 and Lfunc_end3
	.byte	0                               ;     has no landing pad
	.byte	0                               ;   On action: cleanup
Lcst_end3:
	.byte	1                               ; >> Action Record 1 <<
                                        ;   Catch TypeInfo 1
	.byte	0                               ;   No further actions
	.p2align	2
                                        ; >> Catch TypeInfos <<
	.long	0                               ; TypeInfo 1
Lttbase2:
	.p2align	2
                                        ; -- End function
	.section	__TEXT,__text,regular,pure_instructions
	.globl	__ZNSt3__114basic_ifstreamIcNS_11char_traitsIcEEED0Ev ; -- Begin function _ZNSt3__114basic_ifstreamIcNS_11char_traitsIcEEED0Ev
	.weak_def_can_be_hidden	__ZNSt3__114basic_ifstreamIcNS_11char_traitsIcEEED0Ev
	.p2align	2
__ZNSt3__114basic_ifstreamIcNS_11char_traitsIcEEED0Ev: ; @_ZNSt3__114basic_ifstreamIcNS_11char_traitsIcEEED0Ev
Lfunc_begin4:
	.cfi_startproc
	.cfi_personality 155, ___gxx_personality_v0
	.cfi_lsda 16, Lexception4
; %bb.0:
	stp	x20, x19, [sp, #-32]!           ; 16-byte Folded Spill
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	add	x29, sp, #16                    ; =16
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	mov	x19, x0
Ltmp75:
	bl	__ZNSt3__114basic_ifstreamIcNS_11char_traitsIcEEED1Ev
Ltmp76:
; %bb.1:
	mov	x0, x19
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp], #32             ; 16-byte Folded Reload
	b	__ZdlPv
LBB5_2:
Ltmp77:
	mov	x20, x0
	mov	x0, x19
	bl	__ZdlPv
	mov	x0, x20
	bl	__Unwind_Resume
Lfunc_end4:
	.cfi_endproc
	.section	__TEXT,__gcc_except_tab
	.p2align	2
GCC_except_table5:
Lexception4:
	.byte	255                             ; @LPStart Encoding = omit
	.byte	255                             ; @TType Encoding = omit
	.byte	1                               ; Call site Encoding = uleb128
	.uleb128 Lcst_end4-Lcst_begin4
Lcst_begin4:
	.uleb128 Ltmp75-Lfunc_begin4            ; >> Call Site 1 <<
	.uleb128 Ltmp76-Ltmp75                  ;   Call between Ltmp75 and Ltmp76
	.uleb128 Ltmp77-Lfunc_begin4            ;     jumps to Ltmp77
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp76-Lfunc_begin4            ; >> Call Site 2 <<
	.uleb128 Lfunc_end4-Ltmp76              ;   Call between Ltmp76 and Lfunc_end4
	.byte	0                               ;     has no landing pad
	.byte	0                               ;   On action: cleanup
Lcst_end4:
	.p2align	2
                                        ; -- End function
	.section	__TEXT,__text,regular,pure_instructions
	.globl	__ZTv0_n24_NSt3__114basic_ifstreamIcNS_11char_traitsIcEEED0Ev ; -- Begin function _ZTv0_n24_NSt3__114basic_ifstreamIcNS_11char_traitsIcEEED0Ev
	.weak_def_can_be_hidden	__ZTv0_n24_NSt3__114basic_ifstreamIcNS_11char_traitsIcEEED0Ev
	.p2align	2
__ZTv0_n24_NSt3__114basic_ifstreamIcNS_11char_traitsIcEEED0Ev: ; @_ZTv0_n24_NSt3__114basic_ifstreamIcNS_11char_traitsIcEEED0Ev
Lfunc_begin5:
	.cfi_startproc
	.cfi_personality 155, ___gxx_personality_v0
	.cfi_lsda 16, Lexception5
; %bb.0:
	stp	x22, x21, [sp, #-48]!           ; 16-byte Folded Spill
	stp	x20, x19, [sp, #16]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #32]             ; 16-byte Folded Spill
	add	x29, sp, #32                    ; =32
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	.cfi_offset w21, -40
	.cfi_offset w22, -48
	ldr	x8, [x0]
	ldur	x8, [x8, #-24]
	add	x19, x0, x8
Lloh55:
	adrp	x8, __ZTVNSt3__114basic_ifstreamIcNS_11char_traitsIcEEEE@GOTPAGE
Lloh56:
	ldr	x8, [x8, __ZTVNSt3__114basic_ifstreamIcNS_11char_traitsIcEEEE@GOTPAGEOFF]
	add	x9, x8, #24                     ; =24
	str	x9, [x19]
	add	x20, x19, #424                  ; =424
	add	x8, x8, #64                     ; =64
	str	x8, [x19, #424]
	add	x0, x19, #16                    ; =16
Ltmp78:
	bl	__ZNSt3__113basic_filebufIcNS_11char_traitsIcEEED2Ev
Ltmp79:
; %bb.1:
Ltmp84:
Lloh57:
	adrp	x8, __ZTTNSt3__114basic_ifstreamIcNS_11char_traitsIcEEEE@GOTPAGE
Lloh58:
	ldr	x8, [x8, __ZTTNSt3__114basic_ifstreamIcNS_11char_traitsIcEEEE@GOTPAGEOFF]
	add	x1, x8, #8                      ; =8
	mov	x0, x19
	bl	__ZNSt3__113basic_istreamIcNS_11char_traitsIcEEED2Ev
Ltmp85:
; %bb.2:
Ltmp90:
	mov	x0, x20
	bl	__ZNSt3__19basic_iosIcNS_11char_traitsIcEEED2Ev
Ltmp91:
; %bb.3:
	mov	x0, x19
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #16]             ; 16-byte Folded Reload
	ldp	x22, x21, [sp], #48             ; 16-byte Folded Reload
	b	__ZdlPv
LBB6_4:
Ltmp92:
	mov	x21, x0
	b	LBB6_8
LBB6_5:
Ltmp86:
	mov	x21, x0
	b	LBB6_7
LBB6_6:
Ltmp80:
	mov	x21, x0
Ltmp81:
Lloh59:
	adrp	x8, __ZTTNSt3__114basic_ifstreamIcNS_11char_traitsIcEEEE@GOTPAGE
Lloh60:
	ldr	x8, [x8, __ZTTNSt3__114basic_ifstreamIcNS_11char_traitsIcEEEE@GOTPAGEOFF]
	add	x1, x8, #8                      ; =8
	mov	x0, x19
	bl	__ZNSt3__113basic_istreamIcNS_11char_traitsIcEEED2Ev
Ltmp82:
LBB6_7:
Ltmp87:
	mov	x0, x20
	bl	__ZNSt3__19basic_iosIcNS_11char_traitsIcEEED2Ev
Ltmp88:
LBB6_8:
	mov	x0, x19
	bl	__ZdlPv
	mov	x0, x21
	bl	__Unwind_Resume
LBB6_9:
Ltmp83:
	bl	___clang_call_terminate
LBB6_10:
Ltmp89:
	bl	___clang_call_terminate
	.loh AdrpLdrGot	Lloh55, Lloh56
	.loh AdrpLdrGot	Lloh57, Lloh58
	.loh AdrpLdrGot	Lloh59, Lloh60
Lfunc_end5:
	.cfi_endproc
	.section	__TEXT,__gcc_except_tab
	.p2align	2
GCC_except_table6:
Lexception5:
	.byte	255                             ; @LPStart Encoding = omit
	.byte	155                             ; @TType Encoding = indirect pcrel sdata4
	.uleb128 Lttbase3-Lttbaseref3
Lttbaseref3:
	.byte	1                               ; Call site Encoding = uleb128
	.uleb128 Lcst_end5-Lcst_begin5
Lcst_begin5:
	.uleb128 Ltmp78-Lfunc_begin5            ; >> Call Site 1 <<
	.uleb128 Ltmp79-Ltmp78                  ;   Call between Ltmp78 and Ltmp79
	.uleb128 Ltmp80-Lfunc_begin5            ;     jumps to Ltmp80
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp84-Lfunc_begin5            ; >> Call Site 2 <<
	.uleb128 Ltmp85-Ltmp84                  ;   Call between Ltmp84 and Ltmp85
	.uleb128 Ltmp86-Lfunc_begin5            ;     jumps to Ltmp86
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp90-Lfunc_begin5            ; >> Call Site 3 <<
	.uleb128 Ltmp91-Ltmp90                  ;   Call between Ltmp90 and Ltmp91
	.uleb128 Ltmp92-Lfunc_begin5            ;     jumps to Ltmp92
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp81-Lfunc_begin5            ; >> Call Site 4 <<
	.uleb128 Ltmp82-Ltmp81                  ;   Call between Ltmp81 and Ltmp82
	.uleb128 Ltmp83-Lfunc_begin5            ;     jumps to Ltmp83
	.byte	1                               ;   On action: 1
	.uleb128 Ltmp87-Lfunc_begin5            ; >> Call Site 5 <<
	.uleb128 Ltmp88-Ltmp87                  ;   Call between Ltmp87 and Ltmp88
	.uleb128 Ltmp89-Lfunc_begin5            ;     jumps to Ltmp89
	.byte	1                               ;   On action: 1
	.uleb128 Ltmp88-Lfunc_begin5            ; >> Call Site 6 <<
	.uleb128 Lfunc_end5-Ltmp88              ;   Call between Ltmp88 and Lfunc_end5
	.byte	0                               ;     has no landing pad
	.byte	0                               ;   On action: cleanup
Lcst_end5:
	.byte	1                               ; >> Action Record 1 <<
                                        ;   Catch TypeInfo 1
	.byte	0                               ;   No further actions
	.p2align	2
                                        ; >> Catch TypeInfos <<
	.long	0                               ; TypeInfo 1
Lttbase3:
	.p2align	2
                                        ; -- End function
	.section	__TEXT,__text,regular,pure_instructions
	.globl	__ZNSt3__113basic_filebufIcNS_11char_traitsIcEEED1Ev ; -- Begin function _ZNSt3__113basic_filebufIcNS_11char_traitsIcEEED1Ev
	.weak_def_can_be_hidden	__ZNSt3__113basic_filebufIcNS_11char_traitsIcEEED1Ev
	.p2align	2
__ZNSt3__113basic_filebufIcNS_11char_traitsIcEEED1Ev: ; @_ZNSt3__113basic_filebufIcNS_11char_traitsIcEEED1Ev
	.cfi_startproc
; %bb.0:
	b	__ZNSt3__113basic_filebufIcNS_11char_traitsIcEEED2Ev
	.cfi_endproc
                                        ; -- End function
	.globl	__ZNSt3__113basic_filebufIcNS_11char_traitsIcEEED2Ev ; -- Begin function _ZNSt3__113basic_filebufIcNS_11char_traitsIcEEED2Ev
	.weak_def_can_be_hidden	__ZNSt3__113basic_filebufIcNS_11char_traitsIcEEED2Ev
	.p2align	2
__ZNSt3__113basic_filebufIcNS_11char_traitsIcEEED2Ev: ; @_ZNSt3__113basic_filebufIcNS_11char_traitsIcEEED2Ev
Lfunc_begin6:
	.cfi_startproc
	.cfi_personality 155, ___gxx_personality_v0
	.cfi_lsda 16, Lexception6
; %bb.0:
	stp	x22, x21, [sp, #-48]!           ; 16-byte Folded Spill
	stp	x20, x19, [sp, #16]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #32]             ; 16-byte Folded Spill
	add	x29, sp, #32                    ; =32
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	.cfi_offset w21, -40
	.cfi_offset w22, -48
	mov	x19, x0
Lloh61:
	adrp	x8, __ZTVNSt3__113basic_filebufIcNS_11char_traitsIcEEEE@GOTPAGE
Lloh62:
	ldr	x8, [x8, __ZTVNSt3__113basic_filebufIcNS_11char_traitsIcEEEE@GOTPAGEOFF]
	add	x8, x8, #16                     ; =16
	str	x8, [x0]
	ldr	x20, [x0, #120]
	cbz	x20, LBB8_3
; %bb.1:
Ltmp93:
	mov	x0, x19
	bl	__ZNSt3__113basic_filebufIcNS_11char_traitsIcEEE4syncEv
Ltmp94:
; %bb.2:
	mov	x0, x20
	bl	_fclose
	str	xzr, [x19, #120]
	ldr	x8, [x19]
	ldr	x8, [x8, #24]
Ltmp96:
	mov	x0, x19
	mov	x1, #0
	mov	x2, #0
	blr	x8
Ltmp97:
LBB8_3:
	ldrb	w8, [x19, #400]
	cbz	w8, LBB8_6
; %bb.4:
	ldr	x0, [x19, #64]
	cbz	x0, LBB8_6
; %bb.5:
	bl	__ZdaPv
LBB8_6:
	ldrb	w8, [x19, #401]
	cbz	w8, LBB8_9
; %bb.7:
	ldr	x0, [x19, #104]
	cbz	x0, LBB8_9
; %bb.8:
	bl	__ZdaPv
LBB8_9:
	mov	x0, x19
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #16]             ; 16-byte Folded Reload
	ldp	x22, x21, [sp], #48             ; 16-byte Folded Reload
	b	__ZNSt3__115basic_streambufIcNS_11char_traitsIcEEED2Ev
LBB8_10:
Ltmp98:
	mov	x21, x0
	b	LBB8_12
LBB8_11:
Ltmp95:
	mov	x21, x0
	mov	x0, x20
	bl	_fclose
LBB8_12:
	mov	x0, x21
	bl	___cxa_begin_catch
Ltmp99:
	bl	___cxa_end_catch
Ltmp100:
	b	LBB8_3
LBB8_13:
Ltmp101:
	mov	x20, x0
Ltmp102:
	mov	x0, x19
	bl	__ZNSt3__115basic_streambufIcNS_11char_traitsIcEEED2Ev
Ltmp103:
; %bb.14:
	mov	x0, x20
	bl	__Unwind_Resume
LBB8_15:
Ltmp104:
	bl	___clang_call_terminate
	.loh AdrpLdrGot	Lloh61, Lloh62
Lfunc_end6:
	.cfi_endproc
	.section	__TEXT,__gcc_except_tab
	.p2align	2
GCC_except_table8:
Lexception6:
	.byte	255                             ; @LPStart Encoding = omit
	.byte	155                             ; @TType Encoding = indirect pcrel sdata4
	.uleb128 Lttbase4-Lttbaseref4
Lttbaseref4:
	.byte	1                               ; Call site Encoding = uleb128
	.uleb128 Lcst_end6-Lcst_begin6
Lcst_begin6:
	.uleb128 Ltmp93-Lfunc_begin6            ; >> Call Site 1 <<
	.uleb128 Ltmp94-Ltmp93                  ;   Call between Ltmp93 and Ltmp94
	.uleb128 Ltmp95-Lfunc_begin6            ;     jumps to Ltmp95
	.byte	1                               ;   On action: 1
	.uleb128 Ltmp96-Lfunc_begin6            ; >> Call Site 2 <<
	.uleb128 Ltmp97-Ltmp96                  ;   Call between Ltmp96 and Ltmp97
	.uleb128 Ltmp98-Lfunc_begin6            ;     jumps to Ltmp98
	.byte	1                               ;   On action: 1
	.uleb128 Ltmp97-Lfunc_begin6            ; >> Call Site 3 <<
	.uleb128 Ltmp99-Ltmp97                  ;   Call between Ltmp97 and Ltmp99
	.byte	0                               ;     has no landing pad
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp99-Lfunc_begin6            ; >> Call Site 4 <<
	.uleb128 Ltmp100-Ltmp99                 ;   Call between Ltmp99 and Ltmp100
	.uleb128 Ltmp101-Lfunc_begin6           ;     jumps to Ltmp101
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp102-Lfunc_begin6           ; >> Call Site 5 <<
	.uleb128 Ltmp103-Ltmp102                ;   Call between Ltmp102 and Ltmp103
	.uleb128 Ltmp104-Lfunc_begin6           ;     jumps to Ltmp104
	.byte	1                               ;   On action: 1
	.uleb128 Ltmp103-Lfunc_begin6           ; >> Call Site 6 <<
	.uleb128 Lfunc_end6-Ltmp103             ;   Call between Ltmp103 and Lfunc_end6
	.byte	0                               ;     has no landing pad
	.byte	0                               ;   On action: cleanup
Lcst_end6:
	.byte	1                               ; >> Action Record 1 <<
                                        ;   Catch TypeInfo 1
	.byte	0                               ;   No further actions
	.p2align	2
                                        ; >> Catch TypeInfos <<
	.long	0                               ; TypeInfo 1
Lttbase4:
	.p2align	2
                                        ; -- End function
	.section	__TEXT,__text,regular,pure_instructions
	.globl	__ZNSt3__113basic_filebufIcNS_11char_traitsIcEEED0Ev ; -- Begin function _ZNSt3__113basic_filebufIcNS_11char_traitsIcEEED0Ev
	.weak_def_can_be_hidden	__ZNSt3__113basic_filebufIcNS_11char_traitsIcEEED0Ev
	.p2align	2
__ZNSt3__113basic_filebufIcNS_11char_traitsIcEEED0Ev: ; @_ZNSt3__113basic_filebufIcNS_11char_traitsIcEEED0Ev
Lfunc_begin7:
	.cfi_startproc
	.cfi_personality 155, ___gxx_personality_v0
	.cfi_lsda 16, Lexception7
; %bb.0:
	stp	x20, x19, [sp, #-32]!           ; 16-byte Folded Spill
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	add	x29, sp, #16                    ; =16
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	mov	x19, x0
Ltmp105:
	bl	__ZNSt3__113basic_filebufIcNS_11char_traitsIcEEED2Ev
Ltmp106:
; %bb.1:
	mov	x0, x19
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp], #32             ; 16-byte Folded Reload
	b	__ZdlPv
LBB9_2:
Ltmp107:
	mov	x20, x0
	mov	x0, x19
	bl	__ZdlPv
	mov	x0, x20
	bl	__Unwind_Resume
Lfunc_end7:
	.cfi_endproc
	.section	__TEXT,__gcc_except_tab
	.p2align	2
GCC_except_table9:
Lexception7:
	.byte	255                             ; @LPStart Encoding = omit
	.byte	255                             ; @TType Encoding = omit
	.byte	1                               ; Call site Encoding = uleb128
	.uleb128 Lcst_end7-Lcst_begin7
Lcst_begin7:
	.uleb128 Ltmp105-Lfunc_begin7           ; >> Call Site 1 <<
	.uleb128 Ltmp106-Ltmp105                ;   Call between Ltmp105 and Ltmp106
	.uleb128 Ltmp107-Lfunc_begin7           ;     jumps to Ltmp107
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp106-Lfunc_begin7           ; >> Call Site 2 <<
	.uleb128 Lfunc_end7-Ltmp106             ;   Call between Ltmp106 and Lfunc_end7
	.byte	0                               ;     has no landing pad
	.byte	0                               ;   On action: cleanup
Lcst_end7:
	.p2align	2
                                        ; -- End function
	.section	__TEXT,__text,regular,pure_instructions
	.globl	__ZNSt3__113basic_filebufIcNS_11char_traitsIcEEE5imbueERKNS_6localeE ; -- Begin function _ZNSt3__113basic_filebufIcNS_11char_traitsIcEEE5imbueERKNS_6localeE
	.weak_def_can_be_hidden	__ZNSt3__113basic_filebufIcNS_11char_traitsIcEEE5imbueERKNS_6localeE
	.p2align	2
__ZNSt3__113basic_filebufIcNS_11char_traitsIcEEE5imbueERKNS_6localeE: ; @_ZNSt3__113basic_filebufIcNS_11char_traitsIcEEE5imbueERKNS_6localeE
	.cfi_startproc
; %bb.0:
	stp	x20, x19, [sp, #-32]!           ; 16-byte Folded Spill
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	add	x29, sp, #16                    ; =16
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	mov	x20, x1
	mov	x19, x0
	ldr	x8, [x0]
	ldr	x8, [x8, #48]
	blr	x8
Lloh63:
	adrp	x1, __ZNSt3__17codecvtIcc11__mbstate_tE2idE@GOTPAGE
Lloh64:
	ldr	x1, [x1, __ZNSt3__17codecvtIcc11__mbstate_tE2idE@GOTPAGEOFF]
	mov	x0, x20
	bl	__ZNKSt3__16locale9use_facetERNS0_2idE
	str	x0, [x19, #128]
	ldrb	w20, [x19, #402]
	ldr	x8, [x0]
	ldr	x8, [x8, #56]
	blr	x8
	strb	w0, [x19, #402]
	cmp	w20, w0
	b.eq	LBB10_10
; %bb.1:
	movi.2d	v0, #0000000000000000
	stp	q0, q0, [x19, #32]
	str	q0, [x19, #16]
	ldrb	w8, [x19, #400]
	cbz	w0, LBB10_6
; %bb.2:
	cbz	w8, LBB10_5
; %bb.3:
	ldr	x0, [x19, #64]
	cbz	x0, LBB10_5
; %bb.4:
	bl	__ZdaPv
LBB10_5:
	ldrb	w8, [x19, #401]
	strb	w8, [x19, #400]
	ldp	x9, x8, [x19, #104]
	str	x9, [x19, #64]
	strb	wzr, [x19, #401]
	stp	xzr, xzr, [x19, #104]
	str	x8, [x19, #96]
	b	LBB10_10
LBB10_6:
	cbz	w8, LBB10_8
LBB10_7:
	ldr	x0, [x19, #96]
	str	x0, [x19, #112]
	bl	__Znam
	str	x0, [x19, #104]
	mov	w8, #1
	strb	w8, [x19, #401]
	b	LBB10_10
LBB10_8:
	ldr	x8, [x19, #64]
	add	x9, x19, #88                    ; =88
	cmp	x8, x9
	b.eq	LBB10_7
; %bb.9:
	ldr	x0, [x19, #96]
	stp	x8, x0, [x19, #104]
	strb	wzr, [x19, #401]
	bl	__Znam
	str	x0, [x19, #64]
	mov	w8, #1
	strb	w8, [x19, #400]
LBB10_10:
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp], #32             ; 16-byte Folded Reload
	ret
	.loh AdrpLdrGot	Lloh63, Lloh64
	.cfi_endproc
                                        ; -- End function
	.globl	__ZNSt3__113basic_filebufIcNS_11char_traitsIcEEE6setbufEPcl ; -- Begin function _ZNSt3__113basic_filebufIcNS_11char_traitsIcEEE6setbufEPcl
	.weak_def_can_be_hidden	__ZNSt3__113basic_filebufIcNS_11char_traitsIcEEE6setbufEPcl
	.p2align	2
__ZNSt3__113basic_filebufIcNS_11char_traitsIcEEE6setbufEPcl: ; @_ZNSt3__113basic_filebufIcNS_11char_traitsIcEEE6setbufEPcl
	.cfi_startproc
; %bb.0:
	stp	x22, x21, [sp, #-48]!           ; 16-byte Folded Spill
	stp	x20, x19, [sp, #16]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #32]             ; 16-byte Folded Spill
	add	x29, sp, #32                    ; =32
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	.cfi_offset w21, -40
	.cfi_offset w22, -48
	mov	x21, x2
	mov	x20, x1
	mov	x19, x0
	movi.2d	v0, #0000000000000000
	stp	q0, q0, [x0, #32]
	str	q0, [x0, #16]
	ldrb	w8, [x0, #400]
	cbz	w8, LBB11_3
; %bb.1:
	ldr	x0, [x19, #64]
	cbz	x0, LBB11_3
; %bb.2:
	bl	__ZdaPv
LBB11_3:
	ldrb	w8, [x19, #401]
	cbz	w8, LBB11_6
; %bb.4:
	ldr	x0, [x19, #104]
	cbz	x0, LBB11_6
; %bb.5:
	bl	__ZdaPv
LBB11_6:
	str	x21, [x19, #96]
	cmp	x21, #9                         ; =9
	b.lo	LBB11_10
; %bb.7:
	ldrb	w22, [x19, #402]
	cbz	x20, LBB11_12
; %bb.8:
	cbz	w22, LBB11_12
; %bb.9:
	str	x20, [x19, #64]
	strb	wzr, [x19, #400]
	b	LBB11_11
LBB11_10:
	add	x8, x19, #88                    ; =88
	str	x8, [x19, #64]
	mov	w8, #8
	str	x8, [x19, #96]
	strb	wzr, [x19, #400]
	ldrb	w22, [x19, #402]
	cbz	w22, LBB11_13
LBB11_11:
	strb	wzr, [x19, #401]
	stp	xzr, xzr, [x19, #104]
	b	LBB11_16
LBB11_12:
	mov	x0, x21
	bl	__Znam
	str	x0, [x19, #64]
	mov	w8, #1
	strb	w8, [x19, #400]
	cbnz	w22, LBB11_11
LBB11_13:
	mov	w8, #8
	cmp	x21, #8                         ; =8
	csel	x0, x21, x8, gt
	str	x0, [x19, #112]
	cbz	x20, LBB11_15
; %bb.14:
	str	x20, [x19, #104]
	strb	wzr, [x19, #401]
	b	LBB11_16
LBB11_15:
	bl	__Znam
	str	x0, [x19, #104]
	mov	w8, #1
	strb	w8, [x19, #401]
LBB11_16:
	mov	x0, x19
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #16]             ; 16-byte Folded Reload
	ldp	x22, x21, [sp], #48             ; 16-byte Folded Reload
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	__ZNSt3__113basic_filebufIcNS_11char_traitsIcEEE7seekoffExNS_8ios_base7seekdirEj ; -- Begin function _ZNSt3__113basic_filebufIcNS_11char_traitsIcEEE7seekoffExNS_8ios_base7seekdirEj
	.weak_def_can_be_hidden	__ZNSt3__113basic_filebufIcNS_11char_traitsIcEEE7seekoffExNS_8ios_base7seekdirEj
	.p2align	2
__ZNSt3__113basic_filebufIcNS_11char_traitsIcEEE7seekoffExNS_8ios_base7seekdirEj: ; @_ZNSt3__113basic_filebufIcNS_11char_traitsIcEEE7seekoffExNS_8ios_base7seekdirEj
	.cfi_startproc
; %bb.0:
	stp	x24, x23, [sp, #-64]!           ; 16-byte Folded Spill
	stp	x22, x21, [sp, #16]             ; 16-byte Folded Spill
	stp	x20, x19, [sp, #32]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #48]             ; 16-byte Folded Spill
	add	x29, sp, #48                    ; =48
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	.cfi_offset w21, -40
	.cfi_offset w22, -48
	.cfi_offset w23, -56
	.cfi_offset w24, -64
	mov	x20, x0
	ldr	x0, [x0, #128]
	cbz	x0, LBB12_10
; %bb.1:
	mov	x21, x2
	mov	x22, x1
	mov	x19, x8
	ldr	x8, [x0]
	ldr	x8, [x8, #48]
	blr	x8
	ldr	x8, [x20, #120]
	cbz	x8, LBB12_7
; %bb.2:
	mov	x23, x0
	cbz	x22, LBB12_4
; %bb.3:
	cmp	w23, #1                         ; =1
	b.lt	LBB12_7
LBB12_4:
	ldr	x8, [x20]
	ldr	x8, [x8, #48]
	mov	x0, x20
	blr	x8
	cbnz	w0, LBB12_7
; %bb.5:
	cmp	w21, #3                         ; =3
	b.hs	LBB12_7
; %bb.6:
	ldr	x0, [x20, #120]
	sxtw	x8, w23
	mul	x8, x8, x22
	cmp	w23, #0                         ; =0
	csel	x1, x8, xzr, gt
	mov	x2, x21
	bl	_fseeko
	cbz	w0, LBB12_9
LBB12_7:
	movi.2d	v0, #0000000000000000
	stp	q0, q0, [x19, #96]
	stp	q0, q0, [x19, #64]
	stp	q0, q0, [x19, #32]
	mov	x0, #-1
	stp	q0, q0, [x19]
LBB12_8:
	str	x0, [x19, #128]
	ldp	x29, x30, [sp, #48]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #32]             ; 16-byte Folded Reload
	ldp	x22, x21, [sp, #16]             ; 16-byte Folded Reload
	ldp	x24, x23, [sp], #64             ; 16-byte Folded Reload
	ret
LBB12_9:
	ldr	x0, [x20, #120]
	bl	_ftello
	ldur	q0, [x20, #152]
	ldur	q1, [x20, #168]
	ldur	q2, [x20, #184]
	ldur	q3, [x20, #136]
	stp	q1, q2, [x19, #32]
	stp	q3, q0, [x19]
	ldur	q0, [x20, #216]
	ldur	q1, [x20, #232]
	ldur	q2, [x20, #248]
	ldur	q3, [x20, #200]
	stp	q1, q2, [x19, #96]
	stp	q3, q0, [x19, #64]
	b	LBB12_8
LBB12_10:
	bl	__ZNSt3__1L16__throw_bad_castEv
	.cfi_endproc
                                        ; -- End function
	.globl	__ZNSt3__113basic_filebufIcNS_11char_traitsIcEEE7seekposENS_4fposI11__mbstate_tEEj ; -- Begin function _ZNSt3__113basic_filebufIcNS_11char_traitsIcEEE7seekposENS_4fposI11__mbstate_tEEj
	.weak_def_can_be_hidden	__ZNSt3__113basic_filebufIcNS_11char_traitsIcEEE7seekposENS_4fposI11__mbstate_tEEj
	.p2align	2
__ZNSt3__113basic_filebufIcNS_11char_traitsIcEEE7seekposENS_4fposI11__mbstate_tEEj: ; @_ZNSt3__113basic_filebufIcNS_11char_traitsIcEEE7seekposENS_4fposI11__mbstate_tEEj
	.cfi_startproc
; %bb.0:
	stp	x22, x21, [sp, #-48]!           ; 16-byte Folded Spill
	stp	x20, x19, [sp, #16]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #32]             ; 16-byte Folded Spill
	add	x29, sp, #32                    ; =32
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	.cfi_offset w21, -40
	.cfi_offset w22, -48
	mov	x19, x8
	ldr	x8, [x0, #120]
	cbz	x8, LBB13_3
; %bb.1:
	mov	x20, x1
	mov	x21, x0
	ldr	x8, [x0]
	ldr	x8, [x8, #48]
	blr	x8
	cbnz	w0, LBB13_3
; %bb.2:
	ldr	x0, [x21, #120]
	ldr	x1, [x20, #128]
	mov	w2, #0
	bl	_fseeko
	cbz	w0, LBB13_5
LBB13_3:
	movi.2d	v0, #0000000000000000
	stp	q0, q0, [x19, #96]
	stp	q0, q0, [x19, #64]
	stp	q0, q0, [x19, #32]
	stp	q0, q0, [x19]
	mov	x8, #-1
	str	x8, [x19, #128]
LBB13_4:
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #16]             ; 16-byte Folded Reload
	ldp	x22, x21, [sp], #48             ; 16-byte Folded Reload
	ret
LBB13_5:
	add	x0, x21, #136                   ; =136
	mov	x1, x20
	mov	w2, #128
	bl	_memmove
	ldp	q0, q3, [x20]
	stp	q0, q3, [x19]
	ldp	q0, q1, [x20, #48]
	ldr	q2, [x20, #32]
	stp	q0, q1, [x19, #48]
	str	q2, [x19, #32]
	ldp	q1, q0, [x20, #96]
	ldr	x8, [x20, #128]
	ldr	q2, [x20, #80]
	str	x8, [x19, #128]
	stp	q1, q0, [x19, #96]
	str	q2, [x19, #80]
	b	LBB13_4
	.cfi_endproc
                                        ; -- End function
	.globl	__ZNSt3__113basic_filebufIcNS_11char_traitsIcEEE4syncEv ; -- Begin function _ZNSt3__113basic_filebufIcNS_11char_traitsIcEEE4syncEv
	.weak_def_can_be_hidden	__ZNSt3__113basic_filebufIcNS_11char_traitsIcEEE4syncEv
	.p2align	2
__ZNSt3__113basic_filebufIcNS_11char_traitsIcEEE4syncEv: ; @_ZNSt3__113basic_filebufIcNS_11char_traitsIcEEE4syncEv
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #192                    ; =192
	stp	x22, x21, [sp, #144]            ; 16-byte Folded Spill
	stp	x20, x19, [sp, #160]            ; 16-byte Folded Spill
	stp	x29, x30, [sp, #176]            ; 16-byte Folded Spill
	add	x29, sp, #176                   ; =176
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	.cfi_offset w21, -40
	.cfi_offset w22, -48
Lloh65:
	adrp	x8, ___stack_chk_guard@GOTPAGE
Lloh66:
	ldr	x8, [x8, ___stack_chk_guard@GOTPAGEOFF]
Lloh67:
	ldr	x8, [x8]
	stur	x8, [x29, #-40]
	ldr	x8, [x0, #120]
	cbz	x8, LBB14_23
; %bb.1:
	mov	x19, x0
	ldr	x0, [x0, #128]
	cbz	x0, LBB14_27
; %bb.2:
	ldr	w8, [x19, #396]
	tbnz	w8, #4, LBB14_6
; %bb.3:
	tbz	w8, #3, LBB14_23
; %bb.4:
	add	x8, x19, #264                   ; =264
	ldp	q0, q1, [x8]
	ldp	q2, q3, [x8, #32]
	stp	q2, q3, [sp, #32]
	stp	q0, q1, [sp]
	ldp	q0, q1, [x8, #64]
	ldp	q2, q3, [x8, #96]
	stp	q2, q3, [sp, #96]
	stp	q0, q1, [sp, #64]
	ldrb	w8, [x19, #402]
	cbz	w8, LBB14_13
; %bb.5:
	mov	w21, #0
	ldp	x9, x8, [x19, #24]
	sub	x20, x8, x9
	b	LBB14_18
LBB14_6:
	ldp	x9, x8, [x19, #40]
	cmp	x8, x9
	b.eq	LBB14_8
; %bb.7:
	ldr	x8, [x19]
	ldr	x8, [x8, #104]
	mov	w20, #-1
	mov	x0, x19
	mov	w1, #-1
	blr	x8
	cmn	w0, #1                          ; =1
	b.eq	LBB14_24
LBB14_8:
	add	x20, x19, #136                  ; =136
LBB14_9:                                ; =>This Inner Loop Header: Depth=1
	ldr	x0, [x19, #128]
	ldr	x2, [x19, #64]
	ldr	x8, [x19, #96]
	add	x3, x2, x8
	ldr	x8, [x0]
	ldr	x8, [x8, #40]
	mov	x4, sp
	mov	x1, x20
	blr	x8
	mov	x21, x0
	ldr	x8, [sp]
	ldr	x0, [x19, #64]
	sub	x22, x8, x0
	ldr	x3, [x19, #120]
	mov	w1, #1
	mov	x2, x22
	bl	_fwrite
	cmp	x0, x22
	b.ne	LBB14_19
; %bb.10:                               ;   in Loop: Header=BB14_9 Depth=1
	cmp	w21, #1                         ; =1
	b.eq	LBB14_9
; %bb.11:
	cmp	w21, #2                         ; =2
	b.eq	LBB14_19
; %bb.12:
	ldr	x0, [x19, #120]
	bl	_fflush
	cbnz	w0, LBB14_19
	b	LBB14_23
LBB14_13:
	ldr	x8, [x0]
	ldr	x8, [x8, #48]
	blr	x8
	ldp	x3, x8, [x19, #72]
	sub	x20, x8, x3
	cmp	w0, #1                          ; =1
	b.lt	LBB14_15
; %bb.14:
	mov	w21, #0
	mov	w8, w0
	ldp	x10, x9, [x19, #24]
	sub	x9, x9, x10
	madd	x20, x9, x8, x20
	b	LBB14_18
LBB14_15:
	ldp	x8, x9, [x19, #24]
	cmp	x8, x9
	b.eq	LBB14_17
; %bb.16:
	ldr	x0, [x19, #128]
	ldr	x2, [x19, #64]
	ldr	x9, [x19, #16]
	sub	x4, x8, x9
	ldr	x8, [x0]
	ldr	x8, [x8, #64]
	mov	x1, sp
	blr	x8
	ldp	x9, x8, [x19, #64]
	add	x9, x9, w0, sxtw
	add	x8, x20, x8
	sub	x20, x8, x9
	mov	w21, #1
	b	LBB14_18
LBB14_17:
	mov	w21, #0
LBB14_18:
	ldr	x0, [x19, #120]
	neg	x1, x20
	mov	w2, #1
	bl	_fseeko
	cbz	w0, LBB14_20
LBB14_19:
	mov	w20, #-1
	b	LBB14_24
LBB14_20:
	cbz	w21, LBB14_22
; %bb.21:
	ldp	q0, q1, [sp]
	ldp	q2, q3, [sp, #32]
	stur	q3, [x19, #184]
	stur	q2, [x19, #168]
	stur	q1, [x19, #152]
	stur	q0, [x19, #136]
	ldp	q0, q1, [sp, #64]
	ldp	q2, q3, [sp, #96]
	stur	q3, [x19, #248]
	stur	q2, [x19, #232]
	stur	q1, [x19, #216]
	stur	q0, [x19, #200]
LBB14_22:
	ldr	x8, [x19, #64]
	stp	x8, x8, [x19, #72]
	str	wzr, [x19, #396]
	stp	xzr, xzr, [x19, #24]
	str	xzr, [x19, #16]
LBB14_23:
	mov	w20, #0
LBB14_24:
	ldur	x8, [x29, #-40]
Lloh68:
	adrp	x9, ___stack_chk_guard@GOTPAGE
Lloh69:
	ldr	x9, [x9, ___stack_chk_guard@GOTPAGEOFF]
Lloh70:
	ldr	x9, [x9]
	cmp	x9, x8
	b.ne	LBB14_26
; %bb.25:
	mov	x0, x20
	ldp	x29, x30, [sp, #176]            ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #160]            ; 16-byte Folded Reload
	ldp	x22, x21, [sp, #144]            ; 16-byte Folded Reload
	add	sp, sp, #192                    ; =192
	ret
LBB14_26:
	bl	___stack_chk_fail
LBB14_27:
	bl	__ZNSt3__1L16__throw_bad_castEv
	.loh AdrpLdrGotLdr	Lloh65, Lloh66, Lloh67
	.loh AdrpLdrGotLdr	Lloh68, Lloh69, Lloh70
	.cfi_endproc
                                        ; -- End function
	.globl	__ZNSt3__113basic_filebufIcNS_11char_traitsIcEEE9underflowEv ; -- Begin function _ZNSt3__113basic_filebufIcNS_11char_traitsIcEEE9underflowEv
	.weak_def_can_be_hidden	__ZNSt3__113basic_filebufIcNS_11char_traitsIcEEE9underflowEv
	.p2align	2
__ZNSt3__113basic_filebufIcNS_11char_traitsIcEEE9underflowEv: ; @_ZNSt3__113basic_filebufIcNS_11char_traitsIcEEE9underflowEv
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #64                     ; =64
	stp	x22, x21, [sp, #16]             ; 16-byte Folded Spill
	stp	x20, x19, [sp, #32]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #48]             ; 16-byte Folded Spill
	add	x29, sp, #48                    ; =48
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	.cfi_offset w21, -40
	.cfi_offset w22, -48
	ldr	x8, [x0, #120]
	cbz	x8, LBB15_5
; %bb.1:
	mov	x19, x0
	ldr	w9, [x0, #396]
	tbnz	w9, #3, LBB15_6
; %bb.2:
	stp	xzr, xzr, [x19, #40]
	str	xzr, [x19, #56]
	ldrb	w8, [x19, #402]
	cmp	w8, #0                          ; =0
	mov	w8, #96
	mov	w10, #112
	csel	x8, x10, x8, eq
	mov	w10, #64
	mov	w11, #104
	csel	x10, x11, x10, eq
	ldr	x10, [x19, x10]
	ldr	x8, [x19, x8]
	add	x8, x10, x8
	stp	x10, x8, [x19, #16]
	str	x8, [x19, #32]
	mov	w10, #8
	str	w10, [x19, #396]
	cbz	x8, LBB15_7
LBB15_3:
	ldr	x10, [x19, #32]
	tbnz	w9, #3, LBB15_8
LBB15_4:
	mov	x20, #0
	cmp	x8, x10
	b.ne	LBB15_24
	b	LBB15_9
LBB15_5:
	mov	w0, #-1
	b	LBB15_27
LBB15_6:
	ldr	x8, [x19, #24]
	cbnz	x8, LBB15_3
LBB15_7:
	add	x10, sp, #15                    ; =15
	add	x8, x10, #1                     ; =1
	stp	x10, x8, [x19, #16]
	str	x8, [x19, #32]
	ldr	x10, [x19, #32]
	tbz	w9, #3, LBB15_4
LBB15_8:
	ldr	x9, [x19, #16]
	sub	x9, x10, x9
	cmp	x9, #0                          ; =0
	cinc	x9, x9, lt
	asr	x9, x9, #1
	mov	w11, #4
	cmp	x9, #4                          ; =4
	csel	x20, x9, x11, lo
	cmp	x8, x10
	b.ne	LBB15_24
LBB15_9:
	ldr	x0, [x19, #16]
	sub	x1, x8, x20
	mov	x2, x20
	bl	_memmove
	ldrb	w8, [x19, #402]
	cbz	w8, LBB15_12
; %bb.10:
	ldr	x8, [x19, #32]
	ldr	x9, [x19, #16]
	sub	x8, x8, x20
	sub	x2, x8, x9
	add	x0, x9, x20
	ldr	x3, [x19, #120]
	mov	w1, #1
	bl	_fread
	cbz	x0, LBB15_28
; %bb.11:
	ldr	x8, [x19, #16]
	add	x8, x8, x20
	add	x9, x8, x0
	b	LBB15_23
LBB15_12:
	mov	x21, x19
	ldr	x1, [x21, #72]!
	ldr	x9, [x21, #8]
	subs	x2, x9, x1
	b.eq	LBB15_14
; %bb.13:
	ldr	x0, [x19, #64]
	bl	_memmove
	ldp	x9, x10, [x19, #72]
	b	LBB15_15
LBB15_14:
	mov	x10, x9
LBB15_15:
	ldr	x8, [x19, #64]
	sub	x9, x10, x9
	add	x0, x8, x9
	str	x0, [x19, #72]
	add	x9, x19, #88                    ; =88
	cmp	x8, x9
	b.eq	LBB15_17
; %bb.16:
	ldr	x9, [x19, #96]
	b	LBB15_18
LBB15_17:
	mov	w9, #8
LBB15_18:
	add	x8, x8, x9
	sub	x9, x8, x0
	str	x8, [x19, #80]
	ldr	x8, [x19, #112]
	sub	x8, x8, x20
	cmp	x9, x8
	csel	x2, x9, x8, lo
	add	x8, x19, #264                   ; =264
	ldur	q1, [x19, #200]
	ldur	q0, [x19, #216]
	stp	q1, q0, [x8, #64]
	ldur	q1, [x19, #232]
	ldur	q0, [x19, #248]
	stp	q1, q0, [x8, #96]
	ldur	q1, [x19, #136]
	ldur	q0, [x19, #152]
	stp	q1, q0, [x8]
	ldur	q1, [x19, #168]
	ldur	q0, [x19, #184]
	stp	q1, q0, [x8, #32]
	ldr	x3, [x19, #120]
	mov	w1, #1
	bl	_fread
	cbz	x0, LBB15_28
; %bb.19:
	mov	x8, x0
	ldr	x0, [x19, #128]
	cbz	x0, LBB15_29
; %bb.20:
	add	x1, x19, #136                   ; =136
	ldp	x2, x9, [x19, #64]
	add	x3, x9, x8
	str	x3, [x19, #80]
	ldr	x8, [x19, #16]
	add	x5, x8, x20
	ldr	x9, [x19, #112]
	add	x6, x8, x9
	ldr	x8, [x0]
	ldr	x8, [x8, #32]
	mov	x7, sp
	mov	x4, x21
	blr	x8
	cmp	w0, #3                          ; =3
	b.ne	LBB15_22
; %bb.21:
	ldr	x8, [x19, #64]
	ldr	x9, [x19, #80]
	str	x8, [x19, #16]
	b	LBB15_23
LBB15_22:
	ldr	x9, [sp]
	ldr	x8, [x19, #16]
	add	x8, x8, x20
	cmp	x9, x8
	b.eq	LBB15_28
LBB15_23:
	stp	x8, x9, [x19, #24]
LBB15_24:
	ldrb	w0, [x8]
LBB15_25:
	ldr	x8, [x19, #16]!
	add	x9, sp, #15                     ; =15
	cmp	x8, x9
	b.ne	LBB15_27
; %bb.26:
	stp	xzr, xzr, [x19]
	str	xzr, [x19, #16]
LBB15_27:
	ldp	x29, x30, [sp, #48]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #32]             ; 16-byte Folded Reload
	ldp	x22, x21, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #64                     ; =64
	ret
LBB15_28:
	mov	w0, #-1
	b	LBB15_25
LBB15_29:
	bl	__ZNSt3__1L16__throw_bad_castEv
	.cfi_endproc
                                        ; -- End function
	.globl	__ZNSt3__113basic_filebufIcNS_11char_traitsIcEEE9pbackfailEi ; -- Begin function _ZNSt3__113basic_filebufIcNS_11char_traitsIcEEE9pbackfailEi
	.weak_def_can_be_hidden	__ZNSt3__113basic_filebufIcNS_11char_traitsIcEEE9pbackfailEi
	.p2align	2
__ZNSt3__113basic_filebufIcNS_11char_traitsIcEEE9pbackfailEi: ; @_ZNSt3__113basic_filebufIcNS_11char_traitsIcEEE9pbackfailEi
	.cfi_startproc
; %bb.0:
	ldr	x8, [x0, #120]
	cbz	x8, LBB16_6
; %bb.1:
	ldp	x9, x8, [x0, #16]
	cmp	x9, x8
	b.hs	LBB16_6
; %bb.2:
	cmn	w1, #1                          ; =1
	b.eq	LBB16_7
; %bb.3:
	ldrb	w9, [x0, #392]
	tbnz	w9, #4, LBB16_5
; %bb.4:
	ldurb	w9, [x8, #-1]
	cmp	w9, w1, uxtb
	b.ne	LBB16_6
LBB16_5:
	sub	x9, x8, #1                      ; =1
	str	x9, [x0, #24]
	sturb	w1, [x8, #-1]
	mov	x0, x1
	ret
LBB16_6:
	mov	w0, #-1
	ret
LBB16_7:
	sub	x8, x8, #1                      ; =1
	str	x8, [x0, #24]
	mov	w0, #0
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	__ZNSt3__113basic_filebufIcNS_11char_traitsIcEEE8overflowEi ; -- Begin function _ZNSt3__113basic_filebufIcNS_11char_traitsIcEEE8overflowEi
	.weak_def_can_be_hidden	__ZNSt3__113basic_filebufIcNS_11char_traitsIcEEE8overflowEi
	.p2align	2
__ZNSt3__113basic_filebufIcNS_11char_traitsIcEEE8overflowEi: ; @_ZNSt3__113basic_filebufIcNS_11char_traitsIcEEE8overflowEi
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #112                    ; =112
	stp	x26, x25, [sp, #32]             ; 16-byte Folded Spill
	stp	x24, x23, [sp, #48]             ; 16-byte Folded Spill
	stp	x22, x21, [sp, #64]             ; 16-byte Folded Spill
	stp	x20, x19, [sp, #80]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #96]             ; 16-byte Folded Spill
	add	x29, sp, #96                    ; =96
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	.cfi_offset w21, -40
	.cfi_offset w22, -48
	.cfi_offset w23, -56
	.cfi_offset w24, -64
	.cfi_offset w25, -72
	.cfi_offset w26, -80
	ldr	x8, [x0, #120]
	cbz	x8, LBB17_29
; %bb.1:
	mov	x19, x1
	mov	x20, x0
	ldrb	w8, [x0, #396]
	tbnz	w8, #4, LBB17_5
; %bb.2:
	stp	xzr, xzr, [x20, #16]
	str	xzr, [x20, #32]
	ldr	x8, [x20, #96]
	cmp	x8, #9                          ; =9
	b.lo	LBB17_6
; %bb.3:
	ldrb	w9, [x20, #402]
	cbz	w9, LBB17_7
; %bb.4:
	ldr	x24, [x20, #64]
	b	LBB17_8
LBB17_5:
	ldr	x24, [x20, #40]
	ldr	x25, [x20, #56]
	b	LBB17_10
LBB17_6:
	mov	x25, #0
	mov	x24, #0
	stp	xzr, xzr, [x20, #40]
	str	xzr, [x20, #56]
	b	LBB17_9
LBB17_7:
	ldp	x24, x8, [x20, #104]
LBB17_8:
	add	x8, x8, x24
	sub	x25, x8, #1                     ; =1
	stp	x24, x24, [x20, #40]
	str	x25, [x20, #56]
LBB17_9:
	mov	w8, #16
	str	w8, [x20, #396]
LBB17_10:
	ldr	x3, [x20, #48]
	cmn	w19, #1                         ; =1
	b.eq	LBB17_14
; %bb.11:
	cbnz	x3, LBB17_13
; %bb.12:
	add	x3, sp, #31                     ; =31
	add	x8, x3, #1                      ; =1
	stp	x3, x3, [x20, #40]
	str	x8, [x20, #56]
LBB17_13:
	strb	w19, [x3]
	ldp	x2, x8, [x20, #40]
	add	x3, x8, #1                      ; =1
	str	x3, [x20, #48]
	subs	x21, x3, x2
	b.ne	LBB17_15
	b	LBB17_19
LBB17_14:
	mov	x2, x24
	subs	x21, x3, x2
	b.eq	LBB17_19
LBB17_15:
	ldrb	w8, [x20, #402]
	cbz	w8, LBB17_20
; %bb.16:
	ldr	x3, [x20, #120]
	mov	x0, x2
LBB17_17:
	mov	w1, #1
	mov	x2, x21
	bl	_fwrite
	cmp	x0, x21
	b.ne	LBB17_29
LBB17_18:
	stp	x24, x24, [x20, #40]
	str	x25, [x20, #56]
LBB17_19:
	cmn	w19, #1                         ; =1
	csel	w0, wzr, w19, eq
	b	LBB17_30
LBB17_20:
	ldr	x5, [x20, #64]
	str	x5, [sp, #16]
	ldr	x0, [x20, #128]
	cbz	x0, LBB17_32
; %bb.21:
	add	x21, x20, #136                  ; =136
LBB17_22:                               ; =>This Inner Loop Header: Depth=1
	ldr	x8, [x20, #96]
	add	x6, x5, x8
	ldr	x8, [x0]
	ldr	x8, [x8, #24]
	add	x4, sp, #8                      ; =8
	add	x7, sp, #16                     ; =16
	mov	x1, x21
	blr	x8
	mov	x22, x0
	ldr	x8, [sp, #8]
	ldr	x0, [x20, #40]
	cmp	x8, x0
	b.eq	LBB17_29
; %bb.23:                               ;   in Loop: Header=BB17_22 Depth=1
	cmp	w22, #3                         ; =3
	b.eq	LBB17_31
; %bb.24:                               ;   in Loop: Header=BB17_22 Depth=1
	cmp	w22, #1                         ; =1
	b.hi	LBB17_29
; %bb.25:                               ;   in Loop: Header=BB17_22 Depth=1
	ldr	x8, [sp, #16]
	ldr	x0, [x20, #64]
	sub	x23, x8, x0
	ldr	x3, [x20, #120]
	mov	w1, #1
	mov	x2, x23
	bl	_fwrite
	cmp	x0, x23
	b.ne	LBB17_29
; %bb.26:                               ;   in Loop: Header=BB17_22 Depth=1
	cmp	w22, #1                         ; =1
	b.ne	LBB17_18
; %bb.27:                               ;   in Loop: Header=BB17_22 Depth=1
	ldr	x2, [sp, #8]
	ldr	x3, [x20, #48]
	str	x2, [x20, #40]
	str	x3, [x20, #56]
	ldr	x0, [x20, #128]
	cbz	x0, LBB17_32
; %bb.28:                               ;   in Loop: Header=BB17_22 Depth=1
	ldr	x5, [x20, #64]
	b	LBB17_22
LBB17_29:
	mov	w0, #-1
LBB17_30:
	ldp	x29, x30, [sp, #96]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #80]             ; 16-byte Folded Reload
	ldp	x22, x21, [sp, #64]             ; 16-byte Folded Reload
	ldp	x24, x23, [sp, #48]             ; 16-byte Folded Reload
	ldp	x26, x25, [sp, #32]             ; 16-byte Folded Reload
	add	sp, sp, #112                    ; =112
	ret
LBB17_31:
	ldr	x8, [x20, #48]
	sub	x21, x8, x0
	ldr	x3, [x20, #120]
	b	LBB17_17
LBB17_32:
	bl	__ZNSt3__1L16__throw_bad_castEv
	.cfi_endproc
                                        ; -- End function
	.p2align	2                               ; -- Begin function _ZNSt3__1L16__throw_bad_castEv
__ZNSt3__1L16__throw_bad_castEv:        ; @_ZNSt3__1L16__throw_bad_castEv
	.cfi_startproc
; %bb.0:
	stp	x29, x30, [sp, #-16]!           ; 16-byte Folded Spill
	mov	x29, sp
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	mov	w0, #8
	bl	___cxa_allocate_exception
	bl	__ZNSt8bad_castC1Ev
Lloh71:
	adrp	x1, __ZTISt8bad_cast@GOTPAGE
Lloh72:
	ldr	x1, [x1, __ZTISt8bad_cast@GOTPAGEOFF]
Lloh73:
	adrp	x2, __ZNSt8bad_castD1Ev@GOTPAGE
Lloh74:
	ldr	x2, [x2, __ZNSt8bad_castD1Ev@GOTPAGEOFF]
	bl	___cxa_throw
	.loh AdrpLdrGot	Lloh73, Lloh74
	.loh AdrpLdrGot	Lloh71, Lloh72
	.cfi_endproc
                                        ; -- End function
	.globl	__ZNSt3__113basic_filebufIcNS_11char_traitsIcEEEC2Ev ; -- Begin function _ZNSt3__113basic_filebufIcNS_11char_traitsIcEEEC2Ev
	.weak_def_can_be_hidden	__ZNSt3__113basic_filebufIcNS_11char_traitsIcEEEC2Ev
	.p2align	2
__ZNSt3__113basic_filebufIcNS_11char_traitsIcEEEC2Ev: ; @_ZNSt3__113basic_filebufIcNS_11char_traitsIcEEEC2Ev
Lfunc_begin8:
	.cfi_startproc
	.cfi_personality 155, ___gxx_personality_v0
	.cfi_lsda 16, Lexception8
; %bb.0:
	sub	sp, sp, #64                     ; =64
	stp	x22, x21, [sp, #16]             ; 16-byte Folded Spill
	stp	x20, x19, [sp, #32]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #48]             ; 16-byte Folded Spill
	add	x29, sp, #48                    ; =48
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	.cfi_offset w21, -40
	.cfi_offset w22, -48
	mov	x19, x0
	bl	__ZNSt3__115basic_streambufIcNS_11char_traitsIcEEEC2Ev
Lloh75:
	adrp	x8, __ZTVNSt3__113basic_filebufIcNS_11char_traitsIcEEEE@GOTPAGE
Lloh76:
	ldr	x8, [x8, __ZTVNSt3__113basic_filebufIcNS_11char_traitsIcEEEE@GOTPAGEOFF]
	add	x8, x8, #16                     ; =16
	str	x8, [x0]
	stp	xzr, xzr, [x0, #72]
	str	xzr, [x0, #64]
	movi.2d	v0, #0000000000000000
	stp	q0, q0, [x0, #96]
	stp	q0, q0, [x0, #128]
	stp	q0, q0, [x0, #160]
	stp	q0, q0, [x0, #192]
	stp	q0, q0, [x0, #224]
	stp	q0, q0, [x0, #256]
	stp	q0, q0, [x0, #288]
	stp	q0, q0, [x0, #320]
	stp	q0, q0, [x0, #368]
	add	x8, x0, #399                    ; =399
	str	wzr, [x8]
	add	x20, x0, #8                     ; =8
	str	q0, [x0, #352]
	add	x0, sp, #8                      ; =8
	mov	x1, x20
	bl	__ZNSt3__16localeC1ERKS0_
Ltmp108:
Lloh77:
	adrp	x1, __ZNSt3__17codecvtIcc11__mbstate_tE2idE@GOTPAGE
Lloh78:
	ldr	x1, [x1, __ZNSt3__17codecvtIcc11__mbstate_tE2idE@GOTPAGEOFF]
	add	x0, sp, #8                      ; =8
	bl	__ZNKSt3__16locale9has_facetERNS0_2idE
Ltmp109:
; %bb.1:
	mov	x21, x0
Ltmp111:
	add	x0, sp, #8                      ; =8
	bl	__ZNSt3__16localeD1Ev
Ltmp112:
; %bb.2:
	cbz	w21, LBB19_6
; %bb.3:
	add	x0, sp, #8                      ; =8
	mov	x1, x20
	bl	__ZNSt3__16localeC1ERKS0_
Ltmp114:
Lloh79:
	adrp	x1, __ZNSt3__17codecvtIcc11__mbstate_tE2idE@GOTPAGE
Lloh80:
	ldr	x1, [x1, __ZNSt3__17codecvtIcc11__mbstate_tE2idE@GOTPAGEOFF]
	add	x0, sp, #8                      ; =8
	bl	__ZNKSt3__16locale9use_facetERNS0_2idE
Ltmp115:
; %bb.4:
	str	x0, [x19, #128]
Ltmp119:
	add	x0, sp, #8                      ; =8
	bl	__ZNSt3__16localeD1Ev
Ltmp120:
; %bb.5:
	ldr	x0, [x19, #128]
	ldr	x8, [x0]
	ldr	x8, [x8, #56]
	blr	x8
	strb	w0, [x19, #402]
LBB19_6:
	ldr	x8, [x19]
	ldr	x8, [x8, #24]
Ltmp122:
	mov	x0, x19
	mov	x1, #0
	mov	w2, #4096
	blr	x8
Ltmp123:
; %bb.7:
	mov	x0, x19
	ldp	x29, x30, [sp, #48]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #32]             ; 16-byte Folded Reload
	ldp	x22, x21, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #64                     ; =64
	ret
LBB19_8:
Ltmp121:
	b	LBB19_12
LBB19_9:
Ltmp116:
	mov	x20, x0
Ltmp117:
	add	x0, sp, #8                      ; =8
	bl	__ZNSt3__16localeD1Ev
Ltmp118:
	b	LBB19_13
LBB19_10:
Ltmp124:
	b	LBB19_12
LBB19_11:
Ltmp113:
LBB19_12:
	mov	x20, x0
LBB19_13:
Ltmp125:
	mov	x0, x19
	bl	__ZNSt3__115basic_streambufIcNS_11char_traitsIcEEED2Ev
Ltmp126:
; %bb.14:
	mov	x0, x20
	bl	__Unwind_Resume
LBB19_15:
Ltmp110:
	bl	___cxa_call_unexpected
LBB19_16:
Ltmp127:
	bl	___clang_call_terminate
	.loh AdrpLdrGot	Lloh77, Lloh78
	.loh AdrpLdrGot	Lloh75, Lloh76
	.loh AdrpLdrGot	Lloh79, Lloh80
Lfunc_end8:
	.cfi_endproc
	.section	__TEXT,__gcc_except_tab
	.p2align	2
GCC_except_table19:
Lexception8:
	.byte	255                             ; @LPStart Encoding = omit
	.byte	155                             ; @TType Encoding = indirect pcrel sdata4
	.uleb128 Lttbase5-Lttbaseref5
Lttbaseref5:
	.byte	1                               ; Call site Encoding = uleb128
	.uleb128 Lcst_end8-Lcst_begin8
Lcst_begin8:
	.uleb128 Lfunc_begin8-Lfunc_begin8      ; >> Call Site 1 <<
	.uleb128 Ltmp108-Lfunc_begin8           ;   Call between Lfunc_begin8 and Ltmp108
	.byte	0                               ;     has no landing pad
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp108-Lfunc_begin8           ; >> Call Site 2 <<
	.uleb128 Ltmp109-Ltmp108                ;   Call between Ltmp108 and Ltmp109
	.uleb128 Ltmp110-Lfunc_begin8           ;     jumps to Ltmp110
	.byte	1                               ;   On action: 1
	.uleb128 Ltmp111-Lfunc_begin8           ; >> Call Site 3 <<
	.uleb128 Ltmp112-Ltmp111                ;   Call between Ltmp111 and Ltmp112
	.uleb128 Ltmp113-Lfunc_begin8           ;     jumps to Ltmp113
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp114-Lfunc_begin8           ; >> Call Site 4 <<
	.uleb128 Ltmp115-Ltmp114                ;   Call between Ltmp114 and Ltmp115
	.uleb128 Ltmp116-Lfunc_begin8           ;     jumps to Ltmp116
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp119-Lfunc_begin8           ; >> Call Site 5 <<
	.uleb128 Ltmp120-Ltmp119                ;   Call between Ltmp119 and Ltmp120
	.uleb128 Ltmp121-Lfunc_begin8           ;     jumps to Ltmp121
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp120-Lfunc_begin8           ; >> Call Site 6 <<
	.uleb128 Ltmp122-Ltmp120                ;   Call between Ltmp120 and Ltmp122
	.byte	0                               ;     has no landing pad
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp122-Lfunc_begin8           ; >> Call Site 7 <<
	.uleb128 Ltmp123-Ltmp122                ;   Call between Ltmp122 and Ltmp123
	.uleb128 Ltmp124-Lfunc_begin8           ;     jumps to Ltmp124
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp117-Lfunc_begin8           ; >> Call Site 8 <<
	.uleb128 Ltmp126-Ltmp117                ;   Call between Ltmp117 and Ltmp126
	.uleb128 Ltmp127-Lfunc_begin8           ;     jumps to Ltmp127
	.byte	3                               ;   On action: 2
	.uleb128 Ltmp126-Lfunc_begin8           ; >> Call Site 9 <<
	.uleb128 Lfunc_end8-Ltmp126             ;   Call between Ltmp126 and Lfunc_end8
	.byte	0                               ;     has no landing pad
	.byte	0                               ;   On action: cleanup
Lcst_end8:
	.byte	127                             ; >> Action Record 1 <<
                                        ;   Filter TypeInfo -1
	.byte	0                               ;   No further actions
	.byte	1                               ; >> Action Record 2 <<
                                        ;   Catch TypeInfo 1
	.byte	0                               ;   No further actions
	.p2align	2
                                        ; >> Catch TypeInfos <<
	.long	0                               ; TypeInfo 1
Lttbase5:
                                        ; >> Filter TypeInfos <<
	.byte	0
	.p2align	2
                                        ; -- End function
	.section	__TEXT,__cstring,cstring_literals
l_.str.1:                               ; @.str.1
	.asciz	"pairs"

l_.str.2:                               ; @.str.2
	.asciz	"x0"

l_.str.3:                               ; @.str.3
	.asciz	"y0"

l_.str.4:                               ; @.str.4
	.asciz	"x1"

l_.str.5:                               ; @.str.5
	.asciz	"y1"

l_.str.6:                               ; @.str.6
	.asciz	"Usage: %s [filename]\n"

l_.str.7:                               ; @.str.7
	.asciz	"Input Size: %ld\n"

l_.str.8:                               ; @.str.8
	.asciz	"Pair count: %lu\n"

l_.str.9:                               ; @.str.9
	.asciz	"TOTAL TIME: %llu; PARSE_TIME: %llu; COMPUTE_TIME: %llu\n"

l_.str.10:                              ; @.str.10
	.asciz	"PERCENT PARSED %f; PERCENT COMPUTE: %f\n"

l_.str.11:                              ; @.str.11
	.asciz	"Haversine Sum: %.17g\n"

	.section	__DATA,__const
	.globl	__ZTVNSt3__114basic_ifstreamIcNS_11char_traitsIcEEEE ; @_ZTVNSt3__114basic_ifstreamIcNS_11char_traitsIcEEEE
	.weak_def_can_be_hidden	__ZTVNSt3__114basic_ifstreamIcNS_11char_traitsIcEEEE
	.p2align	3
__ZTVNSt3__114basic_ifstreamIcNS_11char_traitsIcEEEE:
	.quad	424
	.quad	0
	.quad	__ZTINSt3__114basic_ifstreamIcNS_11char_traitsIcEEEE
	.quad	__ZNSt3__114basic_ifstreamIcNS_11char_traitsIcEEED1Ev
	.quad	__ZNSt3__114basic_ifstreamIcNS_11char_traitsIcEEED0Ev
	.quad	-424
	.quad	-424
	.quad	__ZTINSt3__114basic_ifstreamIcNS_11char_traitsIcEEEE
	.quad	__ZTv0_n24_NSt3__114basic_ifstreamIcNS_11char_traitsIcEEED1Ev
	.quad	__ZTv0_n24_NSt3__114basic_ifstreamIcNS_11char_traitsIcEEED0Ev

	.globl	__ZTTNSt3__114basic_ifstreamIcNS_11char_traitsIcEEEE ; @_ZTTNSt3__114basic_ifstreamIcNS_11char_traitsIcEEEE
	.weak_def_can_be_hidden	__ZTTNSt3__114basic_ifstreamIcNS_11char_traitsIcEEEE
	.p2align	3
__ZTTNSt3__114basic_ifstreamIcNS_11char_traitsIcEEEE:
	.quad	__ZTVNSt3__114basic_ifstreamIcNS_11char_traitsIcEEEE+24
	.quad	__ZTCNSt3__114basic_ifstreamIcNS_11char_traitsIcEEEE0_NS_13basic_istreamIcS2_EE+24
	.quad	__ZTCNSt3__114basic_ifstreamIcNS_11char_traitsIcEEEE0_NS_13basic_istreamIcS2_EE+64
	.quad	__ZTVNSt3__114basic_ifstreamIcNS_11char_traitsIcEEEE+64

	.globl	__ZTCNSt3__114basic_ifstreamIcNS_11char_traitsIcEEEE0_NS_13basic_istreamIcS2_EE ; @_ZTCNSt3__114basic_ifstreamIcNS_11char_traitsIcEEEE0_NS_13basic_istreamIcS2_EE
	.weak_def_can_be_hidden	__ZTCNSt3__114basic_ifstreamIcNS_11char_traitsIcEEEE0_NS_13basic_istreamIcS2_EE
	.p2align	3
__ZTCNSt3__114basic_ifstreamIcNS_11char_traitsIcEEEE0_NS_13basic_istreamIcS2_EE:
	.quad	424
	.quad	0
	.quad	__ZTINSt3__113basic_istreamIcNS_11char_traitsIcEEEE
	.quad	__ZNSt3__113basic_istreamIcNS_11char_traitsIcEEED1Ev
	.quad	__ZNSt3__113basic_istreamIcNS_11char_traitsIcEEED0Ev
	.quad	-424
	.quad	-424
	.quad	__ZTINSt3__113basic_istreamIcNS_11char_traitsIcEEEE
	.quad	__ZTv0_n24_NSt3__113basic_istreamIcNS_11char_traitsIcEEED1Ev
	.quad	__ZTv0_n24_NSt3__113basic_istreamIcNS_11char_traitsIcEEED0Ev

	.private_extern	__ZTSNSt3__114basic_ifstreamIcNS_11char_traitsIcEEEE ; @_ZTSNSt3__114basic_ifstreamIcNS_11char_traitsIcEEEE
	.section	__TEXT,__const
	.globl	__ZTSNSt3__114basic_ifstreamIcNS_11char_traitsIcEEEE
	.weak_definition	__ZTSNSt3__114basic_ifstreamIcNS_11char_traitsIcEEEE
__ZTSNSt3__114basic_ifstreamIcNS_11char_traitsIcEEEE:
	.asciz	"NSt3__114basic_ifstreamIcNS_11char_traitsIcEEEE"

	.private_extern	__ZTINSt3__114basic_ifstreamIcNS_11char_traitsIcEEEE ; @_ZTINSt3__114basic_ifstreamIcNS_11char_traitsIcEEEE
	.section	__DATA,__const
	.globl	__ZTINSt3__114basic_ifstreamIcNS_11char_traitsIcEEEE
	.weak_definition	__ZTINSt3__114basic_ifstreamIcNS_11char_traitsIcEEEE
	.p2align	3
__ZTINSt3__114basic_ifstreamIcNS_11char_traitsIcEEEE:
	.quad	__ZTVN10__cxxabiv120__si_class_type_infoE+16
	.quad	__ZTSNSt3__114basic_ifstreamIcNS_11char_traitsIcEEEE-9223372036854775808
	.quad	__ZTINSt3__113basic_istreamIcNS_11char_traitsIcEEEE

	.globl	__ZTVNSt3__113basic_filebufIcNS_11char_traitsIcEEEE ; @_ZTVNSt3__113basic_filebufIcNS_11char_traitsIcEEEE
	.weak_def_can_be_hidden	__ZTVNSt3__113basic_filebufIcNS_11char_traitsIcEEEE
	.p2align	3
__ZTVNSt3__113basic_filebufIcNS_11char_traitsIcEEEE:
	.quad	0
	.quad	__ZTINSt3__113basic_filebufIcNS_11char_traitsIcEEEE
	.quad	__ZNSt3__113basic_filebufIcNS_11char_traitsIcEEED1Ev
	.quad	__ZNSt3__113basic_filebufIcNS_11char_traitsIcEEED0Ev
	.quad	__ZNSt3__113basic_filebufIcNS_11char_traitsIcEEE5imbueERKNS_6localeE
	.quad	__ZNSt3__113basic_filebufIcNS_11char_traitsIcEEE6setbufEPcl
	.quad	__ZNSt3__113basic_filebufIcNS_11char_traitsIcEEE7seekoffExNS_8ios_base7seekdirEj
	.quad	__ZNSt3__113basic_filebufIcNS_11char_traitsIcEEE7seekposENS_4fposI11__mbstate_tEEj
	.quad	__ZNSt3__113basic_filebufIcNS_11char_traitsIcEEE4syncEv
	.quad	__ZNSt3__115basic_streambufIcNS_11char_traitsIcEEE9showmanycEv
	.quad	__ZNSt3__115basic_streambufIcNS_11char_traitsIcEEE6xsgetnEPcl
	.quad	__ZNSt3__113basic_filebufIcNS_11char_traitsIcEEE9underflowEv
	.quad	__ZNSt3__115basic_streambufIcNS_11char_traitsIcEEE5uflowEv
	.quad	__ZNSt3__113basic_filebufIcNS_11char_traitsIcEEE9pbackfailEi
	.quad	__ZNSt3__115basic_streambufIcNS_11char_traitsIcEEE6xsputnEPKcl
	.quad	__ZNSt3__113basic_filebufIcNS_11char_traitsIcEEE8overflowEi

	.private_extern	__ZTSNSt3__113basic_filebufIcNS_11char_traitsIcEEEE ; @_ZTSNSt3__113basic_filebufIcNS_11char_traitsIcEEEE
	.section	__TEXT,__const
	.globl	__ZTSNSt3__113basic_filebufIcNS_11char_traitsIcEEEE
	.weak_definition	__ZTSNSt3__113basic_filebufIcNS_11char_traitsIcEEEE
__ZTSNSt3__113basic_filebufIcNS_11char_traitsIcEEEE:
	.asciz	"NSt3__113basic_filebufIcNS_11char_traitsIcEEEE"

	.private_extern	__ZTINSt3__113basic_filebufIcNS_11char_traitsIcEEEE ; @_ZTINSt3__113basic_filebufIcNS_11char_traitsIcEEEE
	.section	__DATA,__const
	.globl	__ZTINSt3__113basic_filebufIcNS_11char_traitsIcEEEE
	.weak_definition	__ZTINSt3__113basic_filebufIcNS_11char_traitsIcEEEE
	.p2align	3
__ZTINSt3__113basic_filebufIcNS_11char_traitsIcEEEE:
	.quad	__ZTVN10__cxxabiv120__si_class_type_infoE+16
	.quad	__ZTSNSt3__113basic_filebufIcNS_11char_traitsIcEEEE-9223372036854775808
	.quad	__ZTINSt3__115basic_streambufIcNS_11char_traitsIcEEEE

	.section	__TEXT,__cstring,cstring_literals
l_.str.15:                              ; @.str.15
	.asciz	"r"

.subsections_via_symbols
