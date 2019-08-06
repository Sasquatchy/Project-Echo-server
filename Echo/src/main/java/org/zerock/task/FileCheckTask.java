package org.zerock.task;

import java.io.File;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

import org.raoul.domain.PhotoDTO;
import org.raoul.mapper.PhotoMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import lombok.extern.log4j.Log4j;

@Log4j
@Component
public class FileCheckTask {
	
	@Autowired
	private PhotoMapper pMapper;
	
	private String getFolderYesterDay() {
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		Calendar cal = Calendar.getInstance();
		
		cal.add(Calendar.DATE, -1);
		
		String str = sdf.format(cal.getTime());
		
		return str.replace("-", File.separator);
		
	}
	
	@Scheduled(cron = " 0 0 2 * * *")
	public void checkFiles() throws Exception {
		
		log.warn("file check task run.................");
		log.warn(new Date());
		//file list in databse
		List<PhotoDTO> fileList = pMapper.getOldFiles();
		
		List<Path> fileListPaths = fileList.stream().map(vo -> Paths.get("C:\\upload",vo.getFolderPath(),vo.getUuid() +"_"+vo.getOriginalPhotoName())).collect(Collectors.toList()); 
				
			
		fileList.stream().map(vo -> Paths.get("C:\\upload", vo.getFolderPath(), "thumbnail", "thumb_" +vo.getUuid() +"_" + vo.getOriginalPhotoName()))
		.forEach(p-> fileListPaths.add(p));
		
		log.warn("========================================================");
		
		fileListPaths.forEach(p -> log.warn(p));
		
		// files in yesterday directory
		
		File targetDir = Paths.get("C:\\upload", getFolderYesterDay()).toFile();
		
		File[] removeFiles = targetDir.listFiles(file -> fileListPaths.contains(file.toPath())== false);
		
		log.warn("-----------------------------------");
		for(File file : removeFiles) {
			
			log.warn(file.getAbsolutePath());
			
			file.delete();
			
		}
	}
}
