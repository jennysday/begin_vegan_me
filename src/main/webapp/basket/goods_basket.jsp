<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!-- JSTL 사용 -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<title>쇼핑몰</title>

<link href="${pageContext.request.contextPath}/resources/css/main.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/resources/css/basket.css" rel="stylesheet" type="text/css">

</head>
<body>

	<jsp:include page="/main/header.jsp" />
	
<div class="basket_border"></div>	
<div class="basket_wrap">
	<table width="50%" align="center">
		<tr>
			<td colspan=2>
				<!-- 장바구니 -->
				<p align="center">
				<form action="./OrderStart.or" name="basketform" method="post">
					<input type="hidden" name="order" value="basket">
					<table width="100%" class="basket_table1">
						<tr align="center">
							<td>
							<c:if test='${member.id == "admin"}'>
								<span>전체 회원 장바구니 목록</span>
							</c:if>
							<c:if test='${member.id != "admin"}'>
								<span>${member.name}님 장바구니</span>
							</c:if>
							</td>
						</tr>
					</table>

					<table width="100%" cellpadding="0" cellspacing="0">
						<tr height=26 bgcolor="213421">
							<td height="3" colspan="7" align=right></td>
						</tr>
						<tr align="center" height="45px">
							<c:if test='${member.id == "admin"}'>
								<td width="10%" class="under__line">아이디</td>
							</c:if>
							<td width="15%" class="under__line">사진</td>
							<td width="25%" class="under__line">제품명</td>
							<td width="30%" class="under__line">수량</td>
							<td width="10%" class="under__line">주문금액</td>
							<c:if test='${member.id != "admin"}'>
								<td width="10%" class="under__line">취소</td>
							</c:if>
						</tr>


						<c:if test="${fn:length(basketList) == 0}">
							<tr>
								<td colspan="7" align="center">장바구니에
										담긴 상품이 없습니다.</td>
							</tr>
						</c:if>

						<c:if test="${fn:length(basketList) != 0}">
							<c:set var="sum_money" value="0" />
							<c:forEach var="basket" items="${basketList}">
								
								<c:set var="sum_money"
									value="${sum_money+ (basket.price * basket.amount)}" />
								<!-- \${basket.필드}은 BasketVO의 필드값이랑 똑같아야 한다 -->
								
								<tr align="center" class="basket_foreach">
									<c:if test='${member.id == "admin"}'>
										<td>${basket.memberId}</td>
									</c:if>
									<td><img
											src="/board/resources/image/${basket.image}" width=50
											height=50></td>
									<td>${basket.goodsName}</td>
									<td>
										<div class="btn_box">
											<c:if test='${member.id != "admin"}'>
												<input type="button" value="-"
												onClick='minusClick("${basket.goodsSeq}", ${basket.price})' /> 
												<span id="am__${basket.goodsSeq}">${basket.amount}</span> <!-- ${basket.goodsSeq}는 자바스크립트에서 문자열과 합쳐 고유 아이디로 사용하기 위해 숫자형을 문자열로 변환시키기 위해 큰따옴표로 감싸준다 -->
												<input type="button" value="+"
												onClick='plusClick("${basket.goodsSeq}",${basket.goodsAmount}, ${basket.price})' /> <!-- plusClick에서 goodsAmount를 매개변수로 받는 이유 : 최대 수량 이상으로 수량을 선택하지 못하게 막기 위함 -->
											</c:if> 
											
											<c:if test='${member.id == "admin"}'>
											<input type="hidden" value="-"
												onClick='minusClick("${basket.goodsSeq}", ${basket.price})' />
											<span id="am__${basket.goodsSeq}">${basket.amount}</span>
											<input type="hidden" value="+"
												onClick='plusClick("${basket.goodsSeq}",${basket.goodsAmount}, ${basket.price})' />
											</c:if>
										</div>
									</td>
									
									<td><span id="pr__${basket.goodsSeq}">${basket.price * basket.amount}</span></td>
									
									<c:if test='${member.id != "admin"}'>
									<td> <a
											href="deleteBasket.do?goodsSeq=${basket.goodsSeq}"
											onclick="return confirm('삭제하시겠습니까?')">
											
											<svg xmlns="http://www.w3.org/2000/svg" height="18px" viewBox="0 0 24 24" width="18px" fill="#213421"><path d="M0 0h24v24H0V0z" fill="none"/><path d="M19 6.41L17.59 5 12 10.59 6.41 5 5 6.41 10.59 12 5 17.59 6.41 19 12 13.41 17.59 19 19 17.59 13.41 12 19 6.41z"/></svg>
											</a>
									</td>
									</c:if>
								</tr>

							</c:forEach>
						</c:if>
					</table>

					<table width="100%" border="0" cellspacing="0" cellpadding="0" >
						<tr>
							<td height="2" bgcolor="213421"></td>
						</tr>

						<tr>
							<td height="30">
								<%-- <div align="right">총 주문금액 : <span id="sum__money">${sum_money}</span>원</div> --%>
								<div align="right" class="sum_money">
									총 주문금액 : <span id="sum__money"><fmt:formatNumber
											value="${sum_money}" pattern="#,###" /> </span>원
								</div>
							</td>
						</tr>
					</table>
					<br>

					<table width="100%" cellpadding="0" cellspacing="0">
						<tr>
							<td align="center">
								<c:if test="${fn:length(basketList) != 0}">
									<a href="javascript:basketform.submit()" class="buy_btn"> 구매하기 </a> <!-- form 태그 대신 a태그를 이용하여 submit 하는 방법 -->
								</c:if>
							</td>
						</tr>
					</table>
				</form> <!-- 장바구니 -->
			</td>
		</tr>
	</table>
</div>
	<jsp:include page="/main/footer.jsp" />
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/js/javaScript.js"></script>



	<script>
	
	
		//수량감소
		function minusClick(goodsSeq, price){
			var qs = document.querySelector("#am__"+goodsSeq);  /* goodsSeq는 문자열과 합쳐 고유 아이디를 만들기 위해 넣음 */
			var currentAmount = Number(qs.innerHTML); //qs에 있는 값을 숫자로 형변환 해줌
			if(currentAmount <= 1){ //수량이 1보다 적을 경우
				qs.innerHTML = 1; //수량에 1을 대입하여 1보다 더 작은수로 갈 수 없도록 제어해줌
				alert('1개 이상 선택해주세요.'); //alert창을 통해 1개 이상 선택해야한다는 것을 알려줌
			}else{
				updateAmount(qs, Number(goodsSeq), currentAmount - 1, price * -1);
			}
		}
	
		
		//수량증가
		function plusClick(goodsSeq, goodsAmount, price){//goodsAmount : 상품 재고 //상품 재고까지만 수량을 올릴 수 있게 제어해주어야 함
			var qs = document.querySelector("#am__"+goodsSeq);//셀렉터지정
			var currentAmount = Number(qs.innerHTML);//문자 -> 숫자
			if(currentAmount >= goodsAmount){//재고 수량 초과시 
				qs.innerHTML = goodsAmount //재고 수량 초과시 최대수량으로 셋팅
				alert('구매가능한 최대수량은 [ '+ goodsAmount + ' ] 입니다'); 
			}else{//재고 수량을 초과하지 않을 경우
				updateAmount(qs, Number(goodsSeq), currentAmount + 1, price);
			}
		}
		
		//세자리 콤마
		function numberWithCommas(x) {
		    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
		}
	
		//비동기 연동 (ajax)
		function updateAmount(qs, goodsSeq, amount, price){
			
			var reqData = {};//객체
			reqData.goodsSeq = goodsSeq;//필드값 정의 //상품고유값(goodsSeq) 대입
			reqData.amount = amount; //상품 수량 대입
			
			$.ajax({
				url:'/board/updateBasket.do',
				type:'post',
				contentType:'application/json;charset=UTF-8', //클라이언트 -> 서버 로 보낼 데이터 형식
				dataType:'json',//서버 -> 클라이언트 전달 받는 형식
				data:JSON.stringify(reqData),//()안에 있는 값을 서버로 전송  -- 필드를 대입하며 대입했던 상품seq와 상품 수량을 서버로 전송
				success:function(data){
					if(data.OK){//로그인 하여 정상 작동 할 경우
						qs.innerHTML = amount; //수량에 amount 값 대입 
						var mqs = document.querySelector('#sum__money'); //합계를 변수에 담아줌
						mqs.innerHTML = numberWithCommas(Number(mqs.innerHTML.replaceAll(",","")) + price);
		
						var pri = document.querySelector('#pr__' + goodsSeq);//각각 합계
						//console.log(pri)
						pri.innerHTML = numberWithCommas(Number(pri.innerHTML.replaceAll(",","")) + price);
						
						//콤마를 풀어서 가격이랑 더해준 뒤 세자리 콤마 함수를 이용하여 세자리 콤마를 다시 찍어줌
					}else{//로그인을 안했을 경우 로그인 화면으로 이동
						alert('로그인하세요');
						location.href="/board";
					}

				}
			});
		}
		
	</script>


</body>
</html>
