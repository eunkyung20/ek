<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="../script/jquery-3.6.3.js"></script>
 <script type="text/javascript">
 
 	$(document).ready(function(){
 	 		
	$('#join').submit(function(){
	if($('.id').val()==""){
		alert("아이디를 입력하세요.");
		$('.id').focus();
		return false;
	}
	
	// class="pass"
	if($('.pass').val()==""){
		alert("비밀번호를 입력하세요.");
		$('.pass').focus();
		return false;
	}
	
	// class="pass2"
	if($('.pass2').val()==""){
		alert("비밀번호를 입력하세요.");
		$('.pass2').focus();
		return false;
	}
	
	if($('.pass').val() != $('.pass2').val()){
		alert("비밀번호가 일치하지 않습니다.");
		$('.pass2').focus();
		return false;
	}
	
	if ( ! (document.joinform.pass.value.length >= 8 && document.joinform.pass.value.length <= 16)) {
			alert("비밀번호 8 ~ 16자 사이로 입력해주세요");
			document.joinform.pass.focus();
			return false;
		}
	
	// class="name"
	if($('.name').val()==""){
		alert("이름을 입력하세요.");
		$('.name').focus();
		return false;
	}
	
	// class="birth"
	if($('.birth').val()==""){
		alert("생년월일을 입력하세요.");
		$('.birth').focus();
		return false;
	}
	
	// class="email"
	if($('.email').val()==""){
		alert("이메일을 입력하세요.");
		$('.email').focus();
		return false;
	}
	
	// class="tel"
	if($('.tel').val()==""){
		alert("전화번호를 입력하세요.");
		$('.tel').focus();
		return false;
	}
	
	// class="address"
	if($('.address').val()==""){
		alert("주소를 입력하세요.");
		$('.address').focus();
		return false;
	}

		}); //
	
	// class="dup" 클릭했을때
	$('.dup').click(function(){
//		alert("클릭");
		if($('.id').val()==""){
			alert("아이디 입력하세요");
			$('.id').focus();
			return false;
		}
		
	// idCheck.jsp
	$.ajax({
		url:'idCheck.jsp',
		data:{'id':$('.id').val()},
		success:function(result){
			if(result.trim()=="중복확인"){
				$('.divresult').html(result).css("color","red");	
			}else{
				$('.divresult').html(result).css("color","blue");	
			}			
		}
	});
	}); 
		
 }); //준비
 </script>
 <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    function sample4_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {

                var roadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 참고 항목 변수

                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }

                document.getElementById('sample4_postcode').value = data.zonecode;
                document.getElementById("sample4_roadAddress").value = roadAddr;
                document.getElementById("sample4_jibunAddress").value = data.jibunAddress;

                if(roadAddr !== ''){
                    document.getElementById("sample4_extraAddress").value = extraRoadAddr;
                } else {
                    document.getElementById("sample4_extraAddress").value = '';
                }

                var guideTextBox = document.getElementById("guide");

                if(data.autoRoadAddress) {
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                    guideTextBox.style.display = 'block';

                }  else {
                    guideTextBox.innerHTML = '';
                    guideTextBox.style.display = 'none';
                }
            }
        }).open();
    }
</script>
</head>
<body>
	<article>
		<form action="joinPro.jsp" name="joinform" id="join" method="post">
			<fieldset>
				<legend>회원가입</legend>
				회원유형
				<input type="radio" name="ra" value="1" checked>일반회원
		  		<input type="radio" name="ra" value="2">사장님<br>
				<label>아이디</label> <input type="text" name="id" class="id">
				<input type="button" value="중복확인" class="dup"><br>
				<label></label>
				<div class="divresult"> </div><br> 
				<label>비밀번호</label> 
				<input type="password" name="pass" class="pass"><br> 
				<label>비밀번호 재확인</label> 
				<input type="password" name="pass2" class="pass2"><br> 
				<label>이름</label>
				<input type="text" name="uname" class="name"><br> 
				성별
				<select name="gender">
					<option value="남">남</option>
					<option value="여">여</option>
					<option value="선택안함">선택안함</option>
				</select><br>
				<label>생년월일</label>
				<input type="date" name="birth" class="birth"><br>
				<label>이메일</label>
				<input type="email" name="email" class="email"><br>
				<label>전화번호</label> 
				<input type="text" name="tel" class="tel"><br>
				<label>주소</label>
				<input type="text" id="sample4_postcode" class="address" placeholder="우편번호">
				<input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
				<input type="text" id="sample4_roadAddress" placeholder="도로명주소">
				//<input type="text" id="sample4_jibunAddress" placeholder="지번주소">
				<span id="guide" style="color:#999;display:none"></span><br>
				<input type="text" id="sample4_detailAddress" placeholder="상세주소">
			</fieldset>
			<div class="clear"></div>
			<div id="buttons">
				<input type="submit" value="가입하기" class="submit" onclick="fun1()"> 
				<input type="reset" value="초기화하기" class="cancel">
			</div>
		</form>
	</article>
</body>
</html>