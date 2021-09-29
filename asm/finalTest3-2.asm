
;********************
;answer in eax      *
;********************
.data
	n dword 500
	k dword 25
.code
_main   PROC

	PUSH n
	push k
	call Gcd

 	invoke ExitProcess,0
_main   ENDP

Gcd proc uses  edx
	local www:dword  ;偷懶用

	mov eax,0

	mov eax,[ebp+12]  ;n
	mov ebx,[ebp+8]	  ;k

	cdq
	div ebx      ;edx save mod  eax/ebx  edx 
	cmp edx,0	;if k==0 go return
	je r
	push ebx      ;n=k
	push edx	  ;k=mod 榆樹
	call Gcd
	r:
	mov eax,ebx
	ret 

Gcd endp

END _main