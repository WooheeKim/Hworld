package com.hworld.base.dao;

import org.apache.ibatis.annotations.Mapper;

import com.hworld.base.vo.MemberVO;

@Mapper
public interface MemberDAO {
	
	//회원 확인
	//1.주민번호가 일치하는 회원 찾기 + 2.주민번호와 이름이 일치하는 회원 찾기
	public MemberVO getIdentifybyRRN(MemberVO memberVO) throws Exception;
	
	public MemberVO getIdentifybyName(MemberVO memberVO) throws Exception;
	
	public MemberVO getMemberDetail(MemberVO memberVO) throws Exception;
	
	public int setMemberAdd(MemberVO memberVO) throws Exception;
	
	public int setMemberInitUpdate(MemberVO memberVO) throws Exception;
	
	
	//아이디 찾기
	public MemberVO getSearchId(MemberVO memberVO) throws Exception;
	
	
	//
//	public MemberVO emailCheck(MemberVO memberVO) throws Exception;
	
	/* 아이디 중복 검사 */
	public int emailCheck(String email) throws Exception;
	
	public int memberPwCheck(MemberVO memberVO) throws Exception;
	
	public void passwordUpdate(MemberVO memberVO) throws Exception;
	
	public MemberVO getMemberLogin(MemberVO memberVO) throws Exception;
	
	public void loginDate(MemberVO memberVO) throws Exception;
	
	public int getMemberLogout(MemberVO memberVO) throws Exception;
	
//	public MemberVO emailSearch(MemberVO memberVO) throws Exception;
}
