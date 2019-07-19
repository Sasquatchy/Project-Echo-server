package org.raoul.mapper;

import org.apache.ibatis.annotations.Select;

public interface TimeMapper {

	//TODO: make DB and add a Time query for a test purpose
	
	@Select("select now()")
	public String getTime();
	
}
