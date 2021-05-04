var express = require("express")

var app=express();

app.set("port", process.env.PORT || 3000);

app.get("/",function(req,res){
    res.type("text/plain");
    res.send("hello its me");
});

app.use(function(req,res){
        res.type("text/plain");
        res.status(404);
        res.send("404--not~~found");

});

app.use(function(err,res,req,next){
    console.error(err.stack);
    res.type("text/plain");
    res.status(500);
    res.send("500--errow");
});

app.listen(app.get("port"),function(){
    console.log("eee started on localhost:" 
    + app.get("port")+";cc");
});