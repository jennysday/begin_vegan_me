<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Begin Vegan</title>

<link href="${pageContext.request.contextPath}/resources/css/main.css"
	rel="stylesheet" type="text/css">

</head>
<body>


	<jsp:include page="/main/header.jsp" />



	<section>
		<div class="all_wrap">
			<div class="wrapper">
	
				<div class="carousel">
					<div class="inner">
						<div class="slide active">
						</div>
						<div class="slide">
						</div>
						<div class="slide">
						</div>
					</div>
					<div class="arrow arrow-left"></div>
					<div class="arrow arrow-right"></div>
				</div>
				
			</div>
			
			<div class="txt_wrap">
				<div class="txt_box">
					<div class="txt_box_event">
					<h3>GENUINE BOTANICAL</h3>
					
					<p>
					비긴비건은 자연에서 얻은 신선한 재료와  <br>
					정직한 재료를 사용하여 지구와 동물, <br>
					그리고 사람을 위한 먹거리를 찾습니다. <br>
					</p>
					<hr>
					<p>
					비긴비건은 천연 중의 천연입니다. <br>
					건강한 채소들로 다양한 맛을 선사하며 <br>
					동물과 환경을 생각한 친환경 기업입니다 <br>
					</p>
				</div>
			</div>
			</div>
			
			<div class="event_bg"></div>
		</div>	
		
		

	</section>
	
	<article>
		<div class="food_wrap">
			<div class="food_sell">
				<div class="food_txt">
					<h3>THE REST IS HERE</h3>
					<p>
						내 몸에 들어가는거니까요  <br>
						내 손으로 직접 공수하고, 내 손으로 레시피를 써서 정성으로 만듭니다.<br>
						참 깨끗한 동시에 건강한 먹거리 비긴비건입니다.
					</p>		
				</div>
				
				<ul>
					<li>
						<a>
							<img alt="" src="/board/resources/image/food4.jpg">
						</a>
							<p class="product_info">오렌지주스</p>
							<p class="product_info">2,000</p>
					</li>
					<li class="long">
						<a>
						    <img alt="" src="/board/resources/image/food3.jpg">
						</a>
						<p class="product_info">오렌지주스</p>
						<p class="product_info">2,000</p>
					</li>
					<li>
						<a>
							<img alt="" src="/board/resources/image/food2.jpg">
						</a>
						<p class="product_info">오렌지주스</p>
						<p class="product_info">2,000</p>
					</li>
				</ul>
				
				
			</div>
		</div>
	</article>


	<article id="business">
		<div class="area">
			<!-- 가로980, 수평50padding, 문서가운데 위치 -->
			<h3 class="sub_tit">OUR BUSINESS</h3>
			<div class="fade">
				<div class="txt_down">
					<h4>
						HEALTHY<br>EARTH
					</h4>
					<strong>건강한 채식<br>비긴비건
					</strong>
					<p>
						건강한 식습관으로 나와 지구의 건강 모두 지켜주세요. <br>다채로운 채식 음식을 통해 건강한 삶 만들기
						프로젝트 <br>너와 나의 연결고리 비긴비건과 함께 하세요.
					</p>
				</div>
				<img class="img_up" src="/board/resources/image/article1.jpg" alt="">
			</div>
		</div>
		<div class="btm">
		
			<div class="area fade">
				<div class="txt_down txt_r">
					<h4>
						VEGETARIAN<br>PROJECT
					</h4>
					<strong>건강 중심의 <br>채식 프로젝트
					</strong>
					<p>
						비긴비건은 채식의, 채식에 의한, <br>채식을 위한 온라인 쇼핑몰이자 <br>온라인
						채식 홍보 메거진입니다. <br>지구와 동물 그리고 나를 위해
						<br>비긴비건과 함께 해요<br>
		
					</p>
				</div>
				<img src="/board/resources/image/article3.jpg" alt="" class="img_up">
			</div>
		</div>
	</article>

	<article id="promotion1">
		
		<div class="area fade">
			<div class="txt_down">
				<h4>
					ANOUNCE<br>GOOD FOOD
				</h4>
				<strong>좋은 먹거리를 알리다</strong> <br>
				<p>
					당연하게 거치는 시장 조사, 주요 고객층 선정, <br>포지셔닝, 제조 원가 효율화 등의 <br>과정도
					없이 무식하고 용감하게 말입니다.
			</div>
		</div>
	</article>







	<jsp:include page="/main/footer.jsp" />

	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/js/jquery-1.12.3.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/js/javaScript.js"></script>

</body>
</html>