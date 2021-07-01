package com.vegan.user.basket.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.vegan.user.vo.BasketVO;
import com.vegan.user.vo.MemberVO;

@Repository
public class BasketDAO {

	@Autowired
	private SqlSession sqlSession;

	public List<BasketVO> getBasketList(MemberVO memberVO) {
		return sqlSession.selectList("basketMapper.getBasketList", memberVO);
		//selectList - list형태로 여러개 선택하겠다는 의미 (jsp에서 foreach문을 이용하여 값을 불러와야함)
		//첫번째 매개변수에는 마이바티스의 매핑된 이름과 해당 메서드의 이름을 작성하여 어떤 메서드를 사용할 건지 알려주고
		//두번째 매개변수에는 전달할 자료형이나 변수를 넘겨줌
	}

	public void deleteBasket(BasketVO basketVO) {
		sqlSession.delete("basketMapper.deleteBasket", basketVO);

	}

	public void addBasket(BasketVO basketVO) {
		sqlSession.insert("basketMapper.addBasket", basketVO);
	}

	public Integer getAmount(BasketVO basketVO) {
		return sqlSession.selectOne("basketMapper.getAmount", basketVO);
	}

	public void updateAmount(BasketVO basketVO) {
		sqlSession.update("basketMapper.updateAmount", basketVO);
	}
	
	public void updateBasket(BasketVO basketVO) {
		sqlSession.update("basketMapper.updateAmount", basketVO);
	}

}
