package org.raoul.service;

import org.raoul.domain.Criteria;
import org.raoul.domain.MemberVO;

public interface MemberService extends CRUDGenericService<MemberVO, Integer> {

	public int getListCount(Criteria cri);

}
