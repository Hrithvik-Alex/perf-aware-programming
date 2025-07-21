.global _NOPx1ASM
.global _NOPx2ASM
.global _NOPx3ASM
.global _NOPx4ASM
.global _NOPx5ASM
.global _NOPx6ASM
.global _NOPx7ASM
.global _NOPx8ASM

.text

// @NOTE(BDJ): On ARM64, the first 8 parameters to a function are passed
// in registers x0-x7. x9-x15 are available as temporary registers. So--
//
//     x0 holds the count
//     x1 holds the base data pointer

// @NOTE(BDJ): There is no variable-length `nop` instruction in ARM64. But there are SOME variable-length instructions!
.balign 8
_NOPx1ASM:
	eor x9, x9, x9
loop_nop1:
	nop
	add x9, x9, #1
	cmp x9, x0
	b.lo loop_nop1
	ret
.balign 8
_NOPx2ASM:
	eor x9, x9, x9
loop_nop2:
	nop
	nop
	add x9, x9, #1
	cmp x9, x0
	b.lo loop_nop2
	ret
.balign 8
_NOPx3ASM:
	eor x9, x9, x9
loop_nop3:
	nop
	nop
	nop
	add x9, x9, #1
	cmp x9, x0
	b.lo loop_nop3
	ret
.balign 8
_NOPx4ASM:
	eor x9, x9, x9
loop_nop4:
	nop
	nop
	nop
	nop
	add x9, x9, #1
	cmp x9, x0
	b.lo loop_nop4
	ret
.balign 8
_NOPx5ASM:
	eor x9, x9, x9
loop_nop5:
	nop
	nop
	nop
	nop
	nop
	add x9, x9, #1
	cmp x9, x0
	b.lo loop_nop5
	ret
.balign 8
_NOPx6ASM:
	eor x9, x9, x9
loop_nop6:
	nop
	nop
	nop
	nop
	nop
	nop
	add x9, x9, #1
	cmp x9, x0
	b.lo loop_nop6
	ret
.balign 8
_NOPx7ASM:
	eor x9, x9, x9
loop_nop7:
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	add x9, x9, #1
	cmp x9, x0
	b.lo loop_nop7
	ret
.balign 8
_NOPx8ASM:
	eor x9, x9, x9
loop_nop8:
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	add x9, x9, #1
	cmp x9, x0
	b.lo loop_nop8
	ret
.end

