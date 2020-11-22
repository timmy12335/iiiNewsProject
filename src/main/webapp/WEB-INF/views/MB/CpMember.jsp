<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/vendors/ti-icons/css/themify-icons.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/vendors/base/vendor.bundle.base.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/style.css">
<!-- <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous"> -->
<!-- <script> -->

<!-- </script> -->
<title>註冊</title>
<style>
::-webkit-input-placeholder {
	color: #FFA042;
}

:-moz-placeholder {
	color: #FFA042;
}

::-moz-placeholder {
	color: #FFA042;
}

:-ms-input-placeholder {
	color: #FFA042;
}

.test {
	border: 0;
	background-color: #BC214C;
	color: #fff;
	border-radius: 10px;
	cursor: pointer;
}

input:hover {
	color: #003C9D;
	background-color: #C7C7E2;
	border: 2px #003C9D solid;
}

table {
	margin-left: auto;
	margin-right: auto;
}

g-recaptcha {
	
}
</style>


</head>
<body>
	<nav class="nav fixed-top">
		<jsp:include page="/fragment/navbar.jsp"></jsp:include>
	</nav>
	<section style="margin-top: 100px;" align="center">
		<form:form id="regform" onsubmit="return checkinput()"
			modelAttribute="command_CP" class="forms-sample">
			<div class="row justify-content-md-center">
				<div class="col-md-5 grid-margin stretch-card">
					<div class="card">
						<div class="card-body">
							<h2>企業會員</h2>
							<p class="card-description">Basic form layout</p>
							<div class="form-group" align="left">
								<label for="cpmemberId">登入帳號：</label>
								<form:input type="text" path="cpmemberId" class="form-control"
									id='cpmemberId' placeholder="輸入帳號" />
								<form:errors style="color:red;font-size:12px" path="cpmemberId"></form:errors>
							</div>
							<div class="form-group" align="left">
								<label for="password2">登入密碼：</label>
								<form:input type="password" path="password2"
									class="form-control" id='password2' placeholder="輸入密碼" />
								<div class="form-group" align="left">
									<label for="okpassword2">確認密碼：</label> <input type="password"
										name="okpassword2" class="form-control" id='okpassword2'
										placeholder="再次輸入密碼" />
								</div>
								<div class="form-group" align="left">
									<label for="cpname">公司行號：</label>
									<form:input type="text" path="cpname" id="cpname"
										placeholder="請輸入公司行號" class="form-control" />
								</div>
								<div class="form-group" align="left">
									<label for="cpemail">公司信箱：</label>
									<form:input type="email" path="cpemail" class="form-control"
										placeholder="輸入公司信箱" />
								</div>
								<div class="form-group" align="left">
									<label for="cpaddress">公司地址：</label>
									<form:input type="text" path="cpaddress" id="cpaddress"
										placeholder="請輸入公司地址" class="form-control" />
								</div>
								<div class="form-group" align="left">
									<label for="cptel">公司電話：</label>
									<form:input type="text" id="cptel" path="cptel"
										class="form-control" placeholder="請加入區碼..."></form:input>
								</div>
								<div class="form-group" align="left">
									<label for="Uniformnumbers">統一編號：</label>
									<form:input type="text" path="Uniformnumbers"
										class="form-control" id='Uniformnumbers'
										placeholder="請輸入八位數..."></form:input>
								</div>
								<div class="form-group" align="left">
									<label for="founddate">創立日期：</label>
									<form:input type="date" path="founddate" class="form-control"
										id='founddate' />
								</div>
								<div class="form-group" align="left">
									<label for="Uniformnumbers">驗證號碼：</label> <input type="text"
										class="form-control" id="Yzm" /> <input class="test"
										type="button" id="code" value="產生驗證碼" onclick="createCode()">
								</div>
								<div class="form-group" align="left">
									<label colspan='5' id="grecaptcha" class="g-recaptcha"
										data-sitekey="6LcXZ7IZAAAAAAkcEb54s18XQh2cq-DzVhCd-LxB"></label>
								</div>
								<div class="form-group" align="left">
									<label colspan='2' id="g-recaptcha-error"></label>
								</div>
								<div class="form-group" align="center">
									<label colspan="3" style="text-align: center;"></label><input
										type="hidden" name="action" value="reg" class="form-control" />
									<input type="submit" value="送出註冊" class="btn btn-primary btn-icon-text" />
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href="<c:url value='/LoginMB' />"
										class="btn btn-info">登錄</a>
								</div>
								<button type="button" class="btn btn-social-icon btn-facebook btn-rounded"><i class="ti-facebook"></i></button>
								<button type="button" class="btn btn-social-icon btn-google btn-rounded"><i class="ti-google"></i></button>
								<button type="button" class="btn btn-social-icon btn-twitter btn-rounded"><i class="ti-twitter-alt"></i></button>
								<button type="button" class="btn btn-social-icon btn-youtube btn-rounded"><i class="ti-youtube"></i></button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</form:form>
	</section>

	<script src="https://www.google.com/recaptcha/api.js"></script>

	<script type="text/javascript">
		function checkinput() {

			//檢查統一編號
			var number = document.getElementById("Uniformnumbers");
			if (number.value.length != 8) {
				window.alert("格式不正確，請重新輸入");
				document.getElementById("Uniformnumbers").focus();
				return false;
			}

			// 檢查登入帳號是否有特殊字元
			var re = /[^a-zA-Z0-9.-_]/;
			var okname = re.exec(document.getElementById("cpmemberId").value);
			if (okname) {
				window.alert("只允許英文、數字");
				document.getElementById("cpmemberId").focus();
				return false;
			}

			// 開始檢查密碼長度是否正確？
			var pw1 = document.getElementById("password2");
			if (pw1.value.length < 5) {
				window.alert("密碼長度必須要大於 5 個字元以上");
				document.getElementById("password2").focus();
				return false;
			}

			// 看看兩次密碼是否相同？
			var pw2 = document.getElementById("okpassword2");
			if (pw1.value != pw2.value) {
				window.alert("兩次密碼並不相同！");
				document.getElementById("password2").focus();
				return false;
			}

			// 檢查生日的格式正確與否
			re = /^[0-9]{4}[./-][0-9]{2}[./-][0-9]{2}$/;
			var okday = re.exec(document.getElementById("founddate").value);
			if (!okday) {
				window.alert("日期格式為 2011-11-11");
				document.getElementById("founddate").focus();
				return false;
				// 檢查電話格式是否正確
			}
		}
		var code; //在全域性定義驗證碼
		//產生驗證碼
		function createCode() {
			code = "";
			var codeLength = 6;//驗證碼的長度
			var checkCode = document.getElementById("code");
			var random = new Array(0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 'A', 'B', 'C',
					'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O',
					'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z');//隨機數
			for (var i = 0; i < codeLength; i++) {//迴圈操作
				var index = Math.floor(Math.random() * 36);//取得隨機數的索引（0~35）
				code += random[index];//根據索引取得隨機數加到code上
			}
			checkCode.value = code;//把code值賦給驗證碼

			//校驗驗證碼
			document.getElementById("Yzm").addEventListener("change", validate);
		}
		function validate() {
			var inputCode = document.getElementById("Yzm").value.toUpperCase(); //取得輸入的驗證碼並轉化為大寫
			if (inputCode.length <= 0) { //若輸入的驗證碼長度為0
				alert("請輸入驗證碼！"); //則彈出請輸入驗證碼
				$("#Yzm").focus();
				YZM = false;
			} else if (inputCode != code) { //若輸入的驗證碼與產生的驗證碼不一致時
				alert("驗證碼輸入錯誤！@_@"); //則彈出驗證碼輸入錯誤
				createCode();//重新整理驗證碼
				$("#Yzm").val("");//清空文字框
				$("#Yzm").focus();//重新聚焦驗證碼框
				YZM = false;
			} else { //輸入正確時
				$("#Yzm").blur();//繫結驗證碼輸入正確時要做的事
				YZM = true;
			}
		}
	</script>

	<script>
		function submitUserForm() {
			var response = grecaptcha.getResponse();
			if (response.length == 0) {
				document.getElementById('g-recaptcha-error').innerHTML = '_$tag____________________請點選我不是機器人_$tag__';
				return false;
			}
			return true;
		}
		function verifyCaptcha() {
			document.getElementById('g-recaptcha-error').innerHTML = '';
		}
	</script>

	<script type="text/javascript">
		function checkphone() {
			var obj = document.getElementById("cptel");
			var value = obj.value;
			var regTel1 = /^(([0\ ]\d{2,3}-)?(0\d{2,3})-)(\d{10})(-(\d{3,}))?$/
					.test(value);
			var regTel2 = /^(\d{10})?$/.test(value);
			if (value != "") {
				if (!regTel1 && !regTel2) {
					alert("電話號碼格式不正確！");
					obj.focus();
					return false;
				}
			} else {
				alert("請輸入電話號碼！");
				return false;
			}
			alert("正確！");
			return true;
		}
	</script>
</body>
</html>