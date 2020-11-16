<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css">
<title>Product</title>
<style>
#002{
width:200px;
line-height:50px;
padding:20px;
border:2px green solid;
float:left;
}
#001{
width:200px;　//DIV區塊寬度
line-height:50px;　//DIV區塊高度
padding:20px;　//DIV區塊內距，參閱：CSS padding 內距。
border:2px blue solid;　//DIV區塊邊框，參閱：CSS border 邊框設計。
margin-right:10px;　//靠右外距，參閱：CSS margin 邊界使用介紹範例教學。
float:left;
}
img{
width:450px;
height:350;
}
</style>
</head>
<body>
	<!-- <section>
		<div>
			<div class="container" style="text-align: center">
				<h2>產品資料</h2>
			</div>
		</div>
	</section> -->
	      
	      
	       
	       
	       
	       
	       
	<section class="container" style="background-color:gray; float:left; width:600px;margin:50px" >
	              
		<div  class="row"  >
			      
			<div class="col-md-5" >
				<h3 style="background-color:red;width:550px;font-family:Microsoft JhengHei">${trkNew.title}</h3>
				      <figure class="figure">
                           <img style="" src="<c:url value='/getPictureTK/${trkNew.trackId}' />" class="figure-img img-fluid rounded" alt="...">
                           <figcaption class="figure-caption"></figcaption>
                      </figure>
				<p>建立人: ${trkNew.founder}</p>
				<p>建立時間: ${trkNew.fondtime}</p>
				<p>追蹤人數: ${trkNew.trcnum}</p>
				<p class="text-xl-left" style="font-family:Microsoft JhengHei; width:550px;font-size:larger;">內容: ${trkNew.descript}</p>
				<p>發生地點: ${trkNew.ocplace}</p>
				<p>發生時間: ${trkNew.octime}</p>
				<p>點閱人數: ${trkNew.clicnum}</p>

				<%-- 	<c:choose>
					<c:when test='${product.discount != 1.0 }'>
						<p>
							折扣: ${product.discountStr} &nbsp;&nbsp; 
							實售: <font color='red'>${product.price*product.discount}元</font>
						</p>
					</c:when>
					<c:otherwise>
						<p>&nbsp;</p>
					</c:otherwise>
				</c:choose> --%>
				<%-- 	<p>書商: ${product.companyBean.name}</p> --%>
				<p style="font-family:Microsoft JhengHei">新聞分類: ${trkNew.type}</p>
				<p>
					<strong>追蹤編號: </strong> <span class='label label-warning'>
						${trkNew.trackId} </span>
				</p>
				<p>
					<a href="<spring:url value='/trkNews' />" class="btn btn-default">
						<span class="glyphicon-hand-left glyphicon"></span>返回
					</a> <a href="<spring:url value='/editNews/${trkNew.trackId}'/>"
						class='btn btn-warning btn-large'> <!-- 跳轉網頁連結 --> <span
						class='glyphicon-shopping-cart glyphicon'></span>修改追蹤新聞
					</a>
				</p>
			</div>
		</div>
		
	</section>
<div  style="float:left; margin-top:100px;"  >
			            <h3 id="002" class="display-4" style="font-family:Microsoft JhengHei" >各媒體相關報導</h3> 
			            <div style="border-style: outset ;font-family:Microsoft JhengHei; width:550px;height:800px;font-size:larger;"">
			      <img src="<c:url value='/getPictureTK/${trkNew.trackId}' />" class="figure-img img-fluid rounded" alt="...">
			      
			      </div>
			      </div>
	<!-- 點擊累加 -->
	 <%-- <%
		Integer hitsCount = (Integer) application.getAttribute("hitCounter");
		if (hitsCount == null || hitsCount == 0) {
			/* 第一次访问 */
			out.println("欢迎访问菜鸟教程!");
			application.getAttribute("trkNew");
			hitsCount = 1;
		} else {
			/* 返回访问值 */
			out.println("欢迎再次访问菜鸟教程!");
			hitsCount += 1;
		}
		application.setAttribute("hitCounter", hitsCount);
	%>

	<p>
		页面访问量为:
		<%=hitsCount%>
		
	</p> --%>
	<!-- 點擊累加 --> 
	<script>
	var NewsId2 = ${trkNew.trackId};
	var caution = false
	
	var clicnum = document.getElementById(${trkNew.clicnum});
	
	
	function setCookie(name, value, expires, path, domain, secure) {
	        var curCookie = name + "=" + escape(value) +
	                ((expires) ? "; expires=" + expires.toGMTString() : "") +
	                ((path) ? "; path=" + path : "") +
	                ((domain) ? "; domain=" + domain : "") +
	                ((secure) ? "; secure" : "")
	        if (!caution || (name + "=" + escape(value)).length <= 4000)
	                document.cookie = curCookie
	        else
	                if (confirm("Cookie exceeds 4KB and will be cut!"))
	                        document.cookie = curCookie
	}
	function getCookie(name) {
	        var prefix = name + "="
	        var cookieStartIndex = document.cookie.indexOf(prefix)
	        if (cookieStartIndex == -1)
	                return null
	        var cookieEndIndex = document.cookie.indexOf(";", cookieStartIndex + prefix.length)
	        if (cookieEndIndex == -1)
	                cookieEndIndex = document.cookie.length
	        return unescape(document.cookie.substring(cookieStartIndex + prefix.length, cookieEndIndex))
	}
	function deleteCookie(name, path, domain) {
	        if (getCookie(name)) {
	                document.cookie = name + "=" +
	                ((path) ? "; path=" + path : "") +
	                ((domain) ? "; domain=" + domain : "") +
	                "; expires=Thu, 01-Jan-70 00:00:01 GMT"
	        }
	}
	function fixDate(date) {
	        var base = new Date(0)
	        var skew = base.getTime()
	        if (skew > 0)
	                date.setTime(date.getTime() - skew)
	}
	var now = new Date()
	fixDate(now)
	now.setTime(now.getTime() + 365 * 24 * 60 * 60 * 1000)
	var visits = getCookie("counter")
	var clicnum = ${trkNew.clicnum};
	
	if (!visits){
	        visits = 1
	}else{
	        visits = parseInt(visits) + 1
	}
	setCookie("counter", visits, now)
	if(visits>1){
		var t1 = 1 + clicnum;
	}else{
		
	}
	console.log("Aaaaaaa="+visits);
	
	document.write("您是到访的第" + t1 + "位用户！");
	window.onload = function() {
    
    console.log(t1);
    var xhr = new XMLHttpRequest();
	xhr.open("PUT", "<c:url value='/editNews5/' />" + NewsId2, true);
	var jsontrkNewsBean = {
			"trackId": NewsId2,
			"clicnum": t1  
	               }
	console.log(jsontrkNewsBean);
	console.log(NewsId2);
	xhr.setRequestHeader("Content-Type", "application/json;charset=UTF-8");
	xhr.send(JSON.stringify(jsontrkNewsBean));
	};
	console.log(t1);
</script>



</body>
</html>
