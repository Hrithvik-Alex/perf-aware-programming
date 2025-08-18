
.global _Cache_bandwith_test


.text 


.p2align 6
_Cache_bandwith_test: 
    mov x4, #1
    mov x3, x2
.loop:
    ldr q0, [x3, #0]
    ldr q1, [x3, #16384]
    ldr q2, [x3, #32768]
    ldr q3, [x3, #49152]

    add x4, x4, #65536 
    # ldr q1, [x3, #8192]
    # ldr q2, [x3, #16384]
    # ldr q3, [x3, #24576]
    # add x4, x4, #32768 
    and x4, x4, x1
    add x3, x2, x4
    subs x0, x0, #64
    bgt .loop
    ret
