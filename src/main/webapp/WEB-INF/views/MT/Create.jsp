<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html lang="zh-Hant-TW">
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
<title>新增文章</title>
	<script>
        window.onload = function () {
            var btn = document.getElementById("clickme1");
            var btn2 = document.getElementById("clickme2");
            btn.onclick = function () {
                A = document.getElementById("Category")
                A.value = "生活"
                AA = document.getElementById("title")
                AA.value = "有沒有雙11前 電商先漲一波的八卦"
                article = document.getElementById("article")
                article.value = "這陣子上網找適合的筆電\n發現昨天價格還在47xxx\n今天再上去看變成51xxx\n一開始還以為看錯機型\n發現電商的價格還連動\n有沒有先漲再降大特賣的八卦"
            }

            btn2.onclick = function () {
                B = document.getElementById("Category")
                B.value = "問卦"
                BB = document.getElementById("title")
                BB.value = "為什麼很多老人喜歡把發票印出來?"
                article = document.getElementById("article")
                article.value = "因為現在超商，都可以把發票存在會員裡面，發票開獎時還會自動對獎\n可是常常去超商的時候，還是會看到很多老人一定要店員把發票印出來\n有沒有為什麼老人這麼喜歡把發票印出來的八卦?"
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
                        <div class="card-header bg-info text-white">
                            <h2>${MBBean.name}您好，歡迎建立貼文</h2>
                        </div>
                        <div class="card-body">
                            <form:form method="POST" modelAttribute="mtBean" enctype="multipart/form-data">
                                <fieldset>
                                    <div class="form-group row">
                                        <label class="col-sm-2 col-form-label" for="Category">類別:</label>
                                        <div class="col-sm-9">
                                            <form:select class="form-control" path="Category">
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
                                            <form:input class="form-control" type="text" id="title" name="title" path="title"
                                                size="45" placeholder="今晚我想來點..." />
                                            <form:errors path="title" style="font-size:16px; color:red" />
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label class="col-sm-2 col-form-label" for="Image">照片:</label>
                                        <div class="col-sm-9">
                                            <form:input type="file" id="Image" name="Image" path="Image" style="overflow:hidden;"/>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label class="col-sm-2 col-form-label" for="article">內容:</label>
                                        <div class="col-sm-9">
                                            <form:textarea class="form-control" name="article" id="article" cols="45" rows="10"
                                                path="article" maxlength="999" placeholder="限輸入250字"></form:textarea>
                                            <form:errors path="article" style="font-size:16px; color:red" />
                                        </div>
                                    </div>
                                </fieldset>
                                <div align="center">
                                    <button class="btn btn-primary">送出</button>
                                    <input class="btn btn-primary" type="reset" name="cancel" id="cancel" value="清除" />
                                    <input type='button' class='btn btn-outline-secondary' id='clickme1' value='Demo'>
<!--                                     <input type='button' class='btn btn-outline-secondary' id='clickme2' value='Demo2'> -->
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