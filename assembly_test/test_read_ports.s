
.global _Read_x1
.global _Read_x2
.global _Read_x3
.global _Read_x4

.text

.balign 8
_Read_x1:
.loop1:
    ldr x2, [x1]     
    subs x0, x0, #1 
    bgt .loop1     
    ret


.balign 8
_Read_x2:
.loop2:
    ldr x2, [x1]     
    ldr x2, [x1]     
    subs x0, x0, #2 
    bgt .loop2      
    ret

.balign 8
_Read_x3:
.loop3:
    ldr x2, [x1]     
    ldr x2, [x1]     
    ldr x2, [x1]     
    subs x0, x0, #3 
    bgt .loop3      
    ret

.balign 8
_Read_x4:
.loop4:
    ldr x2, [x1]     
    ldr x2, [x1]     
    ldr x2, [x1]     
    ldr x2, [x1]     
    subs x0, x0, #4 
    bgt .loop4      
    ret
