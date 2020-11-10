 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <script src="http://code.jquery.com/jquery-latest.min.js" type="text/javascript"></script>
    <script src="https://kit.fontawesome.com/ed0adb3a32.js" crossorigin="anonymous"></script>
    <script src="${pageContext.request.contextPath}/jsmenu/nav_script.js"></script>
    <script src="${pageContext.request.contextPath}/jsmenu/nav_time_script.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/cssmenu/nav_styles.css">
    <!-- <link rel="shortcut icon" href="favicon.ico" rel="external nofollow" type="image/x-icon" /> -->
    <link href="${pageContext.request.contextPath}/image/favicon.ico" rel="icon" type="image/ico" />
<meta charset="UTF-8">
 <div id='cssmenu'>
        <ul>
            <!-- <li><img src="img/google-logo.png" style="width: 200px;height: 30px;"></li> -->
            <li style="margin:0"><a href='/iiiNews'><img src="${pageContext.request.contextPath}/image/Logo.png" style="width:100px;border:1px solid white"></a></li>
            
<%--             <li><a href="<c:url value='/test1023' />">測試功能1023</a></li> --%>
            <li><a href="<c:url value='/UserMB'/>">會員中心</a>
                <ul>
                    <li><a href='#'>會員功能1</a>
                        <ul>
                            <li><a href=""></a></li>
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
                            <li><a href="<c:url value='/getMemNewsList'/>">個人新聞列表</a></li>
                            
                        </ul>
                    </li>
                    <li><a href='#'>企業專區</a>
                        <ul>
                        
                            <li><a href="<c:url value='/getAllNews'/>">所有新聞列表</a></li>
                            <li><a href="<c:url value='/changeStautsForTime'/>">所有新聞列表test</a></li>
                            
                            
                        </ul>
                    </li>
                    
                </ul>
            </li>
            <li><a href="<c:url value='/CRindex' />">客服中心</a>
                <ul>
                 	<li><a href="<c:url value='/customerReports' />">所有客服表單(test)</a></li>
                    <li><a href="<c:url value='/addReport' />">申請客服表單</a></li>
                    <li><a href="<c:url value='/msg' />">客服聊天</a></li>
                    <li><a href="<c:url value='/sendmail' />">寄信</a></li>
                </ul>
            </li>
            <li><a href="<c:url value='#' />">新聞追蹤</a>
                <ul>
                 	<li><a href="<c:url value='/trkNews' />">所有追蹤</a></li>
                    <li><a href="<c:url value='/queryByType' />">分類追蹤</a></li>
                    <li><a href="<c:url value='trknews/add'/>">建立追蹤新聞</a></li>                    
               </ul>
            </li>
            <li><a href="<c:url value='#' />">社群專區</a>
            	<ul>
            		<li><a href="<c:url value='/MtCreate' />">新增Po文</a>
                    <li><a href="<c:url value='/getAllMtAdd' />">檢視使用者所有資料</a></li>
                    <li><a href="<c:url value='/getMemArticleList' />">查詢會員發文紀錄</a></li>
                    <li><a href="<c:url value='/getTodayNews' />">本日熱門新聞</a></li>
<%--                     <li><a href="<c:url value='/000' />">ADD</a></li> --%>
                </ul>
            </li>
            <li><a href='#'>廣告專區</a>
            	<ul>
            		<li><a href="<c:url value='/getAjaxListSearch' />">Ajax搜尋測試</a></li>
            		<li><a href="#">企業會員功能</a>
                    	<ul>
                            <li><a href="<c:url value='/uploadAds' />">上傳頁面</a></li>
                            <li><a href="<c:url value='#' />">查詢所上架的商品##</a></li>
                            <li><a href="<c:url value='#' />">查詢所賣出的商品(下載圖片)##</a></li>
                        </ul>
                    </li>
                    <li><a href="#">一般會員功能</a>
                    	<ul>
                            <li><a href="<c:url value='/getAllAds' />">看所有廣告列表</a></li>
                            <li><a href="<c:url value='/getAjaxList' />">看所有廣告列表-Ajax</a></li>
                            <li><a href="<c:url value='/getOrderListByMemberId' />">查看一般會員訂單</a></li>
                        </ul>
                    </li>
                    <li><a href="<c:url value='/ShowCartContent' />">購物車</a></li>
					<li><a href="#">ALL & OLD</a>
                    	<ul>
                    		<li><a href="<c:url value='/uploadAds' />">上傳頁面</a></li>
                            <li><a href="<c:url value='/getAllAds' />">看所有廣告列表</a></li>
                            <li><a href="<c:url value='/memberAllAdsList' />">依會員查詢test未完成</a></li>
                            <li><a href="<c:url value='/getOrderListByMemberId' />">查看會員訂單</a></li>
		                    <li><a href="<c:url value='/ShowCartContent' />">看購物車</a></li>
		                    <li><a href="<c:url value='/getAjaxList' />">Ajax測試</a></li>
                        </ul>
                    </li>
                </ul>
            </li>
            <li>
                <div id="nowDateTimeSpan">
                    <script>startTime()</script>
                </div>
            </li>
            <li><a href="<c:url value='/Login' />" title="">登入&nbsp;<i class="far fa-user-circle"></i></a></li>
            <li><a href="<c:url value='/BMindex'/>" title="">後臺管理&nbsp;<i class="fas fa-tools"></i></a></li>
        </ul>
    </div>