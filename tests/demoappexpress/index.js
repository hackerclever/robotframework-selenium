const express = require("express");
const app     = express();
const path    = require("path");

app.use(express.static('html'))
app.get('/',function(req,res){
  res.sendFile(path.join(__dirname+'/html/index.html'));
  //__dirname : It will resolve to your project folder.
});

// app.get('/error.html',function(req,res){
//   res.sendFile(path.join(__dirname+'/html/error.html'));
// });

// app.get('/welcome.html',function(req,res){
//   res.sendFile(path.join(__dirname+'/html/welcome.html'));
// });

app.listen(7272);

console.log("Running at Port 3000");