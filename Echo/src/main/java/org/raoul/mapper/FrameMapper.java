package org.raoul.mapper;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.raoul.domain.FrameVO;

public interface FrameMapper {
	
	@Insert("insert into echo_frame (mac, address)  values(#{mac},#{address})")
	public void insert(FrameVO vo);
	
	@Select("select * from echo_frame where fno = #{fno}")
	public FrameVO select(Integer fno);
	
	@Update("update echo_frame set  mac =#{mac}, address=#{address} where fno = #{fno}")
	public int update(FrameVO vo);
	
	@Delete("delete from echo_frame where fno = #{fno}")
	public int delete(Integer fno);
	

}