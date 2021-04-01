.data
    correctly_added:
        .string "Correctly added all values from the stack.\n"

.text
    .global main
    main:
        push {ip, lr}

        mov r1, #1
        mov r2, #2
        mov r3, #3
        mov r4, #4
        push {r1, r2, r3, r4}

        pop {r3, r4}
        add r0, r3, r4
        pop {r3, r4}
        add r0, r0, r3
        add r0, r0, r4

        cmp r0, #10
        bne finish
        ldr r0, =correctly_added
        bl printf

    finish:
        mov r0, #0
        pop {ip, lr}
        bx lr
