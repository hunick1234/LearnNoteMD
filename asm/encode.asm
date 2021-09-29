TITLE  CountMatches  
.386
.model flat,stdcall
.stack 4096
;CountMatches proto
ExitProcess PROTO, dwExitCode:DWORD



.data

	worde byte "abcdefg",0
	move byte -5,8,7,8,-10
	decode byte 5,-8,-7,-8,10

.code
_main   PROC
	
	push offset worde
	push lengthof worde-1

	push offset move
	push lengthof move

	call encode

	push offset worde
	push lengthof worde-1

	push offset decode
	push lengthof decode

	call encode



	invoke ExitProcess,0
_main   ENDP


;ascill 32d-126d  20h-71h
encode proc uses ecx ebx esi edi
	local encA :ptr byte
	local encLen:word
	local moveA :ptr byte
	local temp :ptr byte
	local moveLen:word

	mov bx,0
	mov ecx,0
	
	mov ax,[ebp+8] 
	mov moveLen,ax

	mov eax,[ebp+12]
	mov temp,eax
	mov moveA,eax
	mov ax,[ebp+16]
	mov encLen,ax
	mov eax,[ebp+20]
	mov encA,eax

	mov cx,encLen
	mov eax,0

l1:
	cmp bx,moveLen
	je reset
	jmp no
	reset:
	mov bx,0
	mov edx,temp
	mov moveA,edx
	no:
	mov esi,moveA
	mov al,[esi]
	mov esi,encA
	mov ah,[esi]
	add ah,al

	cmp ah,126 ;if >
	ja dabove
	jmp oo
	dabove:
	sub ah,126
	add ah,31

	jmp oo

	cmp ah,32 ;if <
	jnb small
	jmp oo
	small:
	mov dl,32
	sub dl,ah
	mov ah,96
	sub ah,dl
	jmp oo
	
	oo:

	mov [esi],ah

	add moveA,1
	add encA,1
	inc  bx

loop l1

	ret
encode endp