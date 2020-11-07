<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!-- <script type="text/javascript" src="jquery-1.3.2.min.js"></script> -->
<!-- <script type="text/javascript" src="json2.js"></script> -->
<script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
<meta charset="UTF-8">
<title>News API</title>

<div class="wrapper">
	<p class="top">Free news API for Developers</p>
	<h1><a href="https://newsapi.org/">www.newsapi.org</a></h1>
  </div>
<script>

var url = 'http://newsapi.org/v2/top-headlines?' +
'country=tw&' +
'apiKey=8e702b6238b04fd38c2f3cac1ef392e7';

// var req = new Request(url);
// fetch(req).then(function(response) {
// 	console.log(response.json());
// 	return response.json();
// // 	var resjson = 
// 	//	var str = JSON.stringify(response.json());  
// 	//	console.log(str);
// }).then(function(data){
//         console.log('data1' + data);      
//     })

$.ajax({
  url:
    url,
  method: "GET",
  error: function() {
    console.log("6666");
  },
  success: function(data) {
    processData(data);
  }
});

function processData(data) {
  var articleItems = [];

  for (var i = 0; i < data.articles.length; i++) {
    var author = data.articles[i].author;
    var title = data.articles[i].title;
    var description = data.articles[i].description;
    var artUrl = data.articles[i].url;

    var $author = $('<div class="author">Author: ' + author + "</div >");
    var $title = $(
      "<a href=" + artUrl + '><div class="title">' + title + "</div ></a>"
    );
    var $description = $(
      "<div class='description'>" +
        description +
        "</div >"
    );

    $(".wrapper").append($author, $title, $description);
    console.log(artUrl);
  }
}

	
	
//     var arr3 = JSON.parse(str);     //把字串轉成新的陣列
    
// 	console.log(arr3);
	
</script>

</head>
<body>

<script>


// window.onload=function(){
	
// 	var url = 'http://newsapi.org/v2/top-headlines?' +
// 	'country=tw&' +
// 	'apiKey=8e702b6238b04fd38c2f3cac1ef392e7';

// 	var req = new Request(url);
// 	fetch(req).then(function(response) {
// 		console.log(response.json());
// 	})

// var content = "<table border='1'  bgcolor='#fbdb98'>";
// 			content += "<tr><th width='60'>作者</th><th width='400' >內容</th><th width='200'>描述</th>"
// 					   + "<th width='60' >發佈時間</th><th width='90' >資源</th></tr>";
// 			for(var i=0; i < req.length; i++){
// 				content += "<tr><td align='center'>" + req[i].author + "</td>" + 
// 				           "<td >" + req[i].content + "</td>" +
// 				           "<td>" + req[i].description + "</td>" +
// 				           "<td align='right'>" + req[i].publishedAt + "</td>" +
// 				           "<td align='center'>" + req[i].source + "</td></tr>";
// 			}
// 			content += "</table>";
// 			console.log("-----------------------");
// }
</script>
TEST: <br/>
    <div id="author"></div>
    <div id="content"></div>
    <div id="description"></div>
    <div id="publishedAt"></div>
    <div id="title"></div>
    <div id="url"></div>
    <div id="urlToImage"></div>
    

<input class="sub" type="submit" name="submit" id="submit" value="送出" />

</body>
</html>