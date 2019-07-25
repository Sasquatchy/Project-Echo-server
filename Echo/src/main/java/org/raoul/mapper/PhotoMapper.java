package org.raoul.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.raoul.domain.PhotoDTO;

public interface PhotoMapper {

	@Insert("insert into echo_photo(pno, photoname, bno, uid) values(#{pno}, #{photoname}, #{bno}, #{uid})")
	public void insert(PhotoDTO dto);
	
	@Delete("delete from echo_photo where pno = #{pno}")
	public int delete(Integer pno);
	
	@Select("select * from echo_photo where bno=#{bno} order by #{pno} desc")
	public List<PhotoDTO> findListByBoard(Integer bno);

	@Select("select * from echo_photo where uid=#{uid} order by #{pno} desc")
	public List<PhotoDTO> findListByMember(String uid);

	@Select("select * from echo_photo where pno=#{pno}")
	public PhotoDTO select(Integer pno);
	
	
}
