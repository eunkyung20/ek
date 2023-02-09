<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>review.JSP</title>

<script type="text/javascript" src="../script/jquery-3.6.3.js"></script>
<script type="text/javascript">
	// 별점 마킹 모듈 프로토타입으로 생성
	function Rating(){};
	Rating.prototype.rate = 0;
	Rating.prototype.setRate = function(newrate){
		// 별점 마킹 - 클릭한 별 이하 모든 별 체크 처리
		this.rate = newrate;	// 선택한 별점 값을 저장하는 변수
		let items = document.querySelectorAll('.rate_radio');
		items.forEach(function(item, idx) {
			if(idx < newrate) {
				item.checked = true;
			} else {
				item.checked = false;
			}
		});
	}
	
	let rating = new Rating();	// 별점 인스턴스 생성
	
	document.addEventListener('DOMContentLoaded', function(){
		// 별점선택 이벤트 리스너
		// 별 이미지를 클릭하면 setRate() 메서드 호출
		document.querySelector('.star_rating').addEventListener('click', function(e) {
			let elem = e.target;
			if(elem.classList.contains('rate_radio')) {
				rating.setRate(parseInt(elem.value));
			}
		});
	});
	
	// 후기 작성 글자수 초과 체크 이벤트 리스너 (해결중)
// 	document.querySelector('#review_textarea').addEventListener('keydown', function() {
// 		// 리뷰 400자 초과 안되게 자동 자름
// 		let review = document.querySelector('#review_textarea');
// 		let lengthCheck = /^.{10,}$/;
// 		if(lengthCheck.test(review.value)){
// 			// 400자 초과 컷
// 			review.value = review.value.substr(0,10);
// 		}
// 	});
	

	function formCheck() {
		// submit 버튼을 누르면 onsubmit에 의해 formCheck() 함수 호출
		// 별점 선택 안했으면 메시지 표시, 체크된 값을 배열 형태로 받아서 length 확인
		if(document.querySelectorAll('input[name="rating"]:checked').length==0) {
			alert("만족도를 선택해주세요.");
			return false;
		}
		// 리뷰 5자 미만이면 메시지 표시
		if(document.querySelector('#review_textarea').value.length < 5) {
			alert(" 5자 이상으로 작성해 주세요.");
			return false;
		}
	}
	

</script>
</head>
<body>
<!-- 리뷰 작성 페이지 -->
<%
// 	String id = (String)session.getAttribute("id");
	// 아이디 없으면 로그인 페이지로 이동
// 	if(id == null) {
		%>
<!-- 		<script type="text/javascript"> -->
<!--   			alert("로그인을 해주세요"); -->
<!-- 		</script> -->
		<%
// 		response.sendRedirect("login.jsp");C
// 	}
%>
<div class="container">
	<!-- 헤더 들어가는 곳 -->
	
	<article>
	<!-- 펜션 정보 가져오는 곳..?-->
		
	<form name="reviewForm" action="reviewPro.jsp" id="reviewForm" method ="post" onsubmit="return formCheck()">
		<div>
		글제목 : <input type="text" name="title">
		</div>
		
		<!-- 별점 -->
		<div id="reviewStars">
			<h3>??? 만족하셨나요?</h3>
			
			<div class="star_rating">
				<!-- 해당 별점을 클릭하면 해당 별과 그 왼쪽의 모든 별의 체크박스에 checked 적용 -->
				<input type="checkbox" name="rating" id="rating1" value="1" class="rate_radio" title="1점">
				<label for="rating1"></label>
				<input type="checkbox" name="rating" id="rating2" value="2" class="rate_radio" title="2점">
				<label for="rating2"></label>
				<input type="checkbox" name="rating" id="rating3" value="3" class="rate_radio" title="3점">
				<label for="rating3"></label>
				<input type="checkbox" name="rating" id="rating4" value="4" class="rate_radio" title="4점">
				<label for="rating4"></label>
				<input type="checkbox" name="rating" id="rating5" value="5" class="rate_radio" title="5점">
				<label for="rating5"></label>
			</div>
		</div>
		
		<!-- 	후기를 남겨주세요 -->
		<div class="review_contents">
			<h3>후기를 남겨주세요.</h3>
			<textarea name="content" id="review_textarea" rows="10" cols="30"></textarea>
		</div>
			
		<p>
			<button type="button" name="rpic1"> 사진 첨부1 </button>
			<button type="button" name="rpic2"> 사진 첨부2 </button>
			<button type="button" name="rpic3"> 사진 첨부3 </button>
		</p>
		
		<div id="Buttons">
			<input type="reset" id="cancel" value="취소">
			<input type="submit" value="작성하기" class="submitButton" id="submit">
		</div>
		
	</form>
	</article>
	
</div>

<style>
	.container{
		max-width: 480px;
		margin: 0 auto;
		background-color: #fff;
		height: 100%;
		padding: 20px;
		box-sizing: border-box;
	}
	
	#reviewForm textarea{
		width: 100%;
		padding: 10px;
		box-sizing: border-box;
	}
	
	.star_rating .rate_radio {
		position: relative;
		display: inline-block;
		z-index: 20;
		opacity: 0.001;
		width: 60px;
		height: 60px;
		background-color: #fff;
		cursor: pointer;
		vertical-align: top;
		display: none;
	}
	
	.star_rating .rate_radio + label {
		position: relative;
		display: inline-block;
		margin-left: -4px;
		z-index: 10;
		width: 60px;
		height: 60px;
		background-image: url('../img/starrate.png');
		background-repeat: no-repeat;
		background-size: 60px 60px;
		cursor: pointer;
		background-color: #f0f0f0;
	}
	
	.star_rating .rate_radio:checked + label {
		background-color: #FCC419;
	}
	
</style>
</body>
</html>