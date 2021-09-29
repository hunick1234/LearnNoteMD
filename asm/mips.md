```lw```: 從記憶體位置載入到暫存器 ex:```lw $t5, 48($s4)``` 
48(偏移量offset)   $s4暫存器=>  $s4+48 load word 到 $t5暫存器 
$s4=int a[20]; 48=>a[12];

```sw``` store word: 暫存器存入記憶體 ex:```sw $t5, 40($s4)```  $s4 to $t5

### 暫存器 32個
$0  $zero constant 0
$1  $at used by assembler
$2  $v0 function result
$3  $v1 function result
$4  $a0 argument 1
$5  $a1 argument 2
$6  $a2 argument 3
$7  $a3 argument 4
$8  $t0 unsaved temporary
$9  $t1 unsaved temporary
$10 $t2 unsaved temporary
$11 $t3 unsaved temporary
$12 $t4 unsaved temporary
$13 $t5 unsaved temporary
$14 $t6 unsaved temporary
$15 $t7 unsaved temporary
$16 $s0 saved temporary
$17 $s1 saved temporary
$18 $s2 saved temporary
$19 $s3 saved temporary
$20 $s4 saved temporary
$21 $s5 saved temporary
$22 $s6 saved temporary
$23 $s7 saved temporary
$24 $t8 unsaved temporary
$25 $t9 unsaved temporary
$26 $k0 reserved for EXCEPTION
$27 $k1 reserved for  EXCEPTION
$28 $gp pointer to global data
$29 $sp stack pointer
$30 $fp frame pointer
$31 $ra return address

$s0 到 $s7 是 暫存器 16號 到23號。存變數用的。
$t0 到 $t7 是 暫存器 8號  到 15號。存temporary variables，存暫時變數用的。
$t0 到 $t7只會在CPU內運算的時候用到。像是我們交換數字，要增加一個tmp變數，才能讓兩數交換。