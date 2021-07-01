<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지 메인</title>


<link href="${pageContext.request.contextPath }/resources/css/memberMain.css" rel="stylesheet" type="text/css">

</head>
<body>
		
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
					<tr><td ><a href="#"><span>주문 내역</span></a></td></tr>
					<tr><td><a href="#"><span>배송지 관리</span></a></td></tr>
					<tr><td><a href="#"><span>상품 후기</span></a></td></tr>
					<tr><td><a href="#"><span>개인정보 수정</span></a></td></tr>
				</table>
			</div>
		</div>
		
		
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/js/javaScript.js"></script>
		
</body>
</html>