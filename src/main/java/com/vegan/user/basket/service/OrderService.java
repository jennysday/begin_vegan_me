package com.vegan.user.basket.service;

import java.util.List;

import com.vegan.user.vo.MemberVO;
import com.vegan.user.vo.OrderBoardVO;

public interface OrderService {

	List<OrderBoardVO> getOrderList(MemberVO memberVO);

	int updateOrderStatus(OrderBoardVO orderBoardVO);

	
}
