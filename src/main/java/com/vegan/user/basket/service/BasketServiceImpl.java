package com.vegan.user.basket.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.vegan.user.basket.dao.BasketDAO;
import com.vegan.user.vo.BasketVO;
import com.vegan.user.vo.MemberVO;

@Service
public class BasketServiceImpl implements BasketService {

	@Autowired
	private BasketDAO basketDAO;

	@Override
	public List<BasketVO> getBasketList(MemberVO memberVO) {
		return basketDAO.getBasketList(memberVO);

	}

	@Override
	public void deleteBasket(BasketVO basketVO) {
		basketDAO.deleteBasket(basketVO);

	}

	@Override
	public void addBasket(BasketVO basketVO) {
		
		Integer amount = basketDAO.getAmount(basketVO); 
		//널값인지 아닌지 알 수 있게 최상위 부모가 오브젝트형인 숫자 자료형을 담을 수 있는 integer에 담아줌
		
		if (amount == null) { //장바구니에 없는 상품이라면
			basketDAO.addBasket(basketVO);//장바구니에 상품 추가
		} else {//이미 장바구니에 추가 된 상품이라면
			basketVO.setAmount(basketVO.getAmount()+amount);//신규 수량 + 기존 수량
			basketDAO.updateAmount(basketVO);
		}
		
	}

	@Override
	public void updateBasket(BasketVO basketVO) {
		basketDAO.updateBasket(basketVO);
	}

}
