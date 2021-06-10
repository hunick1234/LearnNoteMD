[組語基本指令集](https://zh.wikibooks.org/wiki/X86%E7%B5%84%E5%90%88%E8%AA%9E%E8%A8%80/%E5%9F%BA%E6%9C%AC%E6%8C%87%E4%BB%A4%E9%9B%86)

[Assembly Language for x86 Processors](http://www.asmirvine.com/)

[asm基本](https://chucs.github.io/asm-x86-tutorial/)

[小木偶的網頁(組語教學)](https://wanker742126.neocities.org/)

[基礎講解](https://blog.xuite.net/asd.wang/alog/269346)

[組語筆記](http://www2.csie.ntnu.edu.tw/~u99256/csie_share_files/Assembly_Languag/SS.pdf)

[組語筆記2](http://www2.csie.ntnu.edu.tw/~u99256/csie_share_files/Assembly_Languag/Assembly%20Languag%20Note.pdf)

[組語函式講解 cn-tw](http://120.101.8.4/lyhsu/post/..%5Cdatabase%5Cgrade%5C%E7%8E%8B%E4%BF%A1%E4%BB%81%5C%E7%B5%84%E5%90%88%E8%AA%9E%E8%A8%80%E8%AA%B2%E6%9C%ACCHAP05.pdf)

***!!*vs2019 設置注意,組態設定改成x86(win32),x64不支援assembly**
*!masm*
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

組語基本就是使用記憶體的操作，熟系記憶體的大小

### 資料型態

BYTE,  SBYTE       => 8bit,  *s=signed* 有號數

WORD,  SWORD       => 16bit, 

DWORD, SDWORD      => 32bit

QWORD              => 64bit

TBYTE              => 80bit

變數命名方式

[參數名] [型態] [變數值] ;

ex:

``` a BYTE 'A'```;

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



### 暫存器
[暫存器介紹](http://it-easy.tw/masm-class-1/2/)

**暫存器位於中央處理器(CPU)內部，用來暫存指令、位址或是一些數據。暫存器的種類。**

- 通用暫存器：AX、BX、CX、DX
- 指標索引暫存器：SP、BP、SI、DI、IP
- 區段暫存器：CS、DS、ES、SS
 
- sing flag
- zero flag
- esi
- edi

#### Flag旗標
旗標暫存器：Flag

- carry flag
  在無號數算術運算結果的值,大於目地位址所能儲存的值時,會被設定。
   - ex:若目的位址能儲存32位元的值，當執行232+1的運算時,CF會被設定為1。
- ovevflow flag
  在有號數算術運算結果的值大於或小於目地位址儲,存空間所能表示的值時，會被設定
   - ex:

------

### 陣列記憶體位址儲存

*ArrayA*  BYTE陣列(8

| Address   | Value |
| --------- | ----- |
| 0X0000000 | 1     |
| 0X0000001 | 2     |
| 0X0000002 | 3     |
| 0X0000003 | 4     |

*ArrayB*  DWORD陣列(32

| Address    | Value |
| ---------- | ----- |
| 0X0000000  | FFFF0 |
| 0X0000004  | FFFF1 |
| 0X0000008  | FFFF2 |
| 0X00000012 | FFFF3 |



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

### mov類指令

- mov 目的 , 來源 
 - 兩個運算元要一樣的大小
 - 兩個運算元不能是記憶體單元
 - CS , EIP 及 IP 不能是目的運算元
 - 一個立即值不能移至區段暫存器
 - 區段暫存器只能在 real-mode下執行
-movzx 指令 (複製較小值到較大值，整數的補零) 
 - movzx r32 , r/m8
 - movzx r32 , r/m16
 - movzx r16 , r/m8    ; 8bit來源運算元補零擴展到16bit目的運算元
 - 只能用在無號整數
movsx 指令 (複製較小值到較大值，符號擴展) 
 - movzx r32 , r/m8
 - movzx r32 , r/m16
 - movzx r16 , r/m8  ; 低八位元複製後，取出來源最高位元，複製到目的運算元高八位元
 - 只能用在有號整數


### stack堆疊

如過push

### 運算
- shl
- shr