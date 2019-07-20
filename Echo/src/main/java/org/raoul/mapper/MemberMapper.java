package org.raoul.mapper;


import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.raoul.domain.BoardVO;
import org.raoul.domain.MemberVO;

public interface MemberMapper {

	public MemberVO read(String uid);
	
	@Insert("insert into echo_member (uid,pw,username,mobile) values(#{uid},#{pw},#{username},#{mobile})")
	public void insert(MemberVO vo); 
	
	@Delete("delete from echo_member where uid = #{uid}")
	public void delete(String uid);
	
	public int update(MemberVO vo);
	
	
}
