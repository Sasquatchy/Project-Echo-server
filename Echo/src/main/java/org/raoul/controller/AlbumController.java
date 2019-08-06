package org.raoul.controller;

import org.raoul.service.FrameService;
import org.raoul.service.MemberService;
import org.raoul.service.PhotoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.log4j.Log4j;

@RequestMapping("/album/*")
@Controller
public class AlbumController {

	@Autowired
	FrameService fService;
	
	@Autowired
	MemberService mService;
	
	@Autowired
	PhotoService pService;
	
	@GetMapping("/")
	public void read(Model model, Integer mno) {
//		MemberVO mvo = mService.read(mno);
//		log.info(mvo);
//		//FrameVO fvo  = fService.read(mvo.getFno());
//		log.info(fvo);
//		model.addAttribute("mvo", mvo);
//		model.addAttribute("fvo", fvo);
//		//TODO: send photo list via model
	}
	
}
