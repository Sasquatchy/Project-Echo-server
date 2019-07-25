package org.raoul.service;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import org.apache.commons.io.FileUtils;
import org.raoul.domain.BoardVO;
import org.raoul.domain.MemberVO;
import org.raoul.domain.PhotoDTO;
import org.raoul.mapper.PhotoMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import lombok.extern.log4j.Log4j;
import net.coobird.thumbnailator.Thumbnailator;

@Log4j
@Service
public class PhotoServiceImpl implements PhotoService {
	
	@Autowired
	PhotoMapper pMapper;

	@Transactional
	@Override
	public void upload(MultipartFile[] uploadFiles,String rootPath, MemberVO mvo, BoardVO bvo) {
		String parentPath = "C://upload/" + mvo.getUid().toString() + "/"+getFolder();

		String thumbnailPath = parentPath+"/thumbnail";
		String resizePath = parentPath+"/resize";
		File parentFolder = new File(parentPath);
		log.info("parentPath :"+parentPath);
		
		// check if folder not exist
		if(parentFolder.exists() == false) {
			log.info("make directories");
			parentFolder.mkdirs();
			File thumbFolder = new File(thumbnailPath);
			File resizeFolder = new File(resizePath);
			thumbFolder.mkdir();
			resizeFolder.mkdir();
		}
		
		

		for (MultipartFile multipartFile : uploadFiles) {
			UUID uuid = UUID.randomUUID();
			
			String thumbFileName = "thumb_" + uuid.toString() +multipartFile.getOriginalFilename();
			log.info("thumbFileName:"+ thumbFileName);
			
			String resizeFileName = "resize_" + uuid.toString() +multipartFile.getOriginalFilename();
			log.info("resizeFileName:"+ resizeFileName);
			
			// save thumbnail
			saveResizeFile(multipartFile, thumbnailPath,thumbFileName, 400, 240);
			
			// save photo
			PhotoDTO dto = saveResizeFile(multipartFile, thumbnailPath,thumbFileName, 800, 480);
			
			// set photo's info
			setDestPhotoDTO(dto, bvo.getBno(), mvo.getUid());
			
			//insert DB
			pMapper.insert(dto);
			

		}
		
	}

	public PhotoDTO read(Integer pno) {
		return pMapper.select(pno);
	}

	public int remove(Integer pno) {
		// TODO Auto-generated method stub
		PhotoDTO targetDto = pMapper.select(pno);
		String targetPath = targetDto.getPath();
		String targetPhotoname = targetDto.getPhotoname();
		log.info("deleting file "+ targetPhotoname +" in "+targetPath);
		int count = pMapper.delete(pno);
		// delete dto first, then delete server file.
		log.info(targetPath + "/"+ targetPhotoname);
		File targetFile = new File(targetPath + "/"+ targetPhotoname);
		if(targetFile.exists()) {
			targetFile.delete();
		}
		return count;
	}
	
	public void removeAllFromBoard(Integer bno) {
		PhotoDTO targetDTO = getListByBoard(bno).get(0);
		log.info("clearing files in folder "+targetDTO.getPath());
		File parentFolder = new File(targetDTO.getPath());
		try {
			FileUtils.cleanDirectory(parentFolder);
		} catch (IOException e) {
			e.printStackTrace();
		} 
		parentFolder.delete();

	}
	public List<PhotoDTO> getListByBoard(Integer bno) {
		return pMapper.findListByBoard(bno);
	}
	
	public List<PhotoDTO> getListByMember(String uid) {
		return pMapper.findListByMember(uid);
	}
	
	
	

	private PhotoDTO setDestPhotoDTO(PhotoDTO dto, Integer bno, String uid) {
		
		dto.setBno(bno);
		dto.setUid(uid);
		return dto;
	}
	
	// resize and save the file with given parameter
	private PhotoDTO saveResizeFile(MultipartFile uploadFile, String path, String fileName, int width, int height) {

		File file = new File(path, fileName);
		log.info("fileName:"+ fileName);
		try (FileOutputStream os = new FileOutputStream(file)){
			log.info("os:"+ os);
			Thumbnailator.createThumbnail(uploadFile.getInputStream(), os, width, height);

		} catch (Exception e) {
			log.error(e);
		}
			return new PhotoDTO(null, fileName, path, null, null, null);
	}
	
	// method that make a name of folder yy/mm/dd
	private String getFolder() {

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		Date date = new Date();
		
		String str = sdf.format(date);
		
		return str.replace("-", File.separator);
	}
	
	//check file type
	private boolean checkImageType(File file) {
		
		try {
			String contentType = Files.probeContentType(file.toPath());
			
			return contentType.startsWith("image");
		}catch(IOException e) {
			log.error(e);
		}
		return false;
	}


}
