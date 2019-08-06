package org.raoul.controller;

import org.raoul.domain.Criteria;
import org.raoul.domain.MemberVO;
import org.raoul.domain.PageMaker;
import org.raoul.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/member/*")
public class MemberController {

	@Autowired
	MemberService mService;
	
	@GetMapping("/list")
	public void list(@ModelAttribute("cri") Criteria cri, Model model) {
		int totalCount = mService.getListCount(cri);
		
		model.addAttribute("pm", new PageMaker(cri, totalCount));
		model.addAttribute("list", mService.getList(cri));
		
		log.info("=-=-=-entering list member/list..");
		log.info(model);
	}
	
	@GetMapping({"/read", "/modify"})
	public void read(@ModelAttribute("cri") Criteria cri, Model model) {
		log.info(cri);
		model.addAttribute("vo", mService.read(cri.getMno()));
		log.info("=-=-=-entering list member/read..");
		log.info(model);
	}
	
	@GetMapping({"/register", "/login"})
	public void register(@ModelAttribute("cri") Criteria cri, Model model) {
		log.info("=-=-=-entering register member/register..");		
	}
	
	@PostMapping("/register")
	public String register(MemberVO vo, RedirectAttributes rttr) {
		
		mService.add(vo);
		log.info("vo: " + vo);
		rttr.addFlashAttribute("result", "success");
		
		return "redirect:/member/list";
	}
	
}
