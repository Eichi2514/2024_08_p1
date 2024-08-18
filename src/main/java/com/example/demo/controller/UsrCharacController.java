package com.example.demo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.service.CharacService;
import com.example.demo.util.Ut;
import com.example.demo.vo.Charac;
import com.example.demo.vo.ResultData;
import com.example.demo.vo.Rq;

import jakarta.servlet.http.HttpServletRequest;

@Controller
public class UsrCharacController {

	@Autowired
	private CharacService characService;

	@RequestMapping("/usr/charac/choice")
	public String showChoice(HttpServletRequest req, Model model) {

		Rq rq = (Rq) req.getAttribute("rq");
		int memberId = rq.getLoginedMemberId();

		List<Charac> characs = characService.getcharacs(memberId);

		model.addAttribute("characs", characs);
		return "/usr/charac/choice";
	}

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

	@RequestMapping("/usr/charac/village")
	public String showVillage(Model model, int characId) {

		Charac charac = characService.getcharacById(characId);

		if (charac == null) {
			return Ut.jsHistoryBack("F-1", Ut.f("해당 캐릭터는 없습니다"));
		}
		model.addAttribute("charac", charac);
		return "/usr/charac/village";
	}

	@RequestMapping("/usr/charac/doMake")
	@ResponseBody
	public String doMake(int memberId, String name, int num) {

		List<Charac> characs = characService.getcharacs(memberId);

		if (characs.size() >= 3) {
			return Ut.jsReplace("F-1", Ut.f("캐릭터 생성 수 제한"), "/usr/charac/choice");
		}

		String type = "https://github.com/user-attachments/assets/fdf48c2f-3cbe-43fc-98a7-30221b7e76ba";

		if (num == 2) {
			type = "https://github.com/user-attachments/assets/ddc0532f-8541-4839-9a01-e0e5ca75e64c";
		} else if (num == 3) {
			type = "https://github.com/user-attachments/assets/df177da2-b93b-4acf-9f13-ef680da07ea3";
		}

		ResultData doMakeRd = characService.doMake(memberId, name, type);

		if (doMakeRd.isFail()) {
			return Ut.jsReplace(doMakeRd.getResultCode(), doMakeRd.getMsg(), "choice");
		}

		return Ut.jsReplace("S-1", Ut.f("%s가 생성되었습니다", name), "/usr/charac/choice");
	}

	@RequestMapping("/usr/charac/doDelete")
	@ResponseBody
	public String doDelete(HttpServletRequest req, int id) {

		Rq rq = (Rq) req.getAttribute("rq");

		Charac charac = characService.getcharacById(id);

		if (charac == null) {
			return Ut.jsHistoryBack("F-1", Ut.f("%d번 캐릭터는 없습니다", id));
		}

		ResultData userCanDeleteRd = characService.userCanDelete(rq.getLoginedMemberId(), charac);

		if (userCanDeleteRd.isFail()) {
			return Ut.jsHistoryBack(userCanDeleteRd.getResultCode(), userCanDeleteRd.getMsg());
		}

		if (userCanDeleteRd.isSuccess()) {
			characService.doDelete(id);
		}

		return Ut.jsReplace(userCanDeleteRd.getResultCode(), userCanDeleteRd.getMsg(), "../charac/choice");
	}

	@PostMapping("/characSet")
	public ResponseEntity<?> characSet(@RequestBody Charac dto) {
		characService.characSet(dto.getId(), dto.getLr(), dto.getUd(), dto.getHp(), dto.getLevel(), dto.getExp(),
				dto.getMoney());
		return ResponseEntity.ok().build();
	}

}