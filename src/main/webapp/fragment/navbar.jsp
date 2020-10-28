 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <script src="http://code.jquery.com/jquery-latest.min.js" type="text/javascript"></script>
    <script src="https://kit.fontawesome.com/ed0adb3a32.js" crossorigin="anonymous"></script>
    <script src="${pageContext.request.contextPath}/jsmenu/nav_script.js"></script>
    <script src="${pageContext.request.contextPath}/jsmenu/nav_time_script.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/cssmenu/nav_styles.css">
<meta charset="UTF-8">
 <div id='cssmenu'>
        <ul>
            <!-- <li><img src="img/google-logo.png" style="width: 200px;height: 30px;"></li> -->
            <li><a href='#'>網站名字可放LOGO</a></li>
            <li><a href="<c:url value='/test1023' />">測試功能1023</a></li>
            <li><a href='#'>會員中心</a>
                <ul>
                    <li><a href='#'>會員功能1</a>
                        <ul>
                            <li><a href="#"></a></li>
                            <li><a href='#'>子功能</a></li>
                        </ul>
                    </li>
                    <li><a href='#'>Product 2</a>
                        <ul>
                            <li><a href='#'>Sub Product</a></li>
                            <li><a href='#'>Sub Product</a></li>
                        </ul>
                    </li>
                </ul>
            </li>
            <li><a href='#'>新聞專區</a>
                <ul>
                    <li><a href='#'>一般會員</a>
                        <ul>
                            <li><a href="<c:url value='/uploadNews'/>">上傳新聞</a></li>
                            <li><a href="<c:url value=''/>">個人新聞列表</a></li>
                            
                        </ul>
                    </li>
                    <li><a href='#'>企業專區</a>
                        <ul>
                        
                            <li><a href="<c:url value='/getAllNews'/>">所有新聞列表</a></li>
                            
                        </ul>
                    </li>
                    
                </ul>
            </li>
            <li><a href='#'>客服中心</a>
                <ul>
                 	<li><a href="<c:url value='/customerReports' />">所有客服表單(test)</a></li>
                    <li><a href="<c:url value='/addReport' />">申請客服表單</a></li>
                </ul>
            </li>
            <li><a href="<c:url value='/trkNews' />">新聞追蹤</a></li>
            <li><a href='#'>影音專區</a></li>
            <li><a href='#'>廣告專區</a>
            	<ul>
                    <li><a href="<c:url value='/uploadAds' />">上傳頁面</a></li>
                    <li><a href="#">看所有廣告列表</a>
                    	<ul>
                            <li><a href="<c:url value='/getAllAds' />">看所有廣告列表</a></li>
                            <li><a href='#'>依日期查詢</a></li>
                        </ul>
                    </li>
                    <li><a href="<c:url value='/getAllAds' />">還未新增的第三個功能</a></li>
                </ul>
            </li>
            <li>
                <div id="nowDateTimeSpan">
                    <script>startTime()</script>
                </div>
            </li>
            <li><a href="#" title="">登入&nbsp;<i class="far fa-user-circle"></i></a></li>
            <li><a href="#" title="">後臺管理&nbsp;<i class="fas fa-tools"></i></a></li>
        </ul>
    </div>