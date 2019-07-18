package org.raoul.service;

import java.util.List;

public interface CRUDGenericService<VO, K>  {
	
	public void add(VO vo);
	
	public VO read(K key);
	
	public int update(VO vo);
	
	public int delete(K key);
	
	public List<VO> getList();

}
