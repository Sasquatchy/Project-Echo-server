package org.raoul.domain;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;

@AllArgsConstructor
@Data
public class PhotoDTO {

	private Integer pno;
	private String photoname;
	private String path;
	private Date regDate;
	
	private Integer bno;
	private String uid;
}
