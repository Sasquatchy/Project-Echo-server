package org.raoul.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.raoul.domain.BoardVO;
import org.raoul.domain.Criteria;

public interface BoardMapper {

	public void insert(BoardVO vo);
	
	public BoardVO select(Integer bno);
	
	public int update(BoardVO vo);
	
	@Delete("delete from echo_board where bno = #{bno}")
	public int delete(Integer bno);
	
	@Select("select * from echo_board where bno>0 order by bno desc")
	public List<BoardVO> selectAll();
	
	public List<BoardVO> selectPage(Criteria cri);
	
	@Select("select count(bno) from echo_board")
	public int countList(Criteria cri);
	
	
}
