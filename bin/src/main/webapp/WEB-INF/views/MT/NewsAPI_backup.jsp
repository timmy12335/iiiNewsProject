<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/MT/style.css"/>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/MT/owl.carousel.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/MT/owl.theme.default.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
    <meta charset="UTF-8">
    <title>Hot News</title>
    <script>
        var url = 'http://newsapi.org/v2/top-headlines?' +
            'country=kr&' +
            'apiKey=8e702b6238b04fd38c2f3cac1ef392e7';
        var req = new Request(url);
        fetch(req)
            .then(function (response) {
                console.log(response.json());
            })
    </script>
    
    
</head>

<body>
<div class="wrapper_box" style="background-color:#f8f2e4">

    <!--wrapper 開始-->
    <div class="wrapper">

        <!--header_box 開始-->
                <div class="header_box">

            <!--header 開始-->
            <div class="header">
                                    <!--主視覺-圖片 開始-->
                    <div class="visual">
                                                    <img src = "${pageContext.request.contextPath}/images/MT/News_.jpg"/>
                                            </div>
                    <!--主視覺-圖片 結束-->
 


</div></div></div>

<div class="nav nav_ori" style="background-color:#f7ebcd;height:49px">
    <div class="inner" style="padding:15px;margin-left:17%;">
        <div style="float:left;margin-right:10px; margin-bottom:10px">
            <label for="Country">國家:</label>
            <select id="Country">
                <option value="none">請選擇國家</option>
                <option value="tw">台灣</option>
                <option value="jp">日本</option>
                <option value="kr">韓國</option>
                <option value="hk">香港</option>
                <option value="us">美國</option>
            </select><br>
            </div>
            <div style="float:left;">
            <label for="Category">新聞分類:</label>
            <select id="Category">
                <option value="noneCate">請選擇分類</option>
                <option value="topHeadlines">熱門頭條</option>
                <option value="business">商業</option>
                <option value="entertainment">娛樂</option>
                <option value="health">健康</option>
                <option value="science">科學</option>
                <option value="sports">體育</option>
                <option value="technology">技術</option>
            </select></div>
            <div id="myImg"></div>
        </div>

<!--         <div id="todayNews"></div> -->
    </div>
    <script>
        var mySelect = document.getElementById("Country");//定位id(获取select)
        var index = mySelect.selectedIndex;// 选中索引(选取select中option选中的第几个)
        var text = mySelect.options[index].text; // 选中文本
        var value = mySelect.options[index].value; // 选中值
        var strCountry = "";
        mySelect.options[index].selected
        mySelect.onchange = function () {

            var content = '';

            if (mySelect.options[0].selected == true) {
                strCountry = "";
                console.log(0 + "--->" + strCountry);
            } if (mySelect.options[1].selected == true) {
                strCountry = "tw";
                console.log(1 + "--->" + strCountry);
            } if (mySelect.options[2].selected == true) {
                strCountry = "jp";
                console.log(2 + "--->" + strCountry);
            } if (mySelect.options[3].selected == true) {
                strCountry = "kr";
                console.log(3 + "--->" + strCountry);
            } if (mySelect.options[4].selected == true) {
                strCountry = "hk";
                console.log(4 + "--->" + strCountry);
            } if (mySelect.options[5].selected == true) {
                strCountry = "us";
                console.log(5 + "--->" + strCountry);
            }
            console.log("Country-----dddd");
            console.log(strCountry);


            var url = 'http://newsapi.org/v2/top-headlines?' +
                'country=' + strCountry +
                '&apiKey=8e702b6238b04fd38c2f3cac1ef392e7';

            //----------------------------------------------------------------
            var cateSelect = document.getElementById("Category");//定位id(获取select)
            var index = cateSelect.selectedIndex;// 选中索引(选取select中option选中的第几个)
            var text = cateSelect.options[index].text; // 选中文本
            var value = cateSelect.options[index].value; // 选中值
            var strCate = "";
            cateSelect.options[index].selected
            cateSelect.onchange = function () {

                var content = '';

                if (cateSelect.options[0].selected == true) {
                    strCate = "";
                    console.log("Category--->" + strCate);
                }
                if (cateSelect.options[1].selected == true) {
                    strCate = "category=general&";
                    console.log("Category--->" + strCate);
                }
                if (cateSelect.options[2].selected == true) {
                    strCate = "category=business&";
                    console.log("Category--->" + strCate);
                }
                if (cateSelect.options[3].selected == true) {
                    strCate = "category=entertainment&";
                    console.log("Category--->" + strCate);
                }
                if (cateSelect.options[4].selected == true) {
                    strCate = "category=health&";
                    console.log("Category--->" + strCate);
                }
                if (cateSelect.options[5].selected == true) {
                    strCate = "category=science&";
                    console.log("Category--->" + strCate);
                }
                if (cateSelect.options[6].selected == true) {
                    strCate = "category=sports&";
                    console.log("Category--->" + strCate);
                }
                if (cateSelect.options[7].selected == true) {
                    strCate = "category=technology&";
                    console.log("Category--->" + strCate);
                }

                console.log("Category----------");
                console.log(strCate);

                url = 'http://newsapi.org/v2/top-headlines?' +
                    'country=' + strCountry + "&" + strCate +
                    'apiKey=8e702b6238b04fd38c2f3cac1ef392e7';

                console.log("url----->" + url);

                //----------------------------------------------------------------

                $.ajax({
                    url:
                        url,
                    method: "GET",
                    error: function () {
                        console.log("6666");
                    },
                    success: function (data) {

                        document.getelementByid
                        processData(data);
                    }
                });

                function processData(data) {
                    var articleItems = [];
                    var divs = document.getElementById("todayNews");
                    var noImage = document.getElementById("myImg").src = "${pageContext.request.contextPath}/img/NO_IMAGE.png";	//無圖片的話顯示noImage.png
                    for (var i = 0; i < data.articles.length; i++) {
                        var author = data.articles[i].author;
                        var title = data.articles[i].title;
                        var description = data.articles[i].description;
                        var publishedAt = data.articles[i].publishedAt;
                        var artUrl = data.articles[i].url;
                        var urlToImage = data.articles[i].urlToImage;

                        if (urlToImage == null) {
                            urlToImage = noImage;
                        }

                        var authorStr = "新聞網";
                        if (author == null) {
                            author = authorStr;
                        }

                        content += '<div class="box_0 clearfix" style="height:500px;overflow:hidden;">'+
                        		   '<div class="author" style="width:300px;height:30px;overflow:hidden;margin-top:5px;">新聞來源: ' + author + "</div >" +
                            	   '<a href="' + artUrl + '"><div class="title" style="margin-top:5px;">' + title + "</div ></a>" +
                            	   '<div class="urlToImage" style="margin-top:5px;"><img src=' + urlToImage + " width=300 height=190'/> </div >"+
                            	   "<div class='description' style='margin-top:5px;'>" + description + "</div ></div>" 
//                             	   '<div class="publishedAt">更新時間: ' + publishedAt + "</div ></div>"

                        divs.innerHTML = content;
                    }
                }
            }
        }
        
    </script>
    <div class="container_box">

            <!--container 開始-->
            <div class="container clearfix">

                <!--橫列 r1 一欄式 開始-->
                <div class="r1 clearfix">
                  <!--直欄 c1 開始-->
                  <div class="c1">
                    
                      <h1 class="title_1" style="text-align:center" >今  日  新  聞</h1>
                      <!--part_thumb_1 縮圖列表 開始-->
                      <div class="part_thumb_1 clearfix">
                                                  <!--組 -->
                                                  <!--組 -->
                          <div id="todayNews"  style="display:inline-block;">
<!--                           <div id="myImg"></div> -->
<!--                           <div class="box_0  clearfix" id="sssss"> -->
<!--                               <div id="todayNews"></div> -->

                          </div></div></div></div></div></div>
                          <div class="footer_box">

            <!--footer 開始-->
            <div class="footer">
                <address>
                <p>奕均快樂夥伴新媒體控股股份有限公司&nbsp;&nbsp;版權所有&nbsp;&nbsp;非經授權，不許轉載本網站內容<br>
                    &copy;iiiNews.net&nbsp;&nbsp;All Rights Reserved.</p>
                </address>
            </div>
            <!--footer 結束-->

        </div>
        </div>
</body>
</html>