package org.raoul.mapper;


import org.raoul.domain.MemberVO;

public interface MemberMapper {

	public MemberVO read(String uid);
	
	public void insert(MemberVO vo); 
}
