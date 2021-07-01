<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<!-- JSTL 사용 -->
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
	
<!DOCTYPE html>
<html>
<head>
<title>쇼핑몰</title>

<link href="${pageContext.request.contextPath}/resources/css/main.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/resources/css/memberGoodsOrder.css" rel="stylesheet" type="text/css">

</head>
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
		
	
		<div id="order_wrap">
			<div class="member_name">
				<c:if test='${member.id == "admin"}'>
					<h3>${member.name} 페이지 주문 관리</h3>
				</c:if>
				<c:if test='${member.id != "admin"}'>
				<h3>${member.name}님께서 주문하신 내역은 ${fn:length(orderList)}개 입니다.</h3>
				</c:if>
			</div>
			<div class="under_line"></div>
				<table width="85%" align="center" id="member_table" cellpadding="0" cellspacing="0">
					<tr height=26 bgcolor=243421 >
							<td height="3" colspan="8" align=right></td>
					</tr>
					<tr align="center" height="45px">
						<c:if test='${member.id == "admin"}'>
							<td width="7%" class="under__line" >아이디</td>
						</c:if>
						<td width="15%" class="under__line">주문 번호</td>
						<td width="10%" class="under__line">상품명</td>
						<td width="15%" class="under__line">상품이미지</td>
						<td width="5%" class="under__line">수량</td>
						<td width="15%" class="under__line">상품 금액</td>
						<td width="17%" class="under__line">주문 상태</td>
						<td width="15%" class="under__line">주문 날짜</td>
					</tr>
					
					<c:if test="${fn:length(orderList) == 0}">
						<td align=center colspan=6>주문 내역이 없습니다.</td>
					</c:if>
					
					<c:if test="${fn:length(orderList) != 0}">
						<c:set var="sum_money" value="0" />
						<c:forEach var="order" items="${orderList}">
							<c:set var="sum_money" value="${sum_money+ order.order_goods_price * order.order_goods_count}"/>
							<!-- \${basket.필드}은 BasketVO의 필드값이랑 똑같아야 한다 -->
							<tr align=center class="order_foreach">
								<c:if test='${member.id == "admin"}'>
									<td>${order.order_member_id}</td>
								</c:if>
								
								<td height="20">${order.order_tradenum}</td>
								<td height="20">${order.order_goods_name}</td>
								<td><img
										src="/board/resources/image/${order.order_goods_image}" width=50 height=50>
								</td>
								<td>${order.order_goods_count}</td>
								 <td><fmt:formatNumber value="${order.order_goods_price * order.order_goods_count}" pattern="#,###" /><td>
								
								<div>
									<div id="order__text__${order.order_tradenum}">
									
									<c:choose>
										 <c:when test="${order.order_status eq 0}">대기중</c:when>
										 <c:when test="${order.order_status eq 1}">발송준비</c:when>
										 <c:when test="${order.order_status eq 2}">발송완료</c:when>
										 <c:when test="${order.order_status eq 3}">배송중</c:when>
										 <c:when test="${order.order_status eq 4}">배송완료</c:when>
										 <c:when test="${order.order_status eq 5}">주문취소</c:when>
									</c:choose>
									
									</div>
									
									<c:if test='${member.id == "admin"}'>
									<div>
										<select class="select_btn">
										    <option value="0">대기중</option>
										    <option value="1">발송준비</option>
										    <option value="2">발송완료</option>
										    <option value="3">배송중</option>
										    <option value="4">배송완료</option>
										    <option value="5">주문취소</option>
										</select>
										<button class="change__status" data-tradenum="${order.order_tradenum}">변경</button>
										<!-- data-tradenum="${order.order_tradenum} : 선택한 요소를 가져오기 위해 임의로 만든 속성 -->
									</div>
									</c:if>
								</div>
								<td>${order.order_date}</td>
							</tr>
							
						</c:forEach>
					</c:if>
				</table>
				<table width="85%" border="0" cellspacing="0" cellpadding="0"align="center" >
					<tr>
						<td height="2" bgcolor="213421"></td>
					</tr>
					<tr>
						<td height="30px" colspan="8">
						<div align="right" class="sum_money" >총 주문금액 : ${sum_money}원</div>
						</td>
					</tr>
			</table>
			
			<c:if test='${member.id == "admin"}'>
				<table id="admin_btn">
					<tr><td><a href="#">관리자 페이지</a></td></tr>
				</table>
			</c:if>
		</div>
	</div>
</div>


<jsp:include page="/main/footer.jsp" />


	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/js/javaScript.js"></script>
	
	<script type="text/javascript">
	
	$('.change__status').on('click',function(e){
		e.stopPropagation(); //stopPropagation 은 부모태그로의 이벤트 전파를 stop 중지하라는 의미
        e.preventDefault(); //preventDefault 는 a 태그 처럼 클릭 이벤트 외에 별도의 브라우저 행동을 막기 위해 사용
        
		var tradeNum = $(this).attr("data-tradenum");//선택한 요소의 속성의 값을 가져옴
		var orderStatus = $(this).parent().children(0).val(); //선택한 요소의 부모의 첫번째 자식의 값 (옵션 선택 값) 
		
		var reqData = {}; //객체 생성
		reqData.order_tradenum = tradeNum; 
		reqData.order_status = orderStatus; 
		
		$.ajax({
			url:'/board/updateOrderStatus.do',
			type:'post',
			contentType:'application/json;charset=UTF-8', //클라이언트 -> 서버 로 보낼 데이터 형식
			dataType:'json',//서버 -> 클라이언트 전달 받는 형식
			data:JSON.stringify(reqData),//()안에 있는 값을 서버로 전송
			success:function(data){
				if(data.OK){
					//alert("변경완료");
					var text;
					if(orderStatus==0){
						text = "대기중";
					}else if(orderStatus==1){
						text = "발송준비";
					}else if(orderStatus==2){
						text = "발송완료";
					}else if(orderStatus==3){
						text = "배송중";
					}else if(orderStatus==4){
						text = "배송완료";
					}else if(orderStatus==5){
						text = "주문취소";
					}					
					document.querySelector("#order__text__"+tradeNum).innerHTML = text;
				}
			}
		});
	});

	</script>


</body>
</html>
