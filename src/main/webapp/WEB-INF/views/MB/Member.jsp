<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<script src="https://www.google.com/recaptcha/api.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/vendors/ti-icons/css/themify-icons.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/vendors/base/vendor.bundle.base.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/style.css">
<!-- <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous"> -->

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
			modelAttribute="command" class="forms-sample">
			<div class="row justify-content-md-center">
				<div class="col-md-5 grid-margin stretch-card">
					<div class="card">
						<div class="card-body">
							<h2>一般會員</h2>
							<p class="card-description">Basic form layout</p>
							<div class="form-group" align="left">
								<label for="memberId">登入帳號：</label>
								<form:input type="text" path="memberId" class="form-control"
									id='memberId' placeholder="輸入帳號" />
								<form:errors style="color:red;font-size:12px" path="memberId"></form:errors>
							</div>
							<div class="form-group" align="left">
								<label for="password">登入密碼：</label>
								<form:input type="password" path="password" class="form-control"
									required="true" id='password' placeholder="輸入密碼" />
							</div>
							<div class="form-group" align="left">
								<label for="okpassword">確認密碼：</label> <input type="password"
									name="okpassword" class="form-control" required="required"
									id='okpassword' placeholder="再次輸入密碼" />
							</div>
							<div class="form-group" align="left">
								<label for="name">真實姓名：</label>
								<form:input type="text" path="name" id="name"
									class="form-control" placeholder="請輸入真實姓名" required="true" />
							</div>
							<div class="form-group" align="left">
								<label for="email">電子郵件：</label>
								<form:input type="email" path="email" placeholder="輸入常用信箱"
									class="form-control" />
							</div>

							<div class="form-group" align="left">
								<label for="identityId">身分證號：</label>
								<form:input type="text" path="identityId" id='identityId'
									placeholder="請輸入正確格式" class="form-control"></form:input>
							</div>
							<div class="form-group" align="left">
								<label for="phone">行動電話：</label>
								<form:input type="text" id="phone" path="phone"
									placeholder="請務必填寫正確" class="form-control"></form:input>
								<input class="test" type="button" id="btnCheckphone"
									onclick="checkphone(this.id)" value="發送驗證碼">
							</div>
							<div class="form-group" align="left">
								<label for="birthday">生日：</label>
								<form:input type="date" path="birthday" required="true"
									id='bday' class="form-control" />
							</div>
							<div class="form-group" align="left">
								<label for="sex">性別：</label>
								<form:select path="sex">
									<option value="0">女性</option>
									<option value="1">男性</option>
								</form:select>
							</div>
							<div class="form-group" align="left">
								<label for="Yzm">驗證號碼：</label> <input type="text"
									class="form-control" required="required" id="Yzm" /> <input
									class="test" type="button" id="code" value="產生驗證碼"
									onclick="createCode()">
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
								<input type="submit" value="送出註冊" class="btn btn-primary btn-icon-text"/>
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=""
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
		</form:form>
	</section>
	
	<script type="text/javascript">
		//我不是機器人
		function submitUserForm() {
			var response = grecaptcha.getResponse();
			if (response.length == 0) {
				document.getElementById('g-recaptcha-error').innerHTML = '<span style="color:red;">請點選我不是機器人</span>';
				return false;
			}
			return true;
		}
		function verifyCaptcha() {
			document.getElementById('g-recaptcha-error').innerHTML = '';
		}

		function checkinput() {
			// 檢查登入帳號是否有特殊字元
			var re = /[^a-zA-Z0-9.-_]/;
			var okname = re.exec(document.getElementById("memberId").value);
			if (okname) {
				window.alert("只允許英文、數字");
				document.getElementById("memberId").focus();
				return false;
			}

			// 開始檢查密碼長度是否正確？
			var pw1 = document.getElementById("password");
			if (pw1.value.length < 5) {
				window.alert("密碼長度必須要大於 5 個字元以上");
				document.getElementById("password").focus();
				return false;
			}

			// 看看兩次密碼是否相同？
			var pw2 = document.getElementById("okpassword");
			if (pw1.value != pw2.value) {
				window.alert("兩次密碼並不相同！");
				document.getElementById("password").focus();
				return false;
			}

			// 檢查生日的格式正確與否
			re = /^[0-9]{4}[./-][0-9]{2}[./-][0-9]{2}$/;
			var okday = re.exec(document.getElementById("birthday").value);
			if (!okday) {
				window.alert("日期格式為 2011-11-11");
				document.getElementById("birthday").focus();
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

	<script type="text/javascript">
		function checkphone(objid) {

			var phone = document.getElementById("phone").value;
			var queryString = "?phone=" + phone;
			var xhr2 = new XMLHttpRequest();

			xhr2.open("GET", "<c:url value='Member_SMS'/>" + queryString, true);
			xhr2.send();
		}

		// 		var wait = 60;
		// 		function checkphone(o) {
		// 			if (wait == 0) {
		// 				o.removeAttribute("disabled");
		// 				o.value = "發送驗證碼";
		// 				wait = 60;
		// 			} else {
		// 				o.setAttribute("disabled", true);
		// 				o.value = wait
		// 				"秒後可以重新傳送";
		// 				wait--;
		// 				setTimeout(function() {
		// 					checkphone(o)
		// 				}, 1000)
		// 			}
		// 			document.getElementById("btnCheckphone").onclick = function() {
		// 				checkphone(this);
		// 			}
		// 		}

		// 		function checkphone() {
		// 			var obj = document.getElementById("phone");
		// 			var value = obj.value;
		// 			var regTel1 = /^(([0\ ]\d{2,3}-)?(0\d{2,3})-)(\d{10})(-(\d{3,}))?$/
		// 					.test(value);
		// 			var regTel2 = /^(\d{10})?$/.test(value);
		// 			if (value != "") {
		// 				if (!regTel1 && !regTel2) {
		// 					alert("電話號碼格式不正確！");
		// 					obj.focus();
		// 					return false;
		// 				}
		// 			} else {
		// 				alert("請輸入電話號碼！");
		// 				return false;
		// 			}
		// 			alert("正確！");
		// 			return true;
		// 		}

		function checkID(id) {
			tab = "ABCDEFGHJKLMNPQRSTUVXYWZIO"
			A1 = new Array(1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 2, 2, 2, 2, 2, 2,
					2, 2, 2, 3, 3, 3, 3, 3, 3);
			A2 = new Array(0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 0, 1, 2, 3, 4, 5, 6,
					7, 8, 9, 0, 1, 2, 3, 4, 5);
			Mx = new Array(9, 8, 7, 6, 5, 4, 3, 2, 1, 1);

			if (id.length != 10)
				return false;
			i = tab.indexOf(id.charAt(0));
			if (i == -1)
				return false;
			sum = A1[i] + A2[i] * 9;

			for (i = 1; i < 10; i++) {
				v = parseInt(id.charAt(i));
				if (isNaN(v))
					return false;
				sum = sum + v * Mx[i];
			}
			if (sum % 10 != 0)
				return false;
			return true;
		}
	</script>
</body>
</html>