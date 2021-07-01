<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지 회원 정보 수정</title>

<link href="${pageContext.request.contextPath}/resources/css/main.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/resources/css/memberUpdate.css" rel="stylesheet" type="text/css">


</head>
<script type="text/javascript">
function updatePw(){
	var pw = document.getElementById('pw');
	var pwCheck = document.getElementById('pwCheck');
	if(pw != pwCheck){
		alert('비밀번호를 제대로 입력하세요.');
		return false;
	}
	return true;
}

function memberOut(){
	var url = './memberOut.jsp';
	location.href = url;
}
</script>
<body>

	<jsp:include page="/main/header.jsp" />
	
	<div id="member_all_wrap">
		<div id="together">
				<ul>
					<li>
						<div id="first">
							<p> 저희 쇼핑몰을 이용해주셔서 감사합니다. </p>
							<p>${member.name}님은 [씨앗]등급이십니다.</p>
					</div>
				</li>
				<li>
					<div id="second">
						<p>가용 적립금 : </p>
						<p>사용 적립금 : </p>
						<p>쿠폰 : </p>
					</div>
				</li>
				<li>
					<div id="third">
						<p>총 적립금 : </p>
						<p>총 주문금액 : </p>
					</div>
				</li>
			</ul>
		</div>
	
	<div id="category_wrap">
		<div id="category">
			<b>마이페이지</b>
			<table>
				<tr><td ><a href="/board/orderList.do"><span>주문 내역</span></a></td></tr>
				<tr><td><a href="#"><span>상품 후기</span></a></td></tr>
				<tr><td><a href="/board/myPage/memberPage.jsp"><span>개인정보 수정</span></a></td></tr>
				<tr><td><a href="#"><span>문의하기</span></a></td></tr>
			</table>
		</div>
	
	
	<div id="title">
		<h3>개인정보 수정</h3>
		<div class="under_line"></div>
		<form action="../updateMember.me" method="post" onsubmit="return updatePw()">
			<table id="update_form" width="100%" cellpadding="0" cellspacing="0">
				<tr>
					<td class="category"><p>아이디</p></td>
					<td class="content"><input type="text" name="id" class="input_style" value="${member.id }" ></td>
				</tr>
				<tr> 
					<td class="category"><p>현재 비밀번호</p></td>
					<td class="content"><input type="password" class="input_style" name="beforepw" ></td>
				</tr>
				<tr>
					<td class="category"><p>새 비밀번호</p></td>
					<td class="content"><input type="password" class="input_style" name="pw" ></td>
				</tr>
				<tr>
					<td class="category"><p>새 비밀번호 확인</p></td>
					<td class="content"><input type="password" class="input_style" name="pwCheck" ></td>
				</tr>
				<tr>
					<td class="category"><p>이름</p></td>
					<td class="content"><input type="text" class="input_style" name="name" value="${member.name }" ></td>
				</tr>
				<tr>
					<td class="category"><p>이메일</p></td>
					<td class="content"><input type="text" class="input_style" name="email" value="${member.email1 }@${member.email2 }" ></td>
				</tr>
				<tr>
					<td class="categoryLast"><p>휴대폰</p></td>
					<td class="contentLast"><input type="text"  class="input_style" name="phone" value="${member.phone }" ></td>
				</tr>
			</table>
			<table id="update_form2">
				<tr class="submit">
						<td><div class="thin_line"></div></td>
				</tr>
				<tr id="button_wrap" align="center">
					<td ><input type="submit" value="개인정보 수정" class="chk_btn"></td>
					<td><input type="button" value="취소"  class="chk_btn" onclick="cancel()"></td>
					<td ><input type="button" value="탈퇴하기" class="chk_btn" onclick="memberOut()"></td>
				</tr>
			</table>
		</form>
	</div>
</div>
	
	<jsp:include page="/main/footer.jsp" />


	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/js/javaScript.js"></script>


</body>
</html>