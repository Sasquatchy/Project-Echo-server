package org.raoul.controller;

import java.util.List;

import org.raoul.domain.BoardVO;
import org.raoul.domain.Criteria;
import org.raoul.domain.PageMaker;
import org.raoul.domain.PhotoDTO;
import org.raoul.service.BoardService;
import org.raoul.service.PhotoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/board/*")
public class BoardController {
	
	@Autowired
	BoardService bService;
	
	@Autowired
	PhotoService pService;
	
	@GetMapping(value = "/getAttachList",
			produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public ResponseEntity<List<PhotoDTO>> getAttachList(Integer bno){
		
		log.info("getAtachList " +bno);
		
		return new ResponseEntity<>(bService.getAttachList(bno),HttpStatus.OK);
	}
	
	
	@GetMapping("/list")
	public void list(@ModelAttribute("cri") Criteria cri, Model model) {
		
		int totalCount = bService.getListCount(cri);
		
		model.addAttribute("pm", new PageMaker(cri, totalCount));
		model.addAttribute("list", bService.getList(cri));
		log.info("board/list..");
	}
	
	@GetMapping({"/read", "/modify"})
	public void read(@ModelAttribute("cri") Criteria cri, Model model) {
		model.addAttribute("vo", bService.read(cri.getBno()));
		log.info(model);
	}
	
	@PostMapping("/modify")
	public String modity(@ModelAttribute("cri") Criteria cri, BoardVO vo, RedirectAttributes rttr) {
		
		log.info("=-=-=-modifying vo: "+vo);

		if (vo.getAttachList() != null) {
			vo.getAttachList().forEach(attach -> log.info(attach));
		}
		
		log.info("=========================================================");
		
		bService.modify(vo);
		
		return "redirect:/board/read"+cri.getLink()+"&bno="+vo.getBno();
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
	public String register(@ModelAttribute("cri") Criteria cri, BoardVO vo, RedirectAttributes rttr) {
	
		log.info("=-=-=-POST register...");
		log.info("=-=-=-registering vo: "+vo);
		
		if (vo.getAttachList() != null) {
			vo.getAttachList().forEach(attach -> log.info(attach));
		}
		log.info("=========================================================");
		
		bService.add(vo);
		
		return "redirect:/board/read"+cri.getLink()+"&bno="+vo.getBno();
	}
	
}