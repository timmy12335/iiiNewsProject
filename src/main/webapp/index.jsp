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
    

    <div style="margin-top:100px;margin-bottom:100px">
        <h2 align='center'>這是首頁 先有一個表格示意</h2>
        <span id="tttest"></span>
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