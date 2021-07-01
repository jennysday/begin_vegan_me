<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<a href="/board/login.do?seq=2">로그인</a> 
	<a href="/board/addBasket.do?goodsSeq=31&amount=1">장바구니 추가</a> 
	<a href="/board/basketList.do">장바구니 목록</a>
	 
	<a href="/board/orderList.do">결제내역 목록</a> 
<!--  	
	로그인
	seq: 회원seq
	http://127.0.0.1:8090/board/login.do?seq=2
	
	장바구니리스트(로그인필요)
	http://127.0.0.1:8090/board/bascketList.do
	
	장바구니추가(로그인필요)
	goodsSeq: 상품seq
	amount: 상품수량
	http://127.0.0.1:8090/board/addBasket.do?goodsSeq=30&amount=10
	
	삭제(로그인필요)
	goodsSeq: 상품seq
	http://127.0.0.1:8090/board/deleteBasket.do?goodsSeq=30
-->	
</body>
</html>