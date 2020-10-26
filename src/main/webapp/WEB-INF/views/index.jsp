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
    <script src="http://code.jquery.com/jquery-latest.min.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/jsmenu/nav_script.js"></script>
    <script src="https://kit.fontawesome.com/ed0adb3a32.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <title>CSS MenuMaker</title>
    <script type="JavaScript">
        function startTime() {
            var today = new Date();//定義日期物件   
            var yyyy = today.getFullYear();//通過日期物件的getFullYear()方法返回年    
            var MM = today.getMonth() + 1;//通過日期物件的getMonth()方法返回年    
            var dd = today.getDate();//通過日期物件的getDate()方法返回年     
            var hh = today.getHours();//通過日期物件的getHours方法返回小時   
            var mm = today.getMinutes();//通過日期物件的getMinutes方法返回分鐘   
            var ss = today.getSeconds();//通過日期物件的getSeconds方法返回秒   
            // 如果分鐘或小時的值小於10，則在其值前加0，比如如果時間是下午3點20分9秒的話，則顯示15：20：09   
            MM = checkTime(MM);
            dd = checkTime(dd);
            mm = checkTime(mm);
            ss = checkTime(ss);
            var day; //用於儲存星期（getDay()方法得到星期編號）
            if (today.getDay() == 0) day = "星期日 "
            if (today.getDay() == 1) day = "星期一 "
            if (today.getDay() == 2) day = "星期二 "
            if (today.getDay() == 3) day = "星期三 "
            if (today.getDay() == 4) day = "星期四 "
            if (today.getDay() == 5) day = "星期五 "
            if (today.getDay() == 6) day = "星期六 "
            document.getElementById('nowDateTimeSpan').innerHTML = yyyy + "-" + MM + "-" + dd + "&nbsp;" + hh + ":" + mm + "&nbsp;" + day;
            setTimeout('startTime()', 1000);//每一秒中重新載入startTime()方法 
        }

        function checkTime(i) {
            if (i < 10) {
                i = "0" + i;
            }
            return i;
        }  
    </script>
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

    <div id='cssmenu'>
        <ul>
            <li><a href='#'>網站名字可放LOGO</a></li>
            <li><a href='#'>About</a></li>
            <li><a href='#'>會員中心</a>
                <ul>
                    <li><a href='#'>會員功能1</a>
                        <ul>
                            <li><a href="<c:url value='/test1023' />">測試功能1023</a></li>
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
                    <li><a href='#'>Product 1</a>
                        <ul>
                            <li><a href='#'>Sub Product</a></li>
                            <li><a href='#'>Sub Product</a></li>
                        </ul>
                    </li>
                </ul>
            </li>
            <li><a href='#'>客服中心</a>
                <ul>
                    <li><a href='#'>Sub Product</a></li>
                    <li><a href='#'>Sub Product</a></li>
                </ul>
            </li>
            <li><a href='#'>新聞追蹤</a></li>
            <li><a href='#'>影音專區</a></li>
            <li><a href='#'>廣告專區</a>
            	<ul>
                    <li><a href="<c:url value='/uploadAds' />">上傳頁面</a></li>
                    <li><a href="<c:url value='/getAllAds' />">看所有廣告列表</a></li>
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
    
    <div style="margin-top:100px;margin-bottom:100px">
        <h2 align='center'>獨家爆料新聞清單</h2>
        <table class="table table-hover" style="text-align:center">
            <thead>
                <tr>
                    <th width='100' align='center'>新聞編號</th>
                    <th width='300' align='center'>標題</th>
                    <th width='60' align='center'>分類號碼</th>
                    <th width='60' align='center'>地點</th>
                    <th width='80' align='center'>日期</th>
                    <th width='60' align='center'>價格</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td align='center'><a href="/practice/RetrieveByNewsNo?newsNo=EN2020100200002">EN2020100200002</a>
                    </td>
                    <td align='center'>高乘載管制中午解除國5竟然沒龜速</td>
                    <td align='center'>100</td>
                    <td align='center'>宜蘭</td>
                    <td align='center'>2020-10-01</td>
                    <td align='center'>100.0</td>
                </tr>
            </tbody>
        </table>
    </div>

    
</body>
</html>