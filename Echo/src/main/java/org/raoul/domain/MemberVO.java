package org.raoul.domain;

import java.util.Date;

import lombok.Data;

@Data
public class MemberVO {

	private Integer uid;
	private String pw;
	private String username;
	private String mobile;
	private Date regDate;
	private Date updateDate;
	
	
}
