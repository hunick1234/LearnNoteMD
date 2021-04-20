[組語基本指令集](https://zh.wikibooks.org/wiki/X86%E7%B5%84%E5%90%88%E8%AA%9E%E8%A8%80/%E5%9F%BA%E6%9C%AC%E6%8C%87%E4%BB%A4%E9%9B%86)

[Assembly Language for x86 Processors](http://www.asmirvine.com/)

[小木偶的網頁(組語教學)](https://wanker742126.neocities.org/)

[基礎講解](https://blog.xuite.net/asd.wang/alog/269346)

[組語筆記](http://www2.csie.ntnu.edu.tw/~u99256/csie_share_files/Assembly_Languag/SS.pdf)

[組語筆記2](http://www2.csie.ntnu.edu.tw/~u99256/csie_share_files/Assembly_Languag/Assembly%20Languag%20Note.pdf)

***!!*vs2019 設置注意,組態設定改成x86(win32),x64不支援assembly**

asm 
```asm
.386
.model flat,stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD

.data
   ;your 變數

.code
main    PROC
   ;your code
    
    
invoke ExitProcess,0
main    ENDP
END main
```
-----


資料型態

BYTE,  SBYTE       => 8bit,  *s=signed* 有號數

WORD,  SWORD       => 16bit, 

DWORD, SDWORD      => 32bit

QWORD              => 64bit

TBYTE              => 80bit

命名方式

[參數名] [型態] [變數值] ;

ex:

`` a BYTE 'A'`;

`b BYTE  0` ;

`c sbyte -128`; *大小寫沒有強制規定*  

`d BYTE  ?` ;  *?=>任何型態都行,但要符合記憶體大小*

`alist BYTE 10,20,30,15`     ; 陣列

mlist BYTE 10,20,30,10<br>
　　　BYTE 10,20,50,12     ; 二維陣列

`slist BYTE ?,22,45h,'a'`    ; 只要符合記憶體大小,陣列捨麼都能放

`s     BYTE 'f','u','c','k'` ; 

`str   BYTE "hello",0` ; 字串結束後要補一個0 null位元
<br>
`str1  BYTE "hello", 0Dh, 0Ah` 　;0Dh回車,0Ah換行

------

### mov

**mov限制**
```mov eax,10```

移動的位置,必須要有一個是記憶體(ex:ecx,eax,ebx......)


###  inc
功能 加一

```c
int a =0
a+=1
```

```c
;asm
a BYTE 0
inc a
```

### loop 使用

cx 是控制迴圈次數 設定好後 會自動減1 

遇到loop才會執行

先執行 mov
然後才遇到loop

lp:
    mov array+cx,array+cx-1
    loop lp

每次執行loop指令，CX減1，然後判斷CX是否等於0。 如果不為0則轉移到loop指令后的標號處，實現迴圈;如果為0順序執行。
每次執行rep指令，CX減1，然後判斷CX是否等於0，如果不為0則繼續執行rep指令後的串操作指令，直到CX為0

實位址模式中，CX 是 LOOP 指令的預設迴圈計數

第一步，ECX 減 1。

第二步，將 ECX 與 0 比較。

         6+6+6+6
            ||
            \/
```asm
CODE SEGMENT				;定义代码段
ASSUME CS:CODE,DS:DATA     ;将CS和CODE，DS和DATA段建立联系
START: 
       MOV AX,0            ;初始化AX,用于存储求和结果
       MOV CX,5            ;初始化循环次数，每循环一次，CX会自动减1，
                           ;不需要自己写代码减循环累加       
L:
       ADD AX,6
LOOP L
 
       MOV AH,4C00H         ;将控制权返回给终端。
       INT 21H
CODE ENDS
END START
 ```

### Flag計算

