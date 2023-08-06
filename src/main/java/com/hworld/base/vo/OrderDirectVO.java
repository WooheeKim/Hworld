package com.hworld.base.vo;

import java.util.List;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class OrderDirectVO {
	//db에 저장할 때 쓰는 용도
	//slicedCode 느낌(기본 물건정보)
 
	private String directCode;
	
	private String orderNum;
	
	private Integer memberNum;
	
    private String orderAmount;
    
    
    // DB엔 없음 -------
    
    //옵션가격*옵션수량
    private String calPrice;
    
    private DirectVO directVO;
    
    private List<OrderVO> orderVOs;
    
    private List<DirectVO> directVOs;
    
//    public void initTotal() {
//		this.totalPrice = this.onePrice * this.orderAmount;
//	}
    
    
}
