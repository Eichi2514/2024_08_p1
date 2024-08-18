package com.example.demo.repository;
import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.example.demo.vo.Charac;
@Mapper
public interface CharacRepository {
	
	@Insert("INSERT INTO `charac` SET regDate = NOW(), updateDate = NOW(), memberId = #{memberId}, `name` = #{name},  `type` = #{type}")
	public void doMake(int memberId, String name, String type);

	@Select("SELECT * FROM `charac` WHERE `memberId` = #{memberId}")
	public List<Charac> getcharacs(int memberId);

	@Select("SELECT * FROM `charac`	WHERE name = #{name}")
	public Charac getcharacByname(String name);

	@Select("SELECT * FROM `charac`	WHERE id = #{id}")
	public Charac getcharacById(int id);
	
	@Delete("DELETE FROM `charac` WHERE id = #{id}")
	public void doDelete(int id);

	@Update("UPDATE `charac` SET lr = #{lr}, ud = #{ud}, hp = #{hp}, `level` = #{level}, `exp` = #{exp}, money = #{money} WHERE id = #{id}")
	public void characSet(int id, int lr, int ud, int hp, int level, int exp, int money);
	
}