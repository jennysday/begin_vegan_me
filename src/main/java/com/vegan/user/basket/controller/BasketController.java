package com.vegan.user.basket.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.vegan.user.basket.service.BasketService;
import com.vegan.user.vo.BasketVO;
import com.vegan.user.vo.MemberVO;

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
public class BasketController {

	@Autowired
	BasketService basketService;

	//// http://127.0.0.1:8090/board/basketList.do
	@RequestMapping("/basketList.do")
	public String getBasketList(HttpSession session, Model model) {

		// session에서 로그인 사용자추출
		MemberVO memberVO = (MemberVO) session.getAttribute("member");
		// session.getAttribute()의 반환형은 오브젝트이기 때문에 해당 자료형으로 강제형변환 하여 형변환 자료형의 참조변수에 저장함

		// memberVO에 값이 안담긴다면 (로그인을 하지 않은 사용자라면)
		if (memberVO == null)
			return "not_login.jsp"; // return을 이용하여 not_login.jsp로 이동

		// 로그인 사용자의 장바구니 리스트 가져오기.
		List<BasketVO> basketList = basketService.getBasketList(memberVO);
		// 해당 회원의 정보가 담긴 memberVO를 매개변수로 전달하여 셀렉트를 통해 장바구니 리스트를 담은 자료형을 리스트형태로 담아줌

		// JSP에서 장바구니 리스트를 출력해주기 위해 model에 등록.
		// 모델에 등록을 해주면 "basketList"의 해당 이름으로 ${basketList.goodsSeq}이런식으로 자바빈의 필드값과
		// jstl안에 들어간 파라메타의 이름을 같게 만들어주면 자바빈의 이름을 읽어 jsp에서 출력해줌
		model.addAttribute("basketList", basketList);
		model.addAttribute("member", memberVO);

		return "basket/goods_basket.jsp";
	}

	// http://127.0.0.1:8090/board/deleteBasket.do?goodsSeq=${basket.goodsSeq}
	// jsp에서 a태그로 이런식으로 보냄 href="deleteBasket.do?goodsSeq=${basket.goodsSeq}
	// 핸들러매핑을 통해 deleteBasket.do에서 걸리고
	// goodsSeq=${basket.goodsSeq}값을 받아 basketVO에 저장함
	@RequestMapping("/deleteBasket.do")
	public String deleteBasket(HttpSession session, BasketVO basketVO) {
		// BasketVO에는 상품디비가 같이 있고 session에는 멤버 디비가 있다
		// 어떤 사람의 어떤 상품을 지울지 구현하기
		MemberVO memberVO = (MemberVO) session.getAttribute("member");

		if (memberVO == null)
			return "not_login.jsp";

		basketVO.setMemberSeq(memberVO.getSeq());
		//memberVO에서 게터메서드로 seq값을 읽어와 세터메서드를 통해 memberVO의 seq값을 basketVO의 memberSeq의 담아준다.

		basketService.deleteBasket(basketVO);
		// basketVO에는 jsp의 파라메타값으로 받은 goodsSeq와 
		// session.getAttribute로 받은 MemberSeq의 값이 들어있음
		// 그렇기 때문에 마이바티스에 WHERE GOODS_SEQ = #{goodsSeq} AND MEMBER_SEQ = #{memberSeq}
		// #{goodsSeq}, #{memberSeq}의 값으로 비교문을 작성할 수 있다

		return "redirect:/basketList.do";
	}

	//브라우저는 클라이언트가 폼 양식에서 작성한값을 쿼리스트링으로 만들어 주어 submit을 보낸다
	// http://127.0.0.1:8090/board/addBasket.do?goodsSeq=30&amount=10
	// 파라메타 값으로 goodsSeq와 amount값을 전달해주고 있기 때문에
	// basketVO에는 goodsSeq, amount이 이미 저장된 상태로 컨트롤러에 들어온다
	// 그 후 세션에서 memberVO의 값을 가져와 memberSeq의 값을 가져와 basketVO 저장한다
	// 그래서 basketVO에는 goodsSeq, amount, memberSeq의 값이 저장된다
	// 어떤 사람이 어떤 상품을 몇개 넣었는지 구현하는 것이 장바구니!
	
	/*
	 * url: /addBasket.do
		type: POST
		contentType: application/x-www-form-urlencoded;charset=UTF-8
		파라미터
		goodsSeq = 10 상품시퀀스(int)
		amount = 2 수량(int)
	 * 
	 * */
	
	
	@RequestMapping("/addBasket.do")
	public String addBasket(HttpSession session, BasketVO basketVO) {
		// http://127.0.0.1:8090/board/addBasket.do?goodsSeq=30&amount=10
		// basketVO에는 goodsSeq, amount이 이미 저장된 상태로 컨트롤러에 들어온다
		
		// BasketVO에는 상품디비가 같이 있고 session에는 멤버 디비가 있다
		// 어떤 사람의 어떤 상품을 지울지 구현하기
		MemberVO memberVO = (MemberVO) session.getAttribute("member");

		if (memberVO == null)
			return "not_login.jsp";

		basketVO.setMemberSeq(memberVO.getSeq());
		basketService.addBasket(basketVO);
		//basketVO에는 goodsSeq, amount, memberSeq의 값이 들어있다.

		return "redirect:/basketList.do";
	}

	@ResponseBody
	@RequestMapping(value = "/updateBasket.do")
	public Map<String, Object> updateBasket(HttpSession session, @RequestBody BasketVO basketVO) {

		Map<String, Object> respData = new HashMap<>();

		// @RequestBody: JSON -> JAVA VO
		// @ResponseBody: JAVA VO -> JSON
		
		MemberVO memberVO = (MemberVO) session.getAttribute("member");
		//로그인 시 세션에 저장한 MemberVO를 읽어와 변수 membervo에 저장

		if (memberVO == null) {//로그인을 안했을 경우
			respData.put("OK", false); //respData에 put을 이용하여 ("OK", false) 데이터를 대입 - jsp에 제이슨과 연결됨
		} else {//로그인을  했을 경우
			basketVO.setMemberSeq(memberVO.getSeq()); 
			//memberVO의 게터 메서드를 통해 회원 seq(고유값)을 읽어오고, basketVO의 세터 메서드를 통해 읽어온 값을 대입한다. 

			basketService.updateBasket(basketVO);

			respData.put("OK", true);  //respData에 put을 이용하여 ("OK", true) 데이터를 대입 - jsp에 제이슨과 연결됨

		}
		return respData;
	}

}
