package com.example.demo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.service.CharacService;
import com.example.demo.util.Ut;
import com.example.demo.vo.ResultData;

@Controller
public class UsrCharacController {
	
	
	 @Autowired private CharacService characService;
	 

	@RequestMapping("/usr/charac/make")
	public String showMake(Model model, int type) {
		int start = type - 1;
		int end = type + 1;
		if (start < 1)
			start = 1;
		if (end > 3)
			end = 3;
		model.addAttribute("type", type);
		model.addAttribute("start", start);
		model.addAttribute("end", end);
		return "/usr/charac/make";
	}
	
	@RequestMapping("/usr/charac/doMake")
	@ResponseBody
	public String doMake(int memberId, String name, int type) {
		
		ResultData doMake = characService.doMake(memberId, name, type);

		return Ut.jsReplace("S-1", Ut.f("%s가 생성되었습니다", name), "/usr/game/choice");
	}

}