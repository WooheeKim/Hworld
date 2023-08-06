package com.hworld.base.vo;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class PlanVO {
	//요금제VO
    private String planNum;
    private String planName;
    private Integer planPrice;
    private String dataCapacity;
    private String categoryCode;
    private String planExplain;
    private String planExplainS;
    private Integer disabled;
    
    //할인요금 계산을 위한 disPercent 추가
    private Integer disCode;
    private Double disPercent;
    
    //대표회선의 요금제 일치확인
    private Integer count;
    private Integer memberNum;
    private String phoneNum;
    private Integer serialNum;
    private Integer kingCheck;
    
    //commonCode 사용
    private String note;
    private String type;
    
    private Date contractDate;
    private Date expireDate;
}
