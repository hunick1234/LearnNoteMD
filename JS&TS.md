## 關於TypeScript 

### 文章
   [Day 01. 遠征 TypeScript・行前準備](https://ithelp.ithome.com.tw/articles/10214714)

   [TypeScript 新手指南](https://willh.gitbook.io/typescript-tutorial/introduction)

   [TypeScript 學習之路](https://magiclen.org/typescript-introduction/)

   [TypeScript Handbook](https://zhongsp.gitbooks.io/typescript-handbook/content/)

1. ### tsc操作
   
- TypeScript要經過 tsc編譯器編譯成(```tsc xxx.ts```) .js 再由js(nodeJS) 執行 
- 可使用ts-node直接運行(```ts-node xxx.ts```) 不用產生.js檔
- 動態監視 ```tsc -w xxx.ts``` 監看是否更新.ts(記得CTRL+S) 並自動更新 .js  *退出CTRL+C*
- 初始化生成tsconfing.json ```tsc --init```
   
2. ### 基本型別
    
   number : 數字 

   string : 字串 

   boolean: 布林

   symbol : 

   any    : 任意類型 

   object :

3. ### 關於框架
   1. Nestjs框架
   [Nestjs framework 30天初探](https://ithelp.ithome.com.tw/articles/10190659)


   1. Angular
   [Angular 超入門學前幼幼班(一)](https://w3c.hexschool.com/blog/ece02e8d)下面有其他教學

   1. ReactJS

   [React](https://zh-hant.reactjs.org/)



   ## 關於javaScript

   [Javascript 動態網頁程式設計](http://dic.vbird.tw/javascript/unit02.php)
   
   [JavaScript 教程](https://wangdoc.com/javascript/dom/nodelist.html)

   [es6入門](https://es6.ruanyifeng.com/#docs/function)

   [w3school](http://www.w3big.com/zh-TW/js/js-if-else.html)

   #### 回調函數

    也許有人有疑問了：一定要以參數形式傳過去嗎，我不可以直接在函數a裡面調用函數b嗎？ 確實可以。

    解惑：如果你直接在函數a里調用的話，那麼這個回調函數就被限制死了。 但是使用函數做參數就有下面的好處：當你a（b）的時候函數b就成了回調函數，而你還可以a（c）這個時候，函數c就成了回調函數。 如果你寫成了function a（）{...; b(); }就失去了變數的靈活性。

    ```js
      function a(callback){   
          alert("我是parent函数a！");
          alert("調用回調函數");
          callback();
      }
      function b(){
          alert("我是回調函數b");
      
      }
      function c(){
          alert("我是回調函數c");
      
      }
      
      function test(){
          a(b);
          a(c);
      }

    ```

### AJAX

