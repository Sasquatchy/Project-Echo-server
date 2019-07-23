package org.raoul.mapper;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.raoul.domain.PhotoVO;

public interface PhotoMapper {

	@Insert("insert into echo_photo (path,photoName,uid,bno) values(#{path},#{photoName},#{uid},#{bno})")
	public void insert(PhotoVO vo);

	@Select("select * from echo_photo where pno = #{pno}")
	public PhotoVO select(Integer pno);

	@Update("update echo_photo set pno =#{pno},photoName =#{photoName}  where pno = #{pno}")
	public int update(PhotoVO vo);

	@Delete("delete from echo_photo where pno = #{pno}")
	public int delete(Integer pno);

}
