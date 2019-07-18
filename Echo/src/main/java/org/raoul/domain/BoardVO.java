package org.raoul.domain;

import java.util.List;

import lombok.Data;

@Data
public class BoardVO {

	private Integer bno;
	
	//contents are sender(member), receiver(frame) and photos(photo)
	private MemberVO member;
	private FrameVO frame;
	private List<PhotoVO> photos;
}
