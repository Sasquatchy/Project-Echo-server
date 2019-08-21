package org.raoul.controller;

import org.raoul.domain.Criteria;
import org.raoul.service.FrameService;
import org.raoul.service.MemberService;
import org.raoul.service.PhotoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.log4j.Log4j;

@RequestMapping("/album/*")
@Controller
public class AlbumController {

	@Autowired
	FrameService fService;
	
	@GetMapping("/")
	public void read(@ModelAttribute("cri") Criteria cri,Model model) {

		
	}
	
}
