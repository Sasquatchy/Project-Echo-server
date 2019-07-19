package org.raoul.domain;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class BoardVO {

	private Integer bno, mno;
	
	private Date regDate;
	private Date updateDate;
	private boolean sent;
}
