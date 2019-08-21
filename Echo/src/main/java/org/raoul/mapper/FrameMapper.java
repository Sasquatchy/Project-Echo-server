package org.raoul.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.raoul.domain.FrameVO;

public interface FrameMapper {
	
	@Select("select * from echo_frame where fno=#{fno}")
	public FrameVO read(Integer fno);
	
	@Insert("insert into echo_frame (ufid) values(#{ufid})")
	public void insert(FrameVO vo); 
	
	
	
	@Update("update echo_frame set ufid= #{ufid} where fno = #{fno}")
	public int update(FrameVO vo);
	
	@Delete("delete from echo_frame where fno = #{fno}")
	public int delete(Integer fno);
	
	@Select("select * from echo_frame where fno>0 order by fno desc")
	public List<FrameVO> getList();
}
