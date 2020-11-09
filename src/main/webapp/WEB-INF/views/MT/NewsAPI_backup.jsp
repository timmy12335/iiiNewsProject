<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <!-- <script type="text/javascript" src="jquery-1.3.2.min.js"></script> -->
    <!-- <script type="text/javascript" src="json2.js"></script> -->
    <script src="https://code.jquery.com/jquery-3.5.1.js"
        integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
    <meta charset="UTF-8">
    <title>News API</title>
    <script>
        var url = 'http://newsapi.org/v2/top-headlines?' +
            'country=kr&' +
            'apiKey=054094dd99a94d729e84890939ac8370';
        var req = new Request(url);
        fetch(req)
            .then(function (response) {
                console.log(response.json());
            })
    </script>
</head>

<body>
    <div class="wrapper">
        <h1 class="top">Free news</h1>
        <div>
            <label for="Country">國家:</label>
            <select id="Country">
                <option value="none">請選擇國家</option>
                <option value="tw">台灣</option>
                <option value="jp">日本</option>
                <option value="kr">韓國</option>
                <option value="hk">香港</option>
                <option value="us">美國</option>
            </select><br>
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
            </select>
            <div id="myImg"></div>
        </div>
        <hr>

        <div id="todayNews"></div>
    </div>
    <!-- <input class="sub" type="submit" name="submit" id="submit" value="送出" /> -->
    <script>
        var mySelect = document.getElementById("Country");//定位id(获取select)
        var index = mySelect.selectedIndex;// 选中索引(选取select中option选中的第几个)
        var text = mySelect.options[index].text; // 选中文本
        var value = mySelect.options[index].value; // 选中值
        var strCountry = "";
        mySelect.options[index].selected
        mySelect.onchange = function () {

            //         	author = "";
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
                '&apiKey=054094dd99a94d729e84890939ac8370';


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
                    'apiKey=054094dd99a94d729e84890939ac8370';

                console.log("url----->" + url);






                //             var url = 'http://newsapi.org/v2/top-headlines?' +
                //             'country=' + strCountry +
                //             '&apiKey=054094dd99a94d729e84890939ac8370';

                //----------------------------------------------------------------
                //             category
                //             var url = 'http://newsapi.org/v2/top-headlines?' +
                //             'country=' + strCountry +
                //             '&category=business&apiKey=8e702b6238b04fd38c2f3cac1ef392e7';

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

                //  processData(data)
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


                        //                     var strImg = ".jpg";				//等圖片連結不是.jpg or .png測試用

                        //--------------------------------------------------------------------------------------------
                        //                     var imgStr = urlToImage.substr(-4);
                        //                     console.log("---------" + imgStr + "---------");

                        //                     if (urlToImage == null || urlToImage.substr(-4) != imgStr){
                        //                     	urlToImage = noImage;
                        //                     }
                        //--------------------------------------------------------------------------------------------   

                        if (urlToImage == null) {
                            urlToImage = noImage;
                        }

                        var authorStr = "新聞網";
                        if (author == null) {
                            author = authorStr;
                        }

                        content += '<div class="author">新聞來源: ' + author + "</div >" +
                            "<a href=" + artUrl + '><div class="title">' + title + "</div ></a> " +
                            "<div class='description'>" + description + "</div >" +
                            '<div class="publishedAt">更新時間: ' + publishedAt + "</div >" +
                            '<div class="urlToImage"><img src=' + urlToImage + " width=200 height=100'/> </div ><hr>"

                        divs.innerHTML = content;
                        //                 	$('todayNews').remove();
                    }
                }
            }
        }

    </script>
</body>

</html>