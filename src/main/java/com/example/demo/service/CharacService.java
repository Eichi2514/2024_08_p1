
package com.example.demo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.repository.CharacRepository;
import com.example.demo.util.Ut;
import com.example.demo.vo.Charac;
import com.example.demo.vo.ResultData;

@Service
public class CharacService {

	@Autowired
	private CharacRepository characRepository;

	public CharacService(CharacRepository characRepository) {
		this.characRepository = characRepository;
	}

	public ResultData doMake(int memberId, String name, String type) {

		Charac existsCharac = getCharacByName(name);

		if (existsCharac != null) {
			return ResultData.from("F-2", Ut.f("이미 사용중인 이름(%s) 입니다.", name));
		}

		characRepository.doMake(memberId, name, type);
		return ResultData.from("S-1", "캐릭터 생성 성공");
	}

	private Charac getCharacByName(String name) {
		return characRepository.getcharacByname(name);
	}

	public List<Charac> getcharacs(int memberId) {
		return characRepository.getcharacs(memberId);
	}

	public Charac getcharacById(int id) {
		return characRepository.getcharacById(id);
	}

	public ResultData userCanDelete(int loginedMemberId, Charac charac) {
		if (charac.getMemberId() != loginedMemberId) {
			return ResultData.from("F-2", Ut.f("%s 캐릭터에 대한 삭제 권한이 없습니다", charac.getName()));
		}
		return ResultData.from("S-1", Ut.f("%s 캐릭터를 삭제했습니다", charac.getName()));
	}

	public void doDelete(int id) {
		characRepository.doDelete(id);
	}

	public void characSet(int id, int lr, int ud, int hp, int level, int exp, int money) {
		characRepository.characSet(id, lr, ud, hp, level, exp, money);
	}

}
