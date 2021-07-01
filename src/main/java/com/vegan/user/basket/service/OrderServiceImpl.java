package com.vegan.user.basket.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.vegan.user.basket.dao.OrderDAO;
import com.vegan.user.vo.MemberVO;
import com.vegan.user.vo.OrderBoardVO;



@Service
public class OrderServiceImpl implements OrderService {

	@Autowired
	private OrderDAO orderDAO;

	@Override
	public List<OrderBoardVO> getOrderList(MemberVO memberVO) {
		return orderDAO.getOrderList(memberVO);

	}

	@Override
	public int updateOrderStatus(OrderBoardVO orderBoardVO) {
		return orderDAO.updateOrderStatus(orderBoardVO);
	}


}
