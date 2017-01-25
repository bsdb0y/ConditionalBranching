#Demonstration of 


.data 
	string1:
		.asciz "Hello World\n"
		len1 = . - string1
	string2:
		.asciz "Zero flsg was set "
		len2 = . - string2
	string3:
		.asciz "Zero flag not set"
		len3 = . - string3
.text 
	.globl _start
	_start:
		nop
		movl $10,%eax
		xorl %eax,%eax  #logical xor of eax register ifself 
		jmp PrintHelloWorld

	FlagNotSetPrint:
		movl $4,%eax
		movl $1,%ebx
		movl $string3,%ecx
		movl $len3,%edx
		int $0x80
		jmp Exitcall


	FlagSetPrint:
                movl $4,%eax
                movl $1,%ebx
                movl $string2,%ecx
                movl $len2,%edx
                int $0x80



	Exitcall:
		movl $1,%eax
		movl $0,%ebx
		int $0x80

	PrintHelloWorld:
		movl $10,%ecx
		PrintTenTimes:
			pushl %ecx
			movl $4,%eax
			movl $1,%ebx
			leal string1,%ecx
			movl $len1,%edx
			int $0x80
			pop %ecx
		Loop PrintTenTimes
		jmp Exitcall
