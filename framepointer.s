.data
    fp_message:
        .string "The fp address is %u\n"

    sp_before_message:
        .string "The sp address before push is %u\n"
    sp_after_message:
        .string "The sp address after push is %u\n"
.text
    .global main
    main:
        push {fp, lr}
        mov fp, sp // set our frame pointer, so have a static address
                   // from which we can access other values on the stack

        mov r1, fp
        ldr r0, =fp_message
        bl printf

        mov r1, sp
        ldr r0, =sp_before_message
        bl printf

        push {r0, r1}
        mov r1, sp
        ldr r0, =sp_after_message
        bl printf

        // we could do just pop {r0, r1}, but since we have our
        // fp set to address right after push {fp, lr} we can to below
        mov sp, fp
        pop {fp, lr}
        bx lr
