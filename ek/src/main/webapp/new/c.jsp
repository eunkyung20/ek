<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
*{margin: 0;padding: 0;box-sizing: border-box}
body{background-color: #f5f6f7;}
ul>li{list-style: none}
a{text-decoration: none;}
.clearfix::after{content: "";display: block;clear: both;}
#joinForm{width: 500px;margin: 0 auto;}
ul.join_box{border: 1px solid #ddd;background-color: #fff;}
.checkBox,.checkBox>ul{position: relative;}
.checkBox>ul>li{float: left;}
.checkBox>ul>li:first-child{width: 85%;padding: 15px;font-weight: 600;color: #119208;}
.checkBox>ul>li:nth-child(2){position: absolute;top: 50%;right: 30px;margin-top: -12px;}
.checkBox textarea{width: 96%;height: 90px; margin: 0 2%;background-color: #f7f7f7;color: #888; border: none;}
.footBtwrap{margin-top: 15px;}
.footBtwrap>li{float: left;width: 50%;height: 60px;}
.footBtwrap>li>button{display: block; width: 100%;height: 100%; font-size: 18px;text-align: center;line-height: 60px;}
.fpmgBt1{background-color: #fff;color:#888; font-weight: bold;}
.fpmgBt2{background-color: #119208;color: #FFFFFF; font-weight: bold;}
.logo{width: 0;margin: 0 auto;}
</style>
<body>
 <div class="logo">
     <a href="../main/main.jsp.jsp">
     <img src="../img/logo.png" alt="섬집"></a>
 </div>
<form action="" id="joinForm">
  <ul class="join_box">
  	<li class="checkBox check01">
  	
  <ul class="clearfix">
    <li></li>
     <li class="checkAllBtn">
      
   </ul>
   </li>
    <li class="checkBox check02">
        <ul class="clearfix">
     <li>이용약관 동의(필수)</li>     
      <li class="checkBtn">
       <input type="checkbox" name="chk"> 
     </li></ul>
     <textarea name="" id="">여러분을 환영합니다.
섬집 서비스 및 제품(이하 ‘서비스’)을 이용해 주셔서 감사합니다. 
본 약관은 다양한 섬집 서비스의 이용과 관련하여 섬집 서비스를 제공하는 섬집 주식회사(이하 ‘섬집’)와 이를 이용하는 섬집 서비스 회원(이하 ‘회원’) 또는 비회원과의 관계를 설명하며, 아울러 여러분의 섬집 서비스 이용에 도움이 될 수 있는 유익한 정보를 포함하고 있습니다.
여러분을 환영합니다.
섬집는 기본적으로 여러분 모두에게 동일한 내용의 서비스를 제공합니다. 다만, '청소년보호법' 등 관련 법령이나 기타 개별 서비스 제공에서의 특별한 필요에 의해서 연령 또는 일정한 등급을 기준으로 이용자를 구분하여 제공하는 서비스의 내용, 이용 시간, 이용 횟수 등을 다르게 하는 등 일부 이용을 제한하는 경우가 있습니다. 자세한 내용은 역시 각 서비스 상의 안내, 공지사항, 고객센터 도움말 등에서 확인하실 수 있습니다.
섬집 서비스에는 기본적으로 본 약관이 적용됩니다만 섬집가 다양한 서비스를 제공하는 과정에서 부득이 본 약관 외 별도의 약관, 운영정책 등을 적용하는 경우가 있습니다. 
그리고 해당 운영 회사가 정한 고유의 약관, 운영정책 등이 적용될 수 있습니다. 이러한 내용은 각각의 해당 서비스 초기 화면에서 확인해 주시기 바랍니다.
회원으로 가입하시면 섬집 서비스를 보다 편리하게 이용할 수 있습니다.
여러분은 본 약관을 읽고 동의하신 후 회원 가입을 신청하실 수 있으며, 섬집는 이에 대한 승낙을 통해 회원 가입 절차를 완료하고 여러분께 섬집 서비스 이용 계정(이하 ‘계정’)을 부여합니다. 계정이란 회원이 섬집 서비스에 로그인한 이후 이용하는 각종 서비스 이용 이력을 회원 별로 관리하기 위해 설정한 회원 식별 단위를 말합니다. 
회원은 자신의 계정을 통해 좀더 다양한 섬집 서비스를 보다 편리하게 이용할 수 있습니다. 이와 관련한 상세한 내용은 계정 운영정책 및 고객센터 내 섬집 회원가입 방법 등에서 확인해 주세요.
       </textarea>
       </li>
       
       <li class="checkBox check03">
       	<ul class="clearfix">
       	<li>개인정보 수집 및 이용에 대한 안내(필수)</li>
       	<li class="checkBtn">
       	<input type="checkbox" name="chk"></li></ul>
        <textarea name="" id="">여러분을 환영합니다.
섬집 서비스 및 제품(이하 ‘서비스’)을 이용해 주셔서 감사합니다. 본 약관은 다양한 섬집 서비스의 이용과 관련하여 네이버 서비스를 제공하는  섬집 주식회사(이하 ‘섬집’)와 이를 이용하는 섬집 서비스 회원(이하 ‘회원’) 또는 비회원과의 관계를 설명하며, 아울러 여러분의 섬집 서비스 이용에 도움이 될 수 있는 유익한 정보를 포함하고 있습니다.
1. 수집하는 개인정보
이용자는 회원가입을 하지 않아도 정보 검색, 뉴스 보기 등 대부분의 섬집 서비스를 회원과 동일하게 이용할 수 있습니다.
회원가입 시점에 섬집가 이용자로부터 수집하는 개인정보는 아래와 같습니다.
- 회원 가입 시 필수항목으로 아이디, 비밀번호, 이름, 생년월일, 성별, 휴대전화번호, 이메일주소를 수집합니다.
- 섬집 내의 개별 서비스 이용, 이벤트 응모 및 경품 신청 과정에서 해당 서비스의 이용자에 한해 추가 개인정보 수집이 발생할 수 있습니다. 추가로 개인정보를 수집할 경우에는 해당 개인정보 수집 시점에서 이용자에게 ‘수집하는 개인정보 항목, 개인정보의 수집 및 이용목적, 개인정보의 보관기간’에 대해 안내 드리고 동의를 받습니다.
       </textarea>
         </li>
          <li class="checkBox check03">
                    <ul class="clearfix">
                        <li>위치정보 이용약관 동의(선택)</li>
                        <li class="checkBtn">
                            <input type="checkbox" name="chk">
                        </li>
                    </ul>
 
                    <textarea name="" id="">위치기반서비스 이용약관에 동의하시면, 위치를 활용한 광고 정보 수신 등을 포함하는 섬집 위치기반 서비스를 이용할 수 있습니다.
제 1 조 (목적)
이 약관은  섬집 (이하 “회사”)가 제공하는 위치기반서비스와 관련하여 회사와 개인위치정보주체와의 권리, 의무 및 책임사항, 기타 필요한 사항을 규정함을 목적으로 합니다.
제 2 조 (약관 외 준칙)
이 약관에 명시되지 않은 사항은 위치정보의 보호 및 이용 등에 관한 법률, 개인정보보호법, 정보통신망 이용촉진 및 정보보호 등에 관한 법률, 전기통신기본법, 전기통신사업법 등 관계법령과 회사의 이용약관 및 개인정보처리방침, 회사가 별도로 정한 지침 등에 의합니다.
제 3 조 (서비스 내용 및 요금)
① 회사는 위치정보사업자로부터 위치정보를 전달받아 아래와 같은 위치기반서비스를 제공합니다.
1. GeoTagging 서비스: 게시물 또는 이용자가 저장하는 콘텐츠에 포함된 개인위치정보주체 또는 이동성 있는 기기의 위치정보가 게시물과 함께 저장됩니다. 저장된 위치정보는 별도의 활용없이 보관되거나, 또는 장소를 기반으로 콘텐츠를 분류하거나 검색할 수 있는 기능이 제공될 수도 있습니다.
2. 위치정보를 활용한 검색결과 및 콘텐츠 제공 : 정보 검색을 요청하거나 개인위치정보주체 또는 이동성 있는 기기의 위치정보를 제공 시 본 위치정보를 이용한 검색결과, 주변결과(맛집, 주변업체, 교통수단 등), 번역결과를 제시합니다.
3. 이용자 위치를 활용한 광고정보 제공: 검색결과 또는 기타 서비스 이용 과정에서 개인위치정보주체 또는 이동성 있는 기기의 위치를 이용하여 광고소재를 제시합니다.
4. 이용자 보호 및 부정 이용 방지: 개인위치정보주체 또는 이동성 있는 기기의 위치를 이용하여 권한없는 자의 비정상적인 서비스 이용 시도 등을 차단합니다.
5. 길 안내 등 생활편의 서비스 제공: 교통정보와 길 안내 등 최적의 경로를 지도로 제공하며, 주변 시설물 찾기, 뉴스/날씨 등 생활정보, 긴급구조 서비스, 주소 자동 입력 등 다양한 운전 및 생활 편의 서비스를 제공합니다.
       </textarea>
                </li>
         <li class="checkBox check04">
         <ul class="clearfix">
          <li>이벤트 등 프로모션 알림 메일 수신(선택)</li>
           <li class="checkBtn">
           <input type="checkbox" name="chk"></li>
            </ul>
 
                </li>
            </ul>
            <ul class="footBtwrap clearfix">
                <li><button class="fpmgBt1">비동의</button></li>
                <li><button class="fpmgBt2">동의</button></li>
            </ul>
        </form>
</body>
</html>