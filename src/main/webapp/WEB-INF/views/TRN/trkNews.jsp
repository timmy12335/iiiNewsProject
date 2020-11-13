<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page import="java.io.*,java.util.*" %>
<html>
<head>
<meta charset="UTF-8">

<title>TrkNews</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
 <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/carousel.css">
<style>
 .wrapper {
            position: relative;
            width: 800px;
            height: 300px;
            overflow: hidden;
            margin: 0 auto;
        }

        ul {
            margin: 0;
            padding: 0;
            position: absolute;
        }

        li {
            margin: 0;
            padding: 0;
            list-style: none;
        }

        ul.slides {
            width: 3200px;
            left: 0px;
            transition: all .5s;
        }

        ul.slides li {
            width: 800px;
            height: 300px;
            overflow: hidden;
            float: left;
        }

        ul.slides li img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

        .dot {
            bottom: 10px;
            width: 100%;
            display: flex;
            justify-content: center;
        }

        .dot li {
            border: 1px solid #fff;
            /* border-radius: 50%; */
            margin: 0 5px;
            width: 24px;
            height: 10px;
        }

        /* .dot li:hover{
            background: #fff;
        } */
        .slide_btn {
            display: flex;
            justify-content: center;
            align-items: center;
            top: 0;
            bottom: 0;
            width: 30px;
            color: #fff;
            position: absolute;
            font-size: 24px;
            /* background-color:red; */
        }

        #prevSlide {
            left: 0;
        }

        #nextSlide {
            right: 0;
        }

        .slide_btn i {
            color: rgba(255, 255, 255, .6);
            transition: .5s;
        }

        .slide_btn:hover i {
            color: rgba(255, 255, 255, 1);
        }
body {
  
  padding-top: 5rem;
  padding-bottom: 3rem;
  color: #5a5a5a;
}
</style>
<nav class="navbar fixed-top">
		<jsp:include page="/fragment/navbar.jsp"></jsp:include> 
	</nav>
</head>
<body>
<main role="main">
<div class="wrapper">
        <ul class="slides">
            <li>001<img src="imgs/slide1.jpg" alt=""></li>
            <li>002<img src="imgs/slide2.jpg" alt=""></li>
            <li>003<img src="imgs/slide3.jpg" alt=""></li>
            <li>004<img src="imgs/slide4.jpg" alt=""></li>
        </ul>
        <ul class="dot">
            <li id="1"></li>
            <li id="2"></li>
            <li id="3"></li>
            <li id="4"></li>
        </ul>
        <div id="prevSlide" class="slide_btn">
            <i class="fa fa-caret-left"></i>
        </div>
        <div id="nextSlide" class="slide_btn">
            <i class="fa fa-caret-right"></i>
        </div>
    </div>
    <script>
        $(function () {
            let slideNum = 0;
            let slideCount = $(".slides li").length;  //4
            let lastIndex = slideCount - 1;  //3
            // console.log(slideCount);

            // console.log($(".dot li"));   
            $(".dot li").eq(0).css("background-color", "white");
            $(".dot li").mouseenter(function () {
                slideNum = $(this).index();
                console.log(slideNum);

                // $(this).css("background-color","#fff")
                // .siblings().css("background-color","transparent");

                // $(".dot li").eq(slideNum).css("background-color","#fff")
                // .siblings().css("background-color","transparent");

                // let move=0-800*slideNum;
                // $("ul.slides").css("left",move);
                show();
            });

            function show() {
                $(".dot li").eq(slideNum).css("background-color", "#fff")    /*圖片輪播跟著索引值走，索引值變化圖片才會變化*/
                    .siblings().css("background-color", "transparent");

                let move = 0 - 800 * slideNum;
                let mov1 = $("ul.slides").css("left", move)
                // $().setInterval(mov1,1000) 
            }
            //  $(".dot li").setInterval(show(),1)
            setInterval(function () { show() }, 3000);


            $("#prevSlide").click(function () {
                slideNum--;

                if (slideNum < 0) slideNum = lastIndex;
                show();
            })

            $("#nextSlide").click(function r1() {
                slideNum++;

                if (slideNum > lastIndex) slideNum = 0;
                show();
                // $().setInterval(r1(),1000) 
            })

            let timer;
            timer = setInterval(function (event) {
                slideNum++;
                if (slideNum > lastIndex) slideNum = 0;
                show()
            }, 2000);

            $(".wrapper").mouseenter(function () {
                clearInterval(timer)
                console.log("mouseenter")
            })
            $(".wrapper").mouseleave(function () {
                timer = setInterval(function () {
                    slideNum++;
                    if (slideNum > lastIndex) slideNum = 0;
                    show()
                }, 2000);
                console.log("mouseenter")
            })

        });
    </script>
       <!-- <div id="myCarousel" class="carousel slide" data-ride="carousel">
                <ol class="carousel-indicators">
                   <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                   <li data-target="#myCarousel" data-slide-to="1"></li>
                   <li data-target="#myCarousel" data-slide-to="2"></li>
                </ol>
                <div class="carousel-inner">
                    <div class="carousel-item active">
        <svg class="bd-placeholder-img" width="100%" height="100%" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice" focusable="false" role="img"><rect width="100%" height="100%" fill="#777"/></svg>
        <div class="container">
          <div class="carousel-caption text-left">
            <h1>Example headline.</h1>
            <p>Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.</p>
            <p><a class="btn btn-lg btn-primary" href="#" role="button">Sign up today</a></p>
          </div>
        </div>
      </div>
      </div>
      <div class="carousel-item">
         <svg class="bd-placeholder-img" width="100%" height="100%" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice" focusable="false" role="img"><rect width="100%" height="100%" fill="#777"/></svg>
        <div class="container">
          <div class="carousel-caption">
            <h1>Another example headline.</h1>
            <p>Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.</p>
            <p><a class="btn btn-lg btn-primary" href="#" role="button">Learn more</a></p>
          </div>
        </div>
      </div>
      <div class="carousel-item">
        <svg class="bd-placeholder-img" width="100%" height="100%" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice" focusable="false" role="img"><rect width="100%" height="100%" fill="#777"/></svg>
        <div class="container">
          <div class="carousel-caption text-right">
            <h1>One more for good measure.</h1>
            <p>Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.</p>
            <p><a class="btn btn-lg btn-primary" href="#" role="button">Browse gallery</a></p>
          </div>
        </div>
      </div>
    </div>
    <a class="carousel-control-prev" href="#myCarousel" role="button" data-slide="prev">
      <span class="carousel-control-prev-icon" aria-hidden="true"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="carousel-control-next" href="#myCarousel" role="button" data-slide="next">
      <span class="carousel-control-next-icon" aria-hidden="true"></span>
      <span class="sr-only">Next</span>
    </a> -->
  <!-- Marketing messaging and featurettes
  ================================================== -->
  <!-- Wrap the rest of the page in another container to center all the content. -->

<hr>
    <section  >
        <div>
            <div class="container" style="text-align: center" >
                <h1>追蹤清單</h1>
            </div>
        </div>
    </section>
    
     <!-- Three columns of text below the carousel -->
 <!--     <section class="container">
	<div class="row">
		標題/開始
		<div class="col-12">
			<h1 class="text-success text-center"><strong>推薦新聞</strong></h1>
		</div>
		標題/結束
		課程1/開始
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
		課程1/結束
		課程2/開始
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
		課程2/結束
		課程3/開始
		<div class="col-12 col-md-4 p2">
			<div class="box-content">
				<div>
					<img src="img/NoImage.jpg" alt="Google Web Design" class="img-fluid d-block m-auto w-75">
				</div>
				<div class="mt-2 mb-2">
					<h3>爆料！某立委喝花酒...</h3>
				</div>
				<div class="text-info mt-2 mb-2">吃好玩的老街美食大發現</div>
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
		課程3/結束
	</div>
</section> -->

   <section class="container" >
      <div class="row">
          <c:forEach var='trkNew' items='${trkNews}'>
             <div class="col-12 col-md-4 p2">
                      <div class="box-content">
                           
                           <div>
                               <img src="<c:url value='/getPictureTK/${trkNew.trackId}'/>" alt="Unity" class="img-fluid d-block m-1 w-10"  />                           
                           </div>
                           <div class="mt-2 mb-2">
                               <h3>${trkNew.title}</h3>
                           </div>  
                           <div class="text-info mt-2 mb-2">發生地:${trkNew.ocplace}</div>
                           <div class="mt-2 mb-2">
                              <span class="text-muted">建立者:${trkNew.founder}</span>
                           </div>
                           <div class="mt-2 mb-2">
                              <span class="text-muted">發生時間：:${trkNew.octime}</span>
                           </div>
                           <div class="mt-2 mb-2">
                              <h4>追蹤人數: ${trkNew.trcnum}</h4>
                           </div>
                           <a href="<spring:url value='/trkNew?id=${trkNew.trackId}' />">
                                 <button type="button" class="btn btn-outline-secondary">繼續看下去</button>
                           </a>  
                                                                   
                      </div>
              </div>
            </c:forEach> 
        </div>
    </section>
  </main>
  <!-- 點擊累加 -->
  <%
    Integer hitsCount = 
      (Integer)application.getAttribute("hitCounter");
    if( hitsCount ==null || hitsCount == 0 ){
       /* 第一次访问 */
       out.println("欢迎访问菜鸟教程!");
       hitsCount = 1;
    }else{
       /* 返回访问值 */
       out.println("欢迎再次访问菜鸟教程!");
       hitsCount += 1;
    }
    application.setAttribute("hitCounter", hitsCount);
%>

<p>页面访问量为: <%= hitsCount%></p>
<!-- 點擊累加 -->
  
</body>
</html>
    