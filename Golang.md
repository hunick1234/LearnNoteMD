### 關於Go

   [Go設計與實現](https://draveness.me/golang/docs/part3-runtime/ch06-concurrency/golang-channel/)

   [用GO打造WEB應用](https://willh.gitbook.io/build-web-application-with-golang-zhtw/04.0)

   [go社區文檔](https://learnku.com/go/docs)

   [GO Package CN](https://studygolang.com/pkgdoc)

   [Go文件操作](https://www.devdungeon.com/content/working-files-go)

   [Go文件操作CN](https://mp.weixin.qq.com/s/dQUEq0lJekEUH4CHEMwANw)
1. #### 基本
   1. array和slice
   
      slice
      ```a := []int{1, 2, 30};  b:=a```      
      
      當a被修改時,b也會修改 slice共享底層位址
   
      array
      ```a := [3]int{1, 2, 30}; b:=a``` 
      當a被修改時,b不會修改 array coby一份新的
      [...]語法糖 自動算陣列大小
   
   2. channel & Goroutine
      [文章](https://zhuanlan.zhihu.com/p/55295257)
      
      - Go 也允許指定 channel 的緩衝大小，很簡單，就是 channel 可以儲存多少元素。ch:= make(chan bool, 4)，建立了可以儲存 4 個元素的 bool 型 channel。在這個 channel 中，前 4 個元素可以無阻塞的寫入。當寫入第 5 個元素時，程式碼將會阻塞，直到其他 goroutine 從 channel 中讀取一些元素，騰出空間。
   
   3. 對指標進行直接操作
      
      [unsafe包簡介 Golang中pointer的觀念](https://www.mdeditor.tw/pl/gr8H/zh-tw)

      go無法直接進行指標操作(ex:數學運算,在使用unsafe包時,可以解除限制

      ```go
      s:=1
      a:=&s                             //為了安全無法對a進行數學運算  ; == 除外
      this:=uintptr(unsafe.Pointer(&a)) //可以對this進行數學運算
      
      ```
      

2. #### Go延伸框架
   1. colly 
   爬蟲框架
   1. Gin
   網頁框架

      [Gin講解](https://github.com/overnote/over-golang/blob/master/05-%E5%B8%B8%E7%94%A8%E6%A1%86%E6%9E%B6/gin-01-%E5%9F%BA%E6%9C%AC%E4%BD%BF%E7%94%A8.md)

   1.HUGO
   靜態網頁框架

      教學文

      [Hugo 貼身打造個人部落格](https://ithelp.ithome.com.tw/users/20106430/ironman/3613)

3. #### 小坑注意
- 對於slice做切片需注意
  ```go 
  a:=[]int{1,2,3}
  b:=a[:] //b=1,2,3
  a[0]=5 //b=5,2,3
  //or
  b[0]=9 //a=9,2,3
  ```

  都是修改同個底層值

  要不影響的話 要用append or copy的方式 
  ```go 
  s:=[]int{1,2,3}
  s1 = append(s1, s[:]...)
  s1[0]=55 //s=1,2,3

  ```
  

- := 只能用於funciton內, 全域變數記得用var
   ```go
   var a int

   c:=10  //error!! non-declaration statement outside function body
   func main(){
      b:=10 
   }
   ```
- 全域變數沒有使用到不會報錯
   ```go
   var a = 10
   func main(){
      c:=10
      fmt.Println(c)
      b:=10 //b declared but not used 
   }
   ```
- make多維陣列時
  ```go
	one:=make([]int,5) //output= [0,0,0,0,0]
	
   a:=make([][]int,5) //output= [[],[],[],[],[]] 
	a[0][0]=5 // panic!!

	a[0]=make([]int,3) //output= [[0,0,0],[],[],[],[]]
	a[0][0]=5 				 //output= [[5,0,0],[],[],[],[]]

	a[1][0]=5 // panic!!
	fmt.Print(len(a))  // len=5
	fmt.Print(len(a[0]))  // len=3
	fmt.Print(len(a[1]))  // len=0

  ```
- &* bit clear Operators運算符
  ```go
  a &* b 
  1001&^1011==0000
  1101&^1011==0100
  ```
  在a上清除b為1的位元，b不為1的位元xor
  
- map in struct
  
   [click me](https://stackoverflow.com/questions/34972157/structure-with-nested-maps-golang)

   ```go
   type add struct {
		cd map[int]int
	}

	ddd := &add{cd: map[int]int{}}   //init map !!

	ddd.cd[4] = 5
	fmt.Println(ddd)
   ```