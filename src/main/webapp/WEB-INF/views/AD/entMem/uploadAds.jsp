<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html lang="zh-Hant-TW">
<head>
<meta charset="UTF-8">
<title>上架廣告欄位</title>
<style>
/*在此設定margin 以防止被navbar壓到*/
.iiinewsContainer {
	margin-top: 100px;
	margin-bottom: 100px;
	position: relative;
}
	html{
		margin-left:calc(100vw - 100%);
		overflow-y: scroll;
	}
</style>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css"
	integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS"
	crossorigin="anonymous">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
	window.onload = function() {
		var date = new Date();
		var day = date.getDate();
		var month = date.getMonth() + 1;

		if (date.getMonth() < 10) {
			month = "0" + (date.getMonth() + 1);
		}

		if (date.getDate() < 10) {
			day = "0" + date.getDate();
		}

		var today = date.getFullYear() + "-" + month + "-" + day;
		console.log(today);

		var nextYear = date.getFullYear();
		var nextMonth = month + 2;
		var nextDay = 1;
		if (nextMonth == 13) {
			nextMonth = 1;
			nextYear += 1;
		}
		if (nextMonth == 14) {
			nextMonth = 2;
			nextYear += 1;
		}
		if (nextMonth < 10) {
			nextMonth = "0" + (nextMonth);
		}

		if (nextDay < 10) {
			nextDay = "0" + nextDay;
		}

		var nextdate = nextYear + "-" + nextMonth + "-" + nextDay;
		console.log(nextdate);

		$("#idDate").attr("min", today);
		$("#idDate").attr("max", nextdate);

		$("#idDate").attr("value", today);
	}
</script>
</head>
<body>
	<!-- 要套Bootstrap可能會出現navbar下拉選單被疊在下層的情況 可以試試看在這裡加上
	class="navbar fixed-top"  讓navbar也套用bootstrap屬性讓他們同一層 -->
	<nav class="navbar fixed-top">
		<jsp:include page="/fragment/navbar.jsp"></jsp:include>
	</nav>
	<!-- 而因為navbar會佔頁首一些位置 我是手寫讓下方開始時自動留100px top 還沒想到更好的做法QQ -->
	<div class="iiinewsContainer">
		<div class="container">
			<div class="row">
				<div class="col-md-6 grid-margin stretch-card">
					<div class="card">
						<div class="card-header">
							<h2>廣告欄位上架</h2>
						</div>
						<div class="card-body">
							<form:form method="POST" modelAttribute="adBean">
								<fieldset>
									<div class="form-group row">
										<label for="idTitle" class="col-sm-3 col-form-label">標題:</label>
										<div class="col-sm-9">
											<form:input class="form-control" type="text" id="idTitle"
												name="idTitle" path="adTitle" />
											<form:errors path="adTitle" cssClass="error" />
										</div>
									</div>
									<div class="form-group row">
										<label for="category" class="col-sm-3 col-form-label">欄位位置:</label>
										<div class="col-sm-9">
											<form:select class="form-control" path="categoryNo">
												<form:option value="-1">分類項目</form:option>
												<form:option value="100">頭版頭</form:option>
												<form:option value="200">頭版側標</form:option>
												<form:option value="300">內頁版頭</form:option>
												<form:option value="400">內頁側標</form:option>
												<form:option value="500">小廣告</form:option>
											</form:select>
											<form:errors path="categoryNo" cssClass="error" />
										</div>
									</div>
									<div class="form-group row">
										<label for="idWidth" class="col-sm-3 col-form-label">寬:</label>
										<div class="col-sm-9">
											<form:input class="form-control" type="text" id="idWidth"
												name="idWidth" path="width" placeholder="請輸入寬" />
											
										</div>
									</div>
									<div class="form-group row">
										<label for="idHeight" class="col-sm-3 col-form-label">高:</label>
										<div class="col-sm-9">
											<form:input class="form-control" type="text" id="idHeight"
												name="idHeight" path="height" placeholder="請輸入高" />
											<form:errors path="height" cssClass="error" />
										</div>
									</div>
									<div class="form-group row">
										<label for="idDate" class="col-sm-3 col-form-label">廣告時間:</label>
										<div class="col-sm-9">
											<form:input class="form-control" type="date" id="idDate"
												name="idDate" path="adDate" placeholder="請輸入時間" />
											<form:errors path="adDate" cssClass="error" />
										</div>
									</div>
									<div class="form-group row">
										<label for="idPrice" class="col-sm-3 col-form-label">價錢:</label>
										<div class="col-sm-9">
											<form:input class="form-control" type="number" min="0"
												id="idPrice" name="idPrice" path="price" placeholder="請輸入價錢" />
											<form:errors path="price" cssClass="error" />
										</div>
									</div>
									<div class="form-group row">
										<label for="idStock" class="col-sm-3 col-form-label">庫存:</label>
										<div class="col-sm-9">
											<form:input class="form-control" type="number" step="1"
												min="1" max="20" id="idStock" name="idStock" path="stock"
												placeholder="請輸入庫存" />
											<form:errors path="stock" cssClass="error" />
										</div>
									</div>
									<div class="form-group row">
										<label for="idStatement" class="col-sm-3 col-form-label">備註:</label>
										<div class="col-sm-9">
											<form:input class="form-control" type="text" id="idStatement"
												name="idStatement" path="statement" />
											<form:errors path="statement" cssClass="error" />
										</div>
									</div>
								</fieldset>
								<div class="sub">
									<!-- 								<input type="submit" name="submit" id="submit" value="送出" -->
									<!-- 									class="btn btn-primary mr-2"> -->

									<button type="submit" class="btn btn-primary btn-icon-text">
										<i class="fa fa-file-o btn-icon-prepend"></i>&nbsp送出
									</button>
									<button type="reset" class="btn btn-danger btn-icon-text">
										<i class="fa fa-refresh btn-icon-prepend"></i>&nbsp清除
									</button>
									<button type="button" class="btn btn-outline-info btn-icon-text" onclick="onebuttontodata()">
										<i class="fa fa-refresh btn-icon-prepend"></i>&nbsp一鍵輸入
									</button>

									<input type="reset" value="" class="btn btn-light">
									<input type="button" value="one" onclick="onebuttontodata()"
										class="btn btn-light">
								</div>
							</form:form>
						</div>
					</div>
				</div>
				<div class="col-md-6 grid-margin stretch-card">
					<div class="card">
						<div class="card-body">
							<h2>廣告欄位上架</h2>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>


</body>
</html>