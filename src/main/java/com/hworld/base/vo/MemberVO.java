package com.hworld.base.vo;

import java.sql.Date;
import java.util.List;

import javax.validation.constraints.NotBlank;


import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class MemberVO {
	
	private Integer memberNum;
	@NotBlank
	private String email;
	private String pw;
	private String pwCheck;
	private String name;
	private String address1;
	private String address2;
	private String address3;
	private String rrnf;
	private String rrnl;
	private Date joinDate;
	//private Date numberChangeDate;
	private Integer memberState;
	private Integer adminCheck;
	private String tel;
	private Integer ownCheck;
	private Date lastTime;
	
	//
	private List<TelephoneVO> telephoneVOs;
	private List<PlanVO> planVOs;
	
}
