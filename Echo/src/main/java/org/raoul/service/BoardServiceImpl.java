package org.raoul.service;

import java.util.List;

import org.raoul.domain.BoardVO;
import org.raoul.domain.Criteria;
import org.raoul.mapper.BoardMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BoardServiceImpl implements BoardService {

	@Autowired
	BoardMapper bMapper;
	
	@Override
	public void add(BoardVO vo) {
		bMapper.insert(vo);
		
	}

	@Override
	public BoardVO read(Integer key) {
		return bMapper.select(key);	}

	@Override
	public int modify(BoardVO vo) {
		//TODO : 어떻게 할지 방식 다시 구상해보기.
		return bMapper.update(vo);
	}

	@Override
	public int remove(Integer key) {

		return bMapper.delete(key);
	}

	@Override
	public List<BoardVO> getList() {
		List<BoardVO> result = null;
		result = bMapper.selectAll();
		
		return result;
	}

	@Override
	public int getListCount(Criteria cri) {
		
		return 0;
	}

}
