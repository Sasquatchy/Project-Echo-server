package org.raoul.mapper;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;

import java.util.List;

import org.raoul.domain.MemberVO;

public interface MemberMapper {

	public MemberVO read(Integer mno);

	@Insert("insert into echo_member (uid,pw,username,mobile) values(#{uid},#{pw},#{username},#{mobile})")
	public void insert(MemberVO vo);

	@Delete("delete from echo_member where mno = #{mno}")
	public int delete(Integer mno);

	public int update(MemberVO vo);

	public List<MemberVO> getList();

}