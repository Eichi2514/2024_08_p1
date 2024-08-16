
package com.example.demo.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.repository.CharacRepository;
import com.example.demo.vo.ResultData;

@Service
public class CharacService {

	@Autowired
	private CharacRepository characRepository;

	public CharacService(CharacRepository characRepository) {
		this.characRepository = characRepository;
	}

	public ResultData doMake(int memberId, String name, int type) {
		characRepository.doMake(memberId, name, type);
		return ResultData.from("S-1", "캐릭터 생성 성공");
	}

}
