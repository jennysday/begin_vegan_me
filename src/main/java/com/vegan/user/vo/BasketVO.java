package com.vegan.user.vo;

import java.util.Date;

public class BasketVO {
	// 장바구니
	private long memberSeq;
	private long goodsSeq;
	private int amount;
	private Date regDate;

	// 상품
	private String goodsName;
	private String image;
	private String price;
	private int goodsAmount;

	// 회원
	private String memberName;
	private String memberId;

	public long getMemberSeq() {
		return memberSeq;
	}

	public void setMemberSeq(long memberSeq) {
		this.memberSeq = memberSeq;
	}

	public long getGoodsSeq() {
		return goodsSeq;
	}

	public void setGoodsSeq(long goodsSeq) {
		this.goodsSeq = goodsSeq;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}

	public String getGoodsName() {
		return goodsName;
	}

	public void setGoodsName(String goodsName) {
		this.goodsName = goodsName;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public String getMemberName() {
		return memberName;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}

	public int getGoodsAmount() {
		return goodsAmount;
	}

	public void setGoodsAmount(int goodsAmount) {
		this.goodsAmount = goodsAmount;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	

	
}