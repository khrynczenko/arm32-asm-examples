/* Hello-world program.     Print "Hello, assembly!" and exit with code 44. */
.data
    hello:
        .string "Hello, assembly!\n"
    fourty_two:
        .word 44

.text
    .global main
    main:
        push {ip, lr}
        ldr r0, =hello
        bl printf

        mov r0, #0
        bl add_fourty_two

        pop {ip, lr}
        bx lr

    add_fourty_two:
        ldr r1, =fourty_two
        ldr r1, [r1]
        add r0, r0, r1
        bx lr
