<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>

<link href="${pageContext.request.contextPath}/resources/css/main.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/resources/css/memberPage.css" rel="stylesheet" type="text/css">

</head>
<script type="text/javascript">
function 
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
	
	
	
		<div id="content">
			<h3>개인정보 수정</h3>
			<p class="pw_chk">비밀번호 재확인</p>
			<p class="inform_p"> 회원님의 정보를 안전하게 보호하기 위해 비밀번호를 다시 한번 확인해주세요.</p>
			<div class="bold_line"></div>
			<form action="/board/myPage/memberUpdate.jsp">
				<table id="form_table">
					<tr class="tr_height">
						<td><p>아이디</p></td>
						<td><input type="text" class="input_style" name="id" value="${member.id }"></td>
					</tr>
					<tr class="tr_height">
						<td><p>비밀번호</p></td>
						<td><input type="password" class="input_style" name="pw"></td>
					</tr>
				</table>
				<table id="form_table2">
					<tr class="submit">
						<td><div class="thin_line"></div></td>
					</tr>
					<tr  class="submit">	
						<td><input type="submit" value="확인" id="chk_btn"></td>
					</tr>	
				</table>
			</form>
		</div>
	</div>
	</div>
	
	<jsp:include page="/main/footer.jsp" />


	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/js/javaScript.js"></script>

</body>
</html>