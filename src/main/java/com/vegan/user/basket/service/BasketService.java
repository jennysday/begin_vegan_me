package com.vegan.user.basket.service;

import java.util.List;

import com.vegan.user.vo.BasketVO;
import com.vegan.user.vo.MemberVO;

public interface BasketService {

	List<BasketVO> getBasketList(MemberVO memberVO);

	void deleteBasket(BasketVO basketVO);

	void addBasket(BasketVO basketVO);
	
	void updateBasket(BasketVO basketVO);
}
