package com.example.demo.repository;
import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.example.demo.vo.Charac;
@Mapper
public interface CharacRepository {
	
	@Insert("INSERT INTO `charac` SET regDate = NOW(), updateDate = NOW(), memberId = #{memberId}, `name` = #{name},  `type` = #{type}")
	public void doMake(int memberId, String name, String type);

	@Select("SELECT * FROM `charac` WHERE `memberId` = #{memberId}")
	public List<Charac> getcharacs(int memberId);

	@Select("SELECT * FROM `charac`	WHERE name = #{name}")
	public Charac getcharacByname(String name);

}