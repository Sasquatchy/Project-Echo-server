package org.raoul.controller;

import org.raoul.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/member/*")
public class MemberController {

	@Autowired
	MemberService service;
	
	
	
	
}
