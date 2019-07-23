package org.raoul.service;

import org.raoul.domain.BoardVO;
import org.raoul.domain.Criteria;

public interface BoardService extends CRUDGenericService<BoardVO, Integer> {

	public int getListCount(Criteria cri);
}
