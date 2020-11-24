<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
<title>查詢文章</title>
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
                        <div class="card-header bg-success text-white">
                            <h2><b>[${ singleArticle.category }] ${ singleArticle.title }</b></h2>
                        </div>


                        <div class="form-group row" style="font-size:20px;">
                            <div class="col-sm-12 div1"><b>發文者 :</b>&nbsp;${ singleArticle.memberId }
                                <c:set var="date" value="${fn:substring(singleArticle.updateDate, 0, 10)}" />
                                &nbsp;&nbsp;&nbsp;<b>新增時間 :</b> ${date}
                                <c:if test="${ singleArticle.status == 1}">&nbsp;&nbsp;<b>文章狀態 :</b> 可瀏覽</c:if>
                                <c:if test="${ singleArticle.status == 0}">&nbsp;&nbsp;<b>文章狀態 :</b> ***已下架***
                                </c:if>
                            </div>
                            <div class="col-sm-12 div1"><img width='600' height='400'
                                    src="<c:url value='/getMtCreate/${ singleArticle.articleId }'/>"></div>
                            <div class="col-sm-11 div1"><b>內文 :</b><br>${ singleArticle.article }</div>
                        </div>

                    </div>

                </div>
            </div>
        </div><br>
        <div align="center">
            <input class="btn btn-primary" type="button" onclick="location.href=<c:url value='' />" value="TOP" />
            <input class="btn btn-primary" type="button" onclick="history.back()" value="回前頁" />
        </div>
    </div>
</body>
</html>