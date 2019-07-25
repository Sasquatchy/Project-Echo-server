package org.raoul.service;

import java.util.List;

import org.raoul.domain.BoardVO;
import org.raoul.domain.MemberVO;
import org.raoul.domain.PhotoDTO;
import org.springframework.web.multipart.MultipartFile;

public interface PhotoService  {
	
	public void upload(MultipartFile[] uploadFile,String rootPath, MemberVO mvo, BoardVO bvo) ;
	
	public PhotoDTO read(Integer pno);

	public int remove(Integer pno) ;
	
	public void removeAllFromBoard(Integer bno);

	public List<PhotoDTO> getListByBoard(Integer bno) ;
	
	public List<PhotoDTO> getListByMember(String uid);
}
