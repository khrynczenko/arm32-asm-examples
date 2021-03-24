/* Hello-world program.     Print "Hello, assembly!" and exit with code 42. */
.data
    hello:
        .string "Hello, assembly!\n"

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
        add r0, r0, #42
        bx lr
