package org.raoul.controller;

import org.raoul.domain.BoardVO;
import org.raoul.domain.Criteria;
import org.raoul.service.BoardService;
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
@RequestMapping("/board/*")
public class BoardController {

	@Autowired
	BoardService bService;

	@GetMapping("/list")
	public void list(@ModelAttribute("cri") Criteria cri, Model model) {
		model.addAttribute("list", bService.getList());
		log.info("=-=-=-entering list board/list..");

	}

	@GetMapping({"/read", "/modify"})
	public void read(@ModelAttribute("cri") Criteria cri, Model model) {
		model.addAttribute("vo", bService.read(cri.getBno()));
	}
	
	@PostMapping("/modify")
	public String modity(@ModelAttribute("cri") Criteria cri,Model model, BoardVO vo, RedirectAttributes rttr) {
		
		return "redirect:/board/read"+cri.getLink();
	}

	@PostMapping("/remove")
	public String remove(@ModelAttribute("cri") Criteria cri, Model model, RedirectAttributes rttr) {
		int count = bService.remove(cri.getBno());

		rttr.addAttribute("result", count);

		return "redirect:/board/list" + cri.getLink();

	}
	
	@GetMapping("/register")
	public void register(@ModelAttribute("cri") Criteria cri, Model model) {
		log.info("=-=-=-entering register board/page....");
	}
	
	@PostMapping("/register")
	public String register(@ModelAttribute("cri") Criteria cri,Model model, BoardVO vo, RedirectAttributes rttr) {
	
		log.info("=-=-=-POST register...");
		log.info("=-=-=-registering vo: "+vo);
		bService.add(vo);
		return "redirect:/board/read"+cri.getLink();
	}
	
	

}
