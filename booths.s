  .section .text
 .globl  booths
        .type booths, @function
booths:
   pushl   %ebp            #Stack Frame set-up
   movl    %esp, %ebp
   subl    $4, %esp        # i -4 from ebp


   movl  $0, -4(%ebp)      #Preparing registers for algorithm
   movl  $0, %eax
   movl  $0, %edx
   movl  $0, %ecx

   movl  12(%ebp), %edi
   andl  $1, %edi
   cmpl  %ecx, %edi       #if(last bit > 0)
   jg ifG


top:
   cmpl  $32, -4(%ebp)    #while(i<32)
   je endif

   movl  %edi, %ecx       # Moving multiplier bit into register
   movl  12(%ebp), %edi
   andl  $1, %edi         # Finding current multiplier bit

   cmpl  %ecx, %edi       #if(last bit > previous last bit)
   jg ifG
   jl ifL

shift:
   sarl  $1, %edx         # Shift answer register
   rcrl  $1, %eax         # Rotate register with CF
   rorl  $1, 12(%ebp)
   incl  -4(%ebp)         # Increment i
   jmp   top  

ifG:
   subl  8(%ebp), %edx   # The D register - multiplicand
   jmp   shift
ifL:
   addl  8(%ebp),%edx    # Add multiplicand to D register
   jmp   shift

endif:
        leave
        ret
