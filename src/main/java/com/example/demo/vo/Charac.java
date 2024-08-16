package com.example.demo.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Charac {

	private int id;
	private String regDate;
	private String updateDate;
	private String memberId;
	private String name;
	private String type;
	private int level;
	private int mony;
	private int hp;
	private int exp;
	private String location;	
}