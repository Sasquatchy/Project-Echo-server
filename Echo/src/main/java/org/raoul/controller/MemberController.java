package org.raoul.controller;

import org.raoul.domain.Criteria;
import org.raoul.domain.MemberVO;
import org.raoul.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
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
		model.addAttribute("list", mService.getList());
		log.info("=-=-=-entering list member/list..");
	}
	
	@GetMapping({"/read", "/modify"})
	public void read(@ModelAttribute("cri") Criteria cri, Model model) {
		model.addAttribute("vo", mService.read(cri.getBno()));
	}
	
	@GetMapping("/register")
	public void register(@ModelAttribute("cri") Criteria cri, Model model) {
		log.info("=-=-=-entering register member/register..");		
	}
	
	@PostMapping("/register")
	public String register(@ModelAttribute("cri") Criteria cri, Model model,MemberVO mvo, RedirectAttributes rttr) {
		
		mService.add(mvo);
		return "redirect:/member/list";
	}
	
	@PostMapping("/modify")
	public String modify(@ModelAttribute("cri") Criteria cri, Model model,MemberVO mvo, RedirectAttributes rttr) {
		
		log.info("=====modifying "+mvo);
		int count = mService.modify(mvo);
		log.info("update count = "+count);
		rttr.addAttribute("result", count);
		return "redirect://member/read"+cri.getLink();
	}
	
	
	//delete is restful, done inside modal
	@DeleteMapping("/{mno}")
	public ResponseEntity<String> remove(@PathVariable("mno") Integer mno){
		log.info("......removingmno: "+mno);
		mService.remove(mno);
		return new ResponseEntity<>( "success",HttpStatus.OK);
	}
	
	
}
