package org.raoul.mapper;


import java.util.List;

import org.raoul.domain.MemberVO;

public interface MemberMapper {

	public MemberVO read(Integer mno);
	
	public void insert(MemberVO vo); 
	
	public int update(MemberVO vo);
	
	public int delete(Integer mno);
	
	public List<MemberVO> getList();
}
