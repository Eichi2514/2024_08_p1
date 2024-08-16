package com.example.demo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class UsrGameController {

	@RequestMapping("/usr/game/choice")
	public String showChoice() {
		return "/usr/game/choice";
	}
}