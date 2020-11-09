<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!doctype html>
<html lang='zh-Hant-TW'>

<head>
    <meta charset='UTF-8'>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/cssmenu/nav_styles.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/cssmenu/bootstrap_index.css">
    <script src="http://code.jquery.com/jquery-latest.min.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/jsmenu/nav_script.js"></script>
    <script src="${pageContext.request.contextPath}/jsmenu/nav_time_script.js"></script>
    <script src="https://kit.fontawesome.com/ed0adb3a32.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <title>我們新聞的首頁Title標</title>
    <style>
		.tablebyme {
  			width: 70%;
  			border-collapse: collapse;
		}
		.tablebyme td {
  			padding:5px;
		}
		
		.tablebyme tbody tr:nth-of-type(even){background-color:rgba(194, 223, 255, 0.5)}
		.tablebyme tbody tr:hover{color:#212529;background-color:rgba(0,0,0,.075)}
		.tablebyme th{color:#fff;background-color:#005AB5;border-color:#FFFFFF}
		
		.tablebyme a{
		text-decoration:none;
		font-weight:500;
		}
		
		.tablebyme a:hover{
		text-decoration:none;
		background:	#005AB5;
		color:white;
		font-weight:500;
        }
        
        .table-hover{
            width: 80%;
        }

        .table-hover thead{
            text-align: center;
            background-color: #001f63;
            color: white;
            border: 1px solid white;
        }
        .table-hover thead th{
            border-left: 2px solid white;
        }
        
        #cssmenu{
            border-bottom: 2px solid white;
        }
		
	</style>
</head>

<body>
	<nav>
		<jsp:include page="/fragment/navbar.jsp"></jsp:include> 
	</nav>

<!-- 頁首/開始 -->
<div style="z-index:-100;position: relative;">
<header class="header">
	<img src="images/room.jpg" alt="banner" class="img-fluid" style="height: 550px;">
<!-- 	<img src="images/CCC.jpg" alt="banner" class="img-fluid" style="height: 550px;"> -->
</header> 
<!-- 頁首/結束 -->
<!-- 特色/開始 -->
<section class="container">
	<div class="row">
		<div class="col-12 col-md-4 text-center">
			<h2 class="text-danger "><strong>販賣新聞</strong></h2>
			<p>人人都是記者，挖掘所有生活的大小事</p>
		</div>
		<div class="col-12 col-md-4 text-center">
			<h2 class="text-danger"><strong>上架廣告</strong></h2>
			<p>販售廣告欄位，小空間也能發揮大效益</p>
		</div>
		<div class="col-12 col-md-4 text-center">
			<h2 class="text-danger"><strong>趨勢分享</strong></h2>
			<p>分享目前時下所流行之趨勢，隨時掌握新發展</p>
		</div>
	</div>
</section>
<!-- 特色/結束 -->
<!-- 主標語/開始 -->
<section class="d-flex justify-content-center bg-danger slogan">
	<h3 class="align-self-center text-white"><strong>分享新聞，重視價值</strong></h3>
</section>
<!-- 主標語/結束 -->
<!-- 推薦課程/開始 -->
<section class="container">
	<div class="row">
		<!-- 標題/開始 -->
		<div class="col-12">
			<h1 class="text-success text-center"><strong>推薦新聞</strong></h1>
		</div>
		<!-- 標題/結束 -->
		<!-- 課程1/開始 -->
		<div class="col-12 col-md-4 p2">
			<div class="box-content">
				<div>
					<img src="img/NoImage.jpg" alt="Unity" class="img-fluid d-block m-auto w-75">
				</div>
				<div class="mt-2 mb-2">
					<h3>美食秘笈</h3>
				</div>
				<div class="text-info mt-2 mb-2">好吃好玩的老街美食大發現</div>
				<div class="mt-2 mb-2">
					<span class="text-muted">會員：test</span>
				</div>
				<div class="mt-2 mb-2">
					<span class="text-muted">上架時間：2020-11-06</span>
				</div>
				<div class="text-center mt-2 mb-2">
					<h4 class="text-danger"><small class="text-muted"><s>原價 NT$ 1600</s></small>NT$ 1200</h4>
				</div>
				<div class="mt-3">
					<button type="button" class="btn btn-danger btn-lg btn-block">付款測試中</button>
				</div>
			</div>
		</div>
		<!-- 課程1/結束 -->
		<!-- 課程2/開始 -->
		<div class="col-12 col-md-4 p2">
			<div class="box-content">
				<div>
					<img src="img/NoImage.jpg" alt="GameSalad" class="img-fluid d-block m-auto w-75">
				</div>
				<div class="mt-2 mb-2">
					<h3>街頭即時報</h3>
				</div>
				<div class="text-info mt-2 mb-2">高速公路路面濕滑車禍</div>
				<div class="mt-2 mb-2">
					<span class="text-muted">會員：test</span>
				</div>
				<div class="mt-2 mb-2">
					<span class="text-muted">上架時間：2020-11-06</span>
				</div>
				<div class="text-center mt-2 mb-2">
					<h4 class="text-danger"><small class="text-muted"><s>原價 NT$ 3200</s></small>NT$ 1600</h4>
				</div>
				<div class="mt-3">
					<button type="button" class="btn btn-danger btn-lg btn-block">付款測試中</button>
				</div>
			</div>
		</div>
		<!-- 課程2/結束 -->
		<!-- 課程3/開始 -->
		<div class="col-12 col-md-4 p2">
			<div class="box-content">
				<div>
					<img src="img/NoImage.jpg" alt="Google Web Design" class="img-fluid d-block m-auto w-75">
				</div>
				<div class="mt-2 mb-2">
					<h3>爆料！某立委喝花酒...</h3>
				</div>
				<div class="text-info mt-2 mb-2"></div>
				<div class="mt-2 mb-2">
					<span class="text-muted">會員：123Test</span>
				</div>
				<div class="mt-2 mb-2">
					<span class="text-muted">上架時間：2020-11-06</span>
				</div>
				<div class="text-center mt-2 mb-2">
					<h4 class="text-danger"><small class="text-muted"><s>原價 NT$ 3200</s></small>NT$ 1600</h4>
				</div>
				<div class="mt-3">
					<button type="button" class="btn btn-danger btn-lg btn-block">付款測試中</button>
				</div>
			</div>
		</div>
		<!-- 課程3/結束 -->
	</div>
</section>
</div>
<!-- 頁腳/開始 -->
<footer class="bg-dark mt-5 footer-content" style="height: 120px;">
	<p class="text-center text-white mb-0">© 2020 iiiNews 新聞網路交易網</p>
	<p class="text-center text-white mb-0">聯絡我們  |  eeit19no4@gmail.com</p>
</footer>
<!-- 頁腳/結束 -->
</body>
</html>