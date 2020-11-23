<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html lang="zh-Hant-TW">
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
<title>更新內文</title>
    <script>
        window.onload = function () {
            var btn = document.getElementById("update1");
            var btn2 = document.getElementById("update2");
            btn.onclick = function () {
                A = document.getElementById("Category")
                A.value = "生活"
                AA = document.getElementById("title")
                AA.value = "買4萬筆電，只來贈品背包"
                article = document.getElementById("article")
                article.value = "好啦標題殺人了，\n已經跟店家溝通過並退費了，\n不過還沒收到退款。\n\n我在今天早上收到了之前買的筆電，\n不過一拿到包裹，\n那個重量和大小，\n就知道裡面絕對沒有筆電，\n我心想這大概只有贈品的背包滑鼠吧。"
            }

            btn2.onclick = function () {
                B = document.getElementById("Category")
                B.value = "問卦"
                BB = document.getElementById("title")
                BB.value = "為什麼有些咖啡店熱得比冰的貴?"
                article = document.getElementById("article")
                article.value = "如題\n想請問一下\n為什麼有些咖啡店\n熱的會比冰的貴\n會問這個\n主要是因為有些咖啡店熱和冰沒有差\n有人知道嗎?"
            }
        }
    </script>
    <style>
        .iiinewsContainer {
            margin-top: 100px;
            margin-bottom: 100px;
            position: relative;
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
                        <div class="card-header bg-secondary text-white">
                            <h2>更新文章編號:${mtAddBean.articleId}</h2>
                        </div>
                        <div class="card-body">
                            <form:form method="POST" modelAttribute="mtAddBean" enctype="multipart/form-data"
                                onsubmit="return submitUserForm();">
                                <fieldset>
                                    <div>
                                        <form:input type="hidden" id="articleId" name="articleId" path="articleId" value="${ mtAddBean.articleId }" />
                                        <form:input type="hidden" id="imgName" name="imgName" path="imgName" value="${ mtAddBean.imgName }" />
                                        <form:input type="hidden" id="memberId" name="memberId" path="memberId" value="${ mtAddBean.memberId }" />
                                        <form:input type="hidden" id="status" name="status" path="status" value="${ mtAddBean.status }" />
                                        <form:input type="hidden" id="updateDate" name="updateDate" path="updateDate" value="${ mtAddBean.updateDate }" />
                                    </div>
                                    <div class="form-group row">
                                        <label class="col-sm-2 col-form-label" for="Category">類別:</label>
                                        <div class="col-sm-9">
                                            <form:select class="form-control" path="Category"
                                                value="${mtAddBean.category}">
                                                <form:option value="未分類">未分類</form:option>
                                                <form:option value="生活">生活</form:option>
                                                <form:option value="娛樂">娛樂</form:option>
                                                <form:option value="問卦">問卦</form:option>
                                                <form:option value="美食">美食</form:option>
                                                <form:option value="運動">運動</form:option>
                                                <form:option value="趣味">趣味</form:option>
                                                <form:option value="寵物">寵物</form:option>
                                            </form:select>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label class="col-sm-2 col-form-label" for="title">標題:</label>
                                        <div class="col-sm-9">
                                            <form:input class="form-control" type="text" id="title" name="title"
                                                path="title" size="45" value="${mtAddBean.title}" />
                                            <form:errors path="title" style="font-size:16px; color:red" />
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label class="col-sm-2 col-form-label" for="Image">照片:</label>
                                        <div class="col-sm-9">
                                            <form:input type="file" id="Image" name="Image" path="Image"
                                                value="${mtAddBean.imgLink}" />
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label class="col-sm-2 col-form-label" for="article">內容:</label>
                                        <div class="col-sm-9">
                                            <form:textarea class="form-control" name="article" id="article" cols="30"
                                                rows="10" path="article" maxlength="" value="${mtAddBean.article}" />
                                            <form:errors path="article" style="font-size:16px;color:red" />
                                        </div>
                                    </div>
                                </fieldset>
                                <div align="center">
                                    <input class="btn btn-primary" type="submit" name="submit" id="submit" value="送出" />
                                    <input class="btn btn-primary" type="button" onclick="history.back()" value="回前頁，取消編輯" />
                                    <input type='button' class='btn btn-outline-secondary' id='update1' value='Update'>
<!--                                     <input type='button' class='btn btn-outline-secondary' id='update2' value='Update2'> -->
                                </div>
                            </form:form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>