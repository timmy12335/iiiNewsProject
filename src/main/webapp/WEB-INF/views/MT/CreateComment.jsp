<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
<title>查詢文章</title>
<script>
    window.onload = function () {
        var btn = document.getElementById("clickme1");
        var btn2 = document.getElementById("clickme2");
        btn.onclick = function () {
            A = document.getElementById("comment")
            A.value = "太狂了吧!!! 我覺得可以"
        }

        btn2.onclick = function () {
            B = document.getElementById("comment")
            B.value = "我覺得不行"
        }
    }
</script>
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
    .scroll {
        overflow: scroll;
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
                <div class="col-md-6 grid-margin stretch-card">
                    <div class="card">
                        <div class="card-header bg-success text-white">
                            <h3><b>[${ CreateComment.category }] ${ CreateComment.title }</b></h3>
                        </div>
                        <div class="form-group row" style="font-size:20px;">
                            <div class="col-sm-12 div1"><b>發文者 :</b>&nbsp;${ CreateComment.memberId }
                                <c:set var="date" value="${fn:substring(CreateComment.updateDate, 0, 10)}" />
                                &nbsp;&nbsp;&nbsp;<b>新增時間 :</b> ${date}
                            </div>
                            <div class="col-sm-12 div1"><img width='500' height='400'
                                    src="<c:url value='/getMtCreate/${ CreateComment.articleId }'/>"></div>
                            <div class="col-sm-11 div1"><b>內文 :</b><br>${ CreateComment.article }</div>
                        </div>
                    </div>
                </div>
                <div class="col-md-1"></div>
                <div class="col-md-5 scroll" style="background-color:#F0F0F0 ; height:690px">
                    <form:form method="POST" modelAttribute="mtArtComBean">
                        <table>
                            <tr>
                                <td colspan="2" style="width:300px;height:250px;"><label for="comment"
                                        style="font-size:20px;"><b>我想說:</b></label>
                                    <div class="st1">
                                        <textarea name="comment" id="comment" cols="55" rows="6" maxlength="250"
                                            placeholder="限輸入250字..."></textarea>
                                        <input class="btn btn-primary" type="submit" name="submit" id="submit"
                                            value="送出" />
                                        <span>&nbsp;&nbsp;</span>
                                        <input type='button' class='btn btn-secondary' id='clickme1' value='Comment'>
                                    </div>
                                    <div>
                                        <form:errors path="comment" style="font-size:12px;color:red" />
                                    </div>

                                <td>
                            </tr>
                            <tr>
                                <c:forEach var="comBean" items="${CreateComment.items}">
                                    <td>
                                        <div><b>${comBean.comMemberId} : </b>${comBean.comment}</div>
                                    </td>
                                    <td style="text-align:right">
                                        <div>
                                            <c:set var="date"
                                                value="${fn:substring(CreateComment.updateDate, 0, 16)}" />
                                            &nbsp;&nbsp;&nbsp;<b></b> ${date}
                                        </div>
                                    </td>
                                </c:forEach>
                            </tr>
                        </table>
                    </form:form>
                </div>
            </div>
        </div><br>
        <div align="center">
            <input class="btn btn-primary" type="button" onclick="location.href='<c:url value="/AllArticleComment" />' " value="回前頁" />
        </div>
    </div>
</body>
</html>