;*****************************
;* smallest ptr in eax		 *
;* 氣泡排序                  *
;* 由小到大		             *
;* ecx == array len          *
;*****************************
FindSmallest proc uses esi ebx ecx  
	
	local temp:dword
	local head:dword ; arr head
	
	mov esi,[ebp+8]
	mov head,esi
	mov eax,esi
	mov ecx,0
	mov ecx,[ebp+12]
	sub ecx,1

l2:
	push ecx
	mov ebx,[esi]
	mov temp,ebx ;temp array[0]
l1:
	add head,4   ;head[+1]
	mov edi,head
	mov ebx,[edi];*head
	cmp temp,ebx
	;if temp>esi[] jg big then temp is smllest eax is smallest ptr
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

FindSmallest endp

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
