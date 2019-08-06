package org.raoul.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;

import org.raoul.domain.BoardVO;
import org.raoul.domain.Criteria;
import org.raoul.domain.MemberVO;
import org.raoul.domain.PhotoDTO;
import org.raoul.service.PhotoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping("/photo/*")
public class PhotoController {

	@Autowired
	PhotoService pService;

	private final static String uploadPath = "C:" + File.separator + "upload";

	static {
		File uploadFile = new File(uploadPath);
		if (!uploadFile.exists()) {
			uploadFile.mkdir();
		}
	}

	@GetMapping("/uploadAjax")
	public void uploadAjax() {
		log.info("showing uploadPage");
	}

	//////// ajax
	@PostMapping(value = "/uploadAjaxAction", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public @ResponseBody ResponseEntity<List<PhotoDTO>> uploadAjaxPost(MultipartFile[] uploadFiles,
			String uid) {

//		log.info(uploadFiles[0].getOriginalFilename() + "==== uid=" + uid + "==== bno=" + bno);

		List<PhotoDTO> list = pService.upload(uploadFiles, uploadPath, uid);

		log.info("list contents ==== \n"+list);
		if (list.isEmpty()) {
			log.info("photo list has a problem");
			return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		log.info("number of list of photos: " + list.size());

		return new ResponseEntity<>(list, HttpStatus.OK);

	}

	@GetMapping(value = "/viewPhoto", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public @ResponseBody ResponseEntity<byte[]> viewPhoto(@RequestParam("file") String file) {

		ResponseEntity<byte[]> result = null;

		log.info("file=== " + file);

		try {
			File targetFile = Paths.get(uploadPath, file).toFile();
			log.info("targetfile=== " + targetFile);
			HttpHeaders header = new HttpHeaders();
			header.add("Content-Type", Files.probeContentType(targetFile.toPath()));
			byte[] arr = FileCopyUtils.copyToByteArray(targetFile);

			result = new ResponseEntity<>(arr, header, HttpStatus.OK);
			log.info("result=== " + result);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return result;
	}
	

	// TODO: get Photo by bno
	// TODO: make a page to test
	@GetMapping(value = "/getPhotoByBno/{bno}")
	public @ResponseBody ResponseEntity<List<PhotoDTO>> getPhotoByBno(@PathVariable("bno") Integer bno) {

		List<PhotoDTO> list = new ArrayList<>();

		ResponseEntity<List<PhotoDTO>> result = null;

		log.info("selected bno is... " + bno);
		list = pService.getListByBoard(bno);
		log.info("list of photo=== " + list);

		if (list.isEmpty()) {
			result = new ResponseEntity<List<PhotoDTO>>(list, HttpStatus.INTERNAL_SERVER_ERROR);
		}
		result = new ResponseEntity<List<PhotoDTO>>(list, HttpStatus.OK);

		return result;
	}

	// TODO:getPhoto by member uid
	// TODO: make a page to test
	@GetMapping("/getPhotoByUid/{uid}")
	public @ResponseBody ResponseEntity<List<PhotoDTO>> getPhotoByUid(@PathVariable("uid") String uid) {
		List<PhotoDTO> list = new ArrayList<>();

		ResponseEntity<List<PhotoDTO>> result = null;

		log.info("selected uid is... " + uid);
		list = pService.getListByMember(uid);
		log.info("list of photo=== " + list);

		if (list.isEmpty()) {
			result = new ResponseEntity<List<PhotoDTO>>(list, HttpStatus.INTERNAL_SERVER_ERROR);
		}
		result = new ResponseEntity<List<PhotoDTO>>(list, HttpStatus.OK);

		return result;
	}

	// TODO: deletion of photo by pno
	@DeleteMapping("/deletePhotoList")
	public  @ResponseBody ResponseEntity<Integer> deletePhotoList(){
		
		return null;
	}

	////////// 일반 방식
	@GetMapping("/list")
	public void list(@ModelAttribute("cri") Criteria cri, Model model) {
		List pList = pService.getListByBoard(cri.getBno());
		log.info("photo list length: " + pList.size());
		model.addAttribute("photoList", pList);
	}

	@GetMapping("/albumlist")
	public void albumlist(@ModelAttribute("cri") Criteria cri, Model model, MemberVO mvo) {
		List pList = pService.getListByBoard(mvo.getMno());
		log.info("album list length: " + pList.size());
		model.addAttribute("albumList", pList);

	}

	@GetMapping("/upload")
	public void upload(Model model) {
		log.info("upload starting");
	}

	@PostMapping("/upload")
	public void upload(MultipartFile[] uploadFiles, Model model, MemberVO mvo) {

		String uploadPath = "C:" + File.separator + "upload";
		File uploadFile = new File(uploadPath);
		if (!uploadFile.exists()) {
			uploadFile.mkdir();
		}
		List<PhotoDTO> list = pService.upload(uploadFiles, uploadPath, mvo.getUid());

		log.info("list size: " + list.size());
		log.info(list);

	}// end of PostMapping upload

}
