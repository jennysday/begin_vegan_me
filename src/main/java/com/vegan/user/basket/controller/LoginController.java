package com.vegan.user.basket.controller;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.vegan.user.vo.MemberVO;

@Controller
public class LoginController {
	
	@Autowired
	SqlSession sqlSession;
	
	//@ResponseBody jsp없이 브라우저에 띄어준다
	

	@RequestMapping("/login.do")
	public String login(long seq, HttpSession session) {
		
		//디비에서 해당 회원의 MemberVO 자료형을 꺼내옴 
		MemberVO memberVO = sqlSession.selectOne("basketMapper.getMember",seq);
		//seq를 매개변수로 넣어주면 마이바티스에서 매개변수로 받은 seq가 MemberVO에 저장된 seq와 같을 경우
		//해당 칼럼을 셀렉트문으로 읽어와 memberVO에 넣어줌
		
		session.setAttribute("member", memberVO);
		//session.setAttribute를 이용하여 마이바티스를 통해 디비에서 뽑아온 memberVO를 세션 영역에 저장해줌

		
		return "/main/main.jsp";
		//로그인을 할 경우 ok를 브라우저에 띄어줌
		
		//http://127.0.0.1:8090/board/login.do?seq=2 
		//seq=2는 MemberVO에 저장된 seq가 2인 컬럼이 존재해야함
		//seq가 2인 회원을 로그인 시키겠다는 의미
	}
	
	

}
