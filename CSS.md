### 關於CSS
 - ```. -> class```

 - ```# -> id```

   [css文章](https://www.oxxostudio.tw/index.html?tag-css)

   [css教學](https://www.1keydata.com/css-tutorial/tw/apply.php)Tailwind CSS

   [css速查](https://www.css88.com/doc/css3/quicksearch/)

 *css設定*
 
   **scss**

   ``` border-radius: 50px;``` 圓角

   ``` background-image: linear-gradient(to top, #ff9a9e 0%, #fecfef 99%, #fecfef 100%);```[顏色漸成](https://webgradients.com/)


[CSS 排版觀念 position 參數說明](http://jendo.org/files/doc/div.html)


偽類前不行加空格 不然會無法動作
```css 
  .submit:active{
    background-color: #d42525; //can
    
  }

  .submit :active{
    background-color: #d42525; //can't
    
  }
```