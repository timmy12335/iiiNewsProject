<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
    href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css">
<title>Products</title>
</head>
<body>
    <section>
        <div>
            <div class="container" style="text-align: center" >
                <h1>追蹤清單</h1>
            </div>
        </div>
    </section>
    <hr style="height:1px;border:none;color:#333;background-color:#333;">
    <section class="container">
        <div class="row">
        <c:forEach var='trkNew' items='${trkNews}'>
            <div class="col-sm-6 col-md-3" style="width: 360px; height: 360px">
                <div class="thumbnail" style="width: 320px; height: 340px">
                    <div class="caption">
                        <p>
                            <b style='font-size: 16px;'>${trkNew.title}</b>
                        </p>
                        <p>標題:${trkNew.title}</p>
                        <p>建立者${trkNew.founder}</p>
                        <p>追蹤人數: ${trkNew.trcnum}</p>
                        <p>
                        <a href="<spring:url value='/trkNew?id=${trkNew.trackId}' />" 
                      <c:url value='/uploadAds' />
									class="btn btn-primary"> <span
									class="glyphicon-info-sigh glyphicon"></span>詳細資料 //查詢多筆/單筆詳細資料
								</a>
                        </p>
                    </div>
                </div>
            </div>
            </c:forEach>
        </div>
    </section>
</body>
</html>
    