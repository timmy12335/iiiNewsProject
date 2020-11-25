<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
<title>新增成功</title>
<style>
    td {
        align: left;
        padding: 3px;
        width: 150px;
        word-break: break-all;
        margin: 5px;
    }

    .iiinewsContainer {
        margin-top: 100px;
        margin-bottom: 100px;
        position: relative;
    }

    .div1 {
        margin: 10px;
    }
</style>
</head>
<body>
    <nav class="navbar fixed-top">
        <jsp:include page="/fragment/navbar.jsp"></jsp:include>
    </nav>
    <div class="iiinewsContainer">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-md-7 grid-margin stretch-card">
                    <div class="card">
                        <form action="/showCreate" method="post" modelAttribute="mtBean" enctype="multipart/form-data">
                            <div class="card-header bg-success text-white">
                                <h2><b>[${ mtBean.category }] ${ mtBean.title }</b></h2>
                            </div>
                            <div class="form-group row" style="font-size:20px;">
                                <div class="col-sm-12 div1"><b>發文者 :</b>&nbsp;${ mtBean.memberId }
                                    <c:set var="date" value="${fn:substring(mtBean.updateDate, 0, 10)}" />
                                    &nbsp;&nbsp;&nbsp;<b>新增時間 :</b> ${date}
                                    <c:if test="${mtBean.status == 1}">
                                        &nbsp;&nbsp;&nbsp;<b>文章狀態 : </b>上傳成功
                                    </c:if>
                                </div>
                                <div class="col-sm-12 div1"><b>[${ mtBean.category }] ${mtBean.title}</b></div>
                                <div class="col-sm-12 div1"><img width='600' height='400'
                                        src="<c:url value='/getMtCreate/${ mtBean.articleId }'/>"></div>
                                <div class="col-sm-11 div1"><b>內文 :</b><br>${ mtBean.article }</div>
                            </div>
                        </form>
                    </div>
                    <div align="center"><a class="btn btn-primary" href="<c:url value='/' />">回首頁</a> <br>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script type='text/javascript'>
        window.setTimeout(function () {
            var href = $(this).attr('href');
            location.href = href = "<c:url value='/' />";
        }, 5000);
    </script>
</body>
</html>