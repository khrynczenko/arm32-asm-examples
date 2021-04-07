.data
    sum_message:
        .string "The sum is %u\n"
.text
    sum_five:
        // prelude, i.e., save frame pointer and return address
        push {fp, lr}
        mov fp, sp

        add r0, r0, r1
        add r0, r0, r2
        add r0, r0, r3
        ldr r3, [fp, #8] // We get the last argument from from the previous call stack
        add r0, r0, r3

        pop {fp, pc}

    .global main
    main:
        // prelude, i.e., save frame pointer and return address
        push {fp, lr}
        mov fp, sp // set our frame pointer, so have a static address
        // from which we can access other values on the stack

        // prepare arguments to sum up
        mov r0, #0
        mov r1, #1
        mov r2, #2
        mov r3, #3
        mov r4, #4
        push {r4, ip}

        bl sum_five 
        
        mov r1, r0 // put number to print in `r1`
        ldr r0, =sum_message // put address of the string with format to print in `r0`
        bl printf

        add sp, sp, #8 // deallocate the stack
        pop {fp, lr}
        bx lr
