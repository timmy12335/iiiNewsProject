<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>註冊</title>
</head>
<body>
	<nav>
		<jsp:include page="/fragment/navbar.jsp"></jsp:include>
	</nav>
	<section style="margin-top: 100px;" align="center">
		<div id="page" class="container"></div>
		<form id="regform" onsubmit="return checkinput()" action="/jsp/up">
			<table width="600" border="0" align="center">
				<h3 align="center">會員註冊</h3>
				<tr>
					<td>登入帳號：</td>
					<td><input type="text" name="memberId" required="required"
						id='memberId' /></td>
					<td>帳號只能是英文、數字，其餘字元均不接受</td>
				</tr>
				<tr>
					<td>登入密碼：</td>
					<td><input type="password" name="password" required="required"
						id='password' /></td>
					<td>密碼只能是英文、數字，長度必須大於 5</td>
				</tr>
				<tr>
					<td>確認密碼：</td>
					<td><input type="password" name="okpassword"
						required="required" id='okpassword' /></td>
					<td>再輸入一次密碼，確認沒有打錯字</td>
				</tr>
				<tr>
					<td>真實姓名：</td>
					<td><input type="text" name="realname" required="required" /></td>
					<td>填寫註冊者的姓名</td>
				</tr>

				<tr>
					<td>電子郵件：</td>
					<td><input type="email" name="u_email" /></td>
					<td>請填慣用的電子郵件</td>
				</tr>
				
				<tr>
					<td>身分證：</td>
					<td><input type="text" name="identityId" id='identityId'>
					<td><input type="button" id="btnCheck" value="檢查格式是否正確"
						onclick="return checkidentityId();">
				</tr>
				
				<tr>
					<td>行動電話：</td>
					<td><input type="text" id="phone" name="phone">
					<td><input type="button" id="btnCheck" value="檢查格式是否正確"
						onclick="return checkphone();">
				<tr>
					<td>生日：</td>
					<td><input type="date" name="u_bday" required="required"
						id='bday' /></td>
					<td>請使用 YYYY-MM-DD 的格式</td>
				</tr>
				<tr>
					<td>
				</tr>

				<tr>
					<td>性別：</td>
					<td><select name="u_sex">
							<option value="0">女性</option>
							<option value="1">男性</option>
					</select></td>
					<td></td>
				</tr>
				<tr>
					<td colspan="3" style="text-align: center;"><input
						type="hidden" name="action" value="reg" /> <input type="submit"
						value="送出註冊" /></td>
				</tr>
			</table>
		</form>
		<section>

			<script>
				function checkinput() {
					// 檢查登入帳號是否有特殊字元
					var re = /[^a-zA-Z0-9.-_]/;
					var okname = re
							.exec(document.getElementById("memberId").value);
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
					var okday = re.exec(document.getElementById("bday").value);
					if (!okday) {
						window.alert("日期格式為 2011-11-11");
						document.getElementById("bday").focus();
						return false;
						// 檢查電話格式是否正確
					}
				}
			</script>

			<script type="text/javascript">
				function checkphone() {
					var obj = document.getElementById("phone");
					var value = obj.value;
					var regTel1 = /^(([0\ ]\d{2,3}-)?(0\d{2,3})-)(\d{10})(-(\d{3,}))?$/
							.test(value);
					var regTel2 = /^(\d{10})?$/.test(value);
					if (value != "") {
						if (!regTel1 && !regTel2) {
							alert("電話號碼輸入有誤！");
							obj.focus();
							return false;
						}
					} else {
						alert("請輸入電話號碼！");
						return false;
					}
					alert("電話號碼輸入正確！");
					return true;
				}
			</script>

			<script type="text/javascript">
				function checkidentityId() {
					var obj = document.getElementById("identityId");
					// 依照字母的編號排列，存入陣列備用。
					var letters = new Array('A', 'B', 'C', 'D', 'E', 'F', 'G',
							'H', 'J', 'K', 'L', 'M', 'N', 'P', 'Q', 'R', 'S',
							'T', 'U', 'V', 'X', 'Y', 'W', 'Z', 'I', 'O');
					// 儲存各個乘數
					var multiply = new Array(1, 9, 8, 7, 6, 5, 4, 3, 2, 1);
					var nums = new Array(2);
					var firstChar;
					var firstNum;
					var lastNum;
					var total = 0;
					// 撰寫「正規表達式」。第一個字為英文字母，
					// 第二個字為1或2，後面跟著8個數字，不分大小寫。
					var regExpID = /^[a-z](1|2)\d{8}$/i;
					// 使用「正規表達式」檢驗格式
					if (str.search(regExpID) == -1) {
						// 基本格式錯誤
						alert("請仔細填寫身份證號碼");
						return false;
					} else {
						// 取出第一個字元和最後一個數字。
						firstChar = str.charAt(0).toUpperCase();
						lastNum = str.charAt(9);
					}
					// 找出第一個字母對應的數字，並轉換成兩位數數字。
					for (var i = 0; i < 26; i++) {
						if (firstChar == letters[i]) {
							firstNum = i + 10;
							nums[0] = Math.floor(firstNum / 10);
							nums[1] = firstNum - (nums[0] * 10);
							break;
						}
					}
					// 執行加總計算
					for (var i = 0; i < multiply.length; i++) {
						if (i < 2) {
							total += nums[i] * multiply[i];
						} else {
							total += parseInt(idStr.charAt(i - 1))
									* multiply[i];
						}
					}
					// 和最後一個數字比對
					if ((10 - (total % 10)) != lastNum) {
						alert("身份證號碼寫錯了！");
						return false;
					}
					return true;
				}
			</script></body>
</html>