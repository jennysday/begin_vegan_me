package com.vegan.user.basket.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.vegan.user.basket.service.OrderService;
import com.vegan.user.vo.MemberVO;
import com.vegan.user.vo.OrderBoardVO;

//@SessionAttributes("키값") <- model에서 addAttribute할때 키값을 해당 키값으로 하게되면 추가로 session에도 추가되어진다. 
//model.addAttribute("키값",값);
//모델에 저장된 값을 세션에 저장한다는 의미

/*
로그인
seq: 회원seq
http://127.0.0.1:8090/hello/login.do?seq=2

장바구니리스트(로그인필요)
http://127.0.0.1:8090/hello/bascketList.do

장바구니추가(로그인필요)
goodsSeq: 상품seq
amount: 상품수량
http://127.0.0.1:8090/hello/addBasket.do?goodsSeq=30&amount=10

삭제(로그인필요)
goodsSeq: 상품seq
http://127.0.0.1:8090/hello/deleteBasket.do?goodsSeq=30
*/

@Controller
public class OrderController {

	@Autowired
	OrderService orderService;

	////http://127.0.0.1:8090/hello/basketList.do
	@RequestMapping("/orderList.do")
	public String getOrderList(HttpSession session, Model model) {

		// session에서 로그인 사용자추출
		MemberVO memberVO = (MemberVO) session.getAttribute("member");

		if (memberVO == null)
			return "not_login.jsp";

		// 로그인 사용자의 장바구니 리스트 가져오기.
		List<OrderBoardVO> orderList = orderService.getOrderList(memberVO);
		// JSP에서 장바구니 리스트 사용을 위해 model에 등록.
		model.addAttribute("orderList", orderList);
		model.addAttribute("member", memberVO);

		return "myPage/goods_my_order.jsp";
	}
	
	
	@ResponseBody
	@RequestMapping("/updateOrderStatus.do")
	public Map<String, Object> updateOrderStatus(HttpSession session, @RequestBody OrderBoardVO orderBoardVO) {

		Map<String, Object> respData = new HashMap<>();

		// @RequestBody: JSON -> JAVA VO 바꾸겠다 
		// @ResponseBody: JAVA VO -> JSON
		MemberVO memberVO = (MemberVO) session.getAttribute("member");

		if (memberVO == null || !memberVO.getId().equals("admin")) {
			respData.put("OK", false);
		} else {
			
			orderService.updateOrderStatus(orderBoardVO);

			respData.put("OK", true);

		}
		return respData;
	}
	
	

}
