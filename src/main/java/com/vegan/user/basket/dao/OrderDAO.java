package com.vegan.user.basket.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.vegan.user.vo.MemberVO;
import com.vegan.user.vo.OrderBoardVO;

@Repository
public class OrderDAO {

	@Autowired
	private SqlSession sqlSession;

	public List<OrderBoardVO> getOrderList(MemberVO memberVO) {
		return sqlSession.selectList("orderMapper.getOrderList", memberVO);
	}

	public int updateOrderStatus(OrderBoardVO orderBoardVO) {
		return sqlSession.update("orderMapper.updateOrderStatus", orderBoardVO);
	}

}
