package com.example.demo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.service.MemberService;
import com.example.demo.util.Ut;
import com.example.demo.vo.Member;
import com.example.demo.vo.ResultData;
import com.example.demo.vo.Rq;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class UsrMemberController {

	@Autowired
	private MemberService memberService;

	@RequestMapping("/usr/member/doLogout")
	@ResponseBody
	public String doLogout(HttpServletRequest req) {
		
		Rq rq = (Rq) req.getAttribute("rq");
		
		rq.logout();

		return Ut.jsReplace("S-1", Ut.f("로그아웃 되었습니다"), "/");
	}
	
	@RequestMapping("/usr/member/login")
	public String showLogin() {
		return "/usr/member/login";
	}
	

	@RequestMapping("/usr/member/join")
	public String showJoin() {
		return "/usr/member/join";
	}


	@RequestMapping("/usr/member/doLogin")
	@ResponseBody
	public String doLogin(HttpServletRequest req, String loginId, String loginPw) {

		Rq rq = (Rq) req.getAttribute("rq");

		
		if (Ut.isEmptyOrNull(loginId)) {
			return Ut.jsHistoryBack("F-1", "loginId 입력 x");
		}
		if (Ut.isEmptyOrNull(loginPw)) {
			return Ut.jsHistoryBack("F-2", "loginPw 입력 x");
		}

		Member member = memberService.getMemberByLoginId(loginId);

		if (member == null) {
			return Ut.jsHistoryBack("F-3", Ut.f("%s는(은) 존재 x", loginId));
		}

		if (member.getLoginPw().equals(loginPw) == false) {
			return Ut.jsHistoryBack("F-4", Ut.f("비밀번호 틀림"));
		}

		rq.login(member);

		return Ut.jsReplace("S-1", Ut.f("%s님 환영합니다", member.getNickname()), "/");
	}

	@RequestMapping("/usr/member/doJoin")
	@ResponseBody
	public String doJoin(HttpSession httpSession, String loginId, String loginPw, String name,
			String nickname, String cellphoneNum, String email) {

		if (Ut.isEmptyOrNull(loginId)) {
			return Ut.jsReplace("F-1", "loginId 입력 x", "join");
		}
		if (Ut.isEmptyOrNull(loginPw)) {
			return Ut.jsReplace("F-2", "loginPw 입력 x", "join");
		}
		if (Ut.isEmptyOrNull(name)) {
			return Ut.jsReplace("F-3", "name 입력 x", "join");
		}
		if (Ut.isEmptyOrNull(nickname)) {
			return Ut.jsReplace("F-4", "nickname 입력 x", "join");
		}
		if (Ut.isEmptyOrNull(cellphoneNum)) {
			return Ut.jsReplace("F-5", "cellphoneNum 입력 x", "join");
		}
		if (Ut.isEmptyOrNull(email)) {
			return Ut.jsReplace("F-6", "email 입력 x", "join");
		}
		
		ResultData doJoinRd = memberService.doJoin(loginId, loginPw, name, nickname, cellphoneNum, email);

		if (doJoinRd.isFail()) {
			return Ut.jsReplace(doJoinRd.getResultCode(), doJoinRd.getMsg(), "join");
		}

		Member member = memberService.getMemberById((int) doJoinRd.getData1());

		return Ut.jsHistoryBack("S-1", Ut.f("%s님 환영합니다", nickname));
	}

}