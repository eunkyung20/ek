<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h1>Login</h1>
	<form action="loginPro.jsp" id="join" method="post">
		<fieldset>
			<legend>섬집 Login</legend>
			회원유형
				<input type="radio" name="ra" value="일반회원" checked>일반회원
		  		<input type="radio" name="ra" value="사장님">사장님<br>

			<input type="text" name="id" placeholder="아이디를 입력하세요"><br>

			<input type="password" name="pass" placeholder="비밀번호를 입력하세요"><br>
			<input type="submit" value="로그인" class="submit"><br>
			<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
			<a href="javascript:void(0)"> <img
				src="/team_project/img/login/kakao_login_medium.png"
				onclick="kakaoLogin();">
			</a><br>

			<!-- 카카오 스크립트 -->
			<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
			<script>
				Kakao.init('81dff4064f99f393a085fd8ff83b18aa'); //발급받은 키 중 javascript키를 사용해준다.
				console.log(Kakao.isInitialized()); // sdk초기화여부판단
				//카카오로그인
				function kakaoLogin() {
					Kakao.Auth.login({
						success : function(response) {
							Kakao.API.request({
								url : '/v2/user/me',
								success : function(response) {
									console.log(response)
								},
								fail : function(error) {
									console.log(error)
								},
							})
						},
						fail : function(error) {
							console.log(error)
						},
					})
				}
			</script>


			<!-- 아래와같이 아이디를 꼭 써준다. -->
			<a id="naverIdLogin_loginButton" href="javascript:void(0)"> <img
				src="/team_project/img/login/naver_login.png">
			</a>

			<!-- 네이버 스크립트 -->
			<script
				src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.2.js"
				charset="utf-8"></script>

			<script>
				var naverLogin = new naver.LoginWithNaverId({
					clientId : "6XJ__g63Sc5NiUrjZ33C", //내 애플리케이션 정보에 cliendId를 입력해줍니다.
					callbackUrl : "http://localhost:8080/naverlogin", // 내 애플리케이션 API설정의 Callback URL 을 입력해줍니다.
					isPopup : false,
					callbackHandle : true
				});

				naverLogin.init();

				window.addEventListener('load', function() {
					naverLogin.getLoginStatus(function(status) {
						if (status) {
							var email = naverLogin.user.getEmail(); // 필수로 설정할것을 받아와 아래처럼 조건문을 줍니다.

							console.log(naverLogin.user);

							if (email == undefined || email == null) {
								alert("이메일은 필수정보입니다. 정보제공을 동의해주세요.");
								naverLogin.reprompt();
								return;
							}
						} else {
							console.log("callback 처리에 실패하였습니다.");
						}
					});
				});

				var testPopUp;
				function openPopUp() {
					testPopUp = window
							.open("https://nid.naver.com/nidlogin.logout",
									"_blank",
									"toolbar=yes,scrollbars=yes,resizable=yes,width=1,height=1");
				}
				function closePopUp() {
					testPopUp.close();
				}


			}
			</script>

		</fieldset>

	</form>

	<nav id="sub_menu">
		<a href="join.jsp">회원가입</a><span class="p-2"> | </span> 
		<a href="#">ID/비번찾기</a><span class="p-2"> | </span>
		<a href="#">비밀번호재설정</a>

	</nav>
</body>
</html>