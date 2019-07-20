package org.raoul.domain;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class BoardVO {


	private Integer bno, mno;
	
	//contents are sender(member), receiver(frame) and photos(photo)
	private MemberVO member;
	private FrameVO frame;
	private List<PhotoVO> photos;
	private Date regDate;
	private Date updateDate;

	private boolean sent;
}
