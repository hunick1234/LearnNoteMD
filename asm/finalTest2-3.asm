TITLE  CountMatches  
.386
.model flat,stdcall
.stack 4096

ExitProcess PROTO, dwExitCode:DWORD

;************************
;*answer in Array re	*
;*數字種類小於100種		 *


.data
	re dword 100 dup(0)
	teat dword 1,2,5,4,1,5,7,6,3,4,5,8,7,0,2,3,8,4,5,1,5,5,4,3

_main   PROC


	push lengthof teat
	push offset teat
	call sort

	push offset  re
	push lengthof teat
	push offset teat

	call CountArrayNumber


	invoke ExitProcess,0
_main   ENDP


;*************************
;* array is sort		 *
;*eax return count array *
;*兩個兩個比較			 *
;*ex:114578 =>11 14 45 57 78 *
CountArrayNumber proc uses esi edi eax ecx ebx
	
	local temp:dword

	mov esi,[ebp+8]
	mov ecx,[ebp+12]
	mov edi,[ebp+16]
	

hi:
	mov eax,[esi]
	mov temp,eax
	add esi,4
	mov ebx,[esi]
	cmp ebx,temp
	je same
	jmp notSame
	same:
	mov ebx,[edi]
	inc ebx
	mov [edi],ebx
	
	jmp gogo
	notSame:
	mov ebx,[edi]
	inc ebx
	mov [edi],ebx

	add edi,4
	
	gogo:

loop hi



	ret

CountArrayNumber endp

;*****************************
;*find smallest val and  sort*
;* smallest ptr in eax		 *
;* 氣泡排序                  *
;* 由小到大		             *
;* ecx == array len     
;* use dword                 *
;*****************************

sort proc uses esi ebx ecx eax
	
	local temp:dword
	local head:dword ;
	

	mov esi,[ebp+8]  ;arr
	mov head,esi
	mov eax,esi
	mov ecx,0
	mov ecx,[ebp+12] ;len
	sub ecx,1

l2:
	push ecx
	mov ebx,[esi] ;當前頭的位置
	mov temp,ebx ;temp array[0]
l1:
	add head,4   ;head[+1]
	mov edi,head
	mov ebx,[edi];head[]
	cmp temp,ebx
	;if temp>esi[] jg big then temp is smllest val eax is smallest ptr
	jg big  
	jmp ed
	big:
	mov temp,ebx  
	mov eax,head
	ed:

loop l1
	
	pop ecx

	cmp eax,esi  ;check if smallest == array head 
	je dont
	call Swap
	dont:
	add esi,4
	mov head,esi
	mov eax,head
	
loop l2

late:

	ret 

sort endp



;********************
;*交換記憶體上的值   *
;*eax smallest		*
;*ebx head ptr		*
;********************
Swap proc uses ebx eax edx

	local temp:dword
	local temp2:dword

	;push ebp
	;mov ebp,esp

	mov ebx,esi

	mov edx,[eax]
	mov temp,edx
	mov edx,[ebx]
	mov temp2,edx
	
	mov edx,temp
	mov [ebx],edx
	mov edx,temp2
	mov [eax],edx


	ret

Swap endp

END _main