package org.raoul.service;

import java.util.List;

import org.raoul.domain.Criteria;
import org.raoul.domain.FrameVO;
import org.raoul.mapper.FrameMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class FrameServiceImpl implements FrameService {

	@Autowired
	FrameMapper fMapper;
	
	@Override
	public void add(FrameVO vo) {
		fMapper.insert(vo);
	}

	@Override
	public FrameVO read(Integer key) {
		return fMapper.read(key);
	}

	@Override
	public int modify(FrameVO vo) {
		return fMapper.update(vo);
	}

	@Override
	public int remove(Integer key) {
		return fMapper.delete(key);
	}

	@Override
	public List<FrameVO> getList(Criteria cri) {
		return fMapper.getList();
	}

}
