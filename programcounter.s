.text
    .global main
    main:
        push {ip, lr}

        mov r0, #1
        mov r0, #2
        mov r0, #3
        add pc, pc, #4 // Due to the pipelining `pc` points two instruction
                       // ahead. By adding four we effectively make it point
                       // to three instruction ahead.
        mov r0, #4
        mov r0, #5
        mov r0, #6 // We jump to this instuction

        /* We end up with six in r0 */

        pop {ip, lr}
        bx lr
