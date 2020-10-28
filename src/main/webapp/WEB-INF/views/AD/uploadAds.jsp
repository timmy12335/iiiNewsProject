<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html lang="zh-Hant-TW">
<head>
<meta charset="UTF-8">
<title>上架廣告欄位</title>
</head>
<body>
<nav>
<jsp:include page="/fragment/navbar.jsp"></jsp:include> 
</nav>
<div id="page" class="container" align="center">
    <h2 class="BoxTitle">廣告欄位置上傳</h2>
    <div>
    <form:form method="POST" modelAttribute="adBean">
    	<fieldset>
                <div class="divstyle">
                    <label for="category">欄位位置:</label>
                    <form:select path="categoryNo">
                        <form:option value="none">分類項目</form:option>
                        <form:option value="100">頭版頭</form:option>
                        <form:option value="200">頭版側標</form:option>
                        <form:option value="300">內頁版頭</form:option>
                        <form:option value="400">內頁側標</form:option>
                        <form:option value="500">小廣告</form:option>
                    </form:select>
                    <font color="red" size="-1">${errorMsg.errorCategoryNoEmpty}</font>
                </div>
                <div class="divstyle">
                    <label for="idWidth">寬:</label>
                    <form:input type="text" id="idWidth" name="idWidth" size="20" path="width" placeholder="請輸入寬" value="${param.idWidth }" />
                    <font color="red" size="-1">${errorMsg.errorWidthEmpty}</font>
                </div>
                <div class="divstyle">
                    <label for="idHeight">高:</label>
                    <form:input type="text" id="idHeight" name="idHeight" size="20" path="height" placeholder="請輸入高" value="${param.idHeight }" />
                    <font color="red" size="-1">${errorMsg.errorHeightEmpty}</font>
                </div>
                <div class="divstyle">
                    <label for="idDate">廣告時間:</label>
                    <form:input type="date" id="idDate" name="idDate" size="20" path="adDate" placeholder="請輸入時間" />
                    <font color="red" size="-1">${errorMsg.errorDateEmpty} ${errorMsg.mNewsDate}</font>
                </div>
                <div class="divstyle">
                    <label for="idPrice">價錢:</label>
                    <form:input type="number" step="100" min="0" max="1000" id="idPrice" name="idPrice" size="20" path="price"
                         placeholder="請輸入價錢" value="${param.idPrice }" />
                     <font color="red" size="-1">${errorMsg.errorPriceEmpty} ${errorMsg.mPrice}</font>
                </div>
                <div class="divstyle">
                    <label for="idStock">庫存:</label>
                    <form:input type="number" step="1" min="1" max="20" id="idStock" name="idStock" size="20" path="stock"
                         placeholder="請輸入庫存" value="${param.idStock }" />
                     <font color="red" size="-1">${errorMsg.errorPriceEmpty} ${errorMsg.mPrice}</font>
                </div>
                <div id="uploadPhoto" class="divstyle">
                    <label for="">上傳照片:</label>
                    <input type="file" id="idPhoto1" name="idPhoto1">
                </div>
            </fieldset>
            <div class="sub">
                <input type="submit" name="submit" id="submit" value="送出">
                <input type="reset" value="清除">
            </div>
	</form:form>

	<a href="<c:url value='/' />">回首頁喔</a>

    </div>
    <br>
    <input type="button" value="one" onclick="onebuttontodata()">
</div>


</body>
</html>