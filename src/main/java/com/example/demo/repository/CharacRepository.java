package com.example.demo.repository;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
@Mapper
public interface CharacRepository {
	
	@Insert("INSERT INTO `charac` SET regDate = NOW(), updateDate = NOW(), memberId = #{memberId}, `name` = #{name},  `type` = #{type}")
	public void doMake(int memberId, String name, int type);
	
}