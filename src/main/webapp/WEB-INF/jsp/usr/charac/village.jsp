<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="com.example.demo.vo.Charac"%>

<c:set var="pageTitle" value="마을"></c:set>
<script src="/resource/common_village.js" defer="defer"></script>
<%@ include file="../common/ingame_head.jspf"%>

<div class="ig level absolute">레벨 : ${charac.getLevel()}</div>
<div class="ig name absolute">캐릭터 명 : ${charac.getName()}</div>
<div class="ig money absolute">돈 : ${charac.getMoney()}</div>
<div class="ig hp absolute">생명력 :</div>
<div class="hp_bar absolute z-10 bg-red-500"></div>
<div class="ig exp absolute">경험치 :</div>
<div class="exp_bar absolute z-10 bg-yellow-400"></div>
</div>
</header>

<div class="bg relative">
	<!-- p1 마을배경 -->
	<img src="https://github.com/user-attachments/assets/4877f97d-174f-4a42-993f-a82566b39434" alt="" />
	<div class="shop_bg absolute text_color z-20 hidden">
		<div class="shop_title absolute">S H O P</div>
		<div class="absolute item-1 cursor-pointer">
			<!-- p1 아이템1 -->
			<img src="https://github.com/user-attachments/assets/630ffaac-0a2a-4e3b-afaa-1fe09966dc46" alt="" />
			<div class="item_text absolute text_color">
				<div class="item_title">작은 회복물약</div>
				<div class="item_body">체력을 50% 회복시켜준다</div>
			</div>
		</div>
		<div class="absolute item-2 cursor-pointer">
			<!-- p1 아이템2 -->
			<img src="https://github.com/user-attachments/assets/70474bda-62e8-4e6e-bd86-81fced359bfd" alt="" />
			<div class="item_text absolute text_color">
				<div class="item_title">큰 회복물약</div>
				<div class="item_body">체력을 전부 회복시켜준다</div>
			</div>
		</div>
		<div class="absolute item-3 cursor-pointer">
			<!-- p1 아이템3 -->
			<img src="https://github.com/user-attachments/assets/affd7ca7-173f-48b6-91b6-f00dff44dc8d" alt="" />
			<div class="item_text absolute text_color">
				<div class="item_title">경험치 물약</div>
				<div class="item_body">경험치를 50% 올려준다</div>
			</div>
		</div>
	</div>

	<div class="absolute village_charac">
		<img class="move village_charac_img" src="${charac.getType()}" alt="" />
	</div>



	<!-- 자동정렬시 깨짐 주의 -->
<style type="text/css">
.village_charac {
	top: ${charac.getLr()}px;
	left: ${charac.getUd()}px;
}
.hp_bar {
	width: ${charac.getHp()}px;
}
.exp_bar {
	width: ${charac.getExp()}px;
}
</style>

<script type="text/javascript">
    let LR = ${charac.getLr()};
    let UD = ${charac.getUd()};
    let HP = ${charac.getHp()};
    let EXP = ${charac.getExp()};
	let Speed = 1;
</script>

	<!-- 복사본 
<style type="text/css">
.village_charac {
	top: ${charac.getLr()}px;
	left: ${charac.getUd()}px;
}
.hp_bar {
	width: ${charac.getHp()}px;
}
.exp_bar {
	width: ${charac.getExp()}px;
}
</style>

<script type="text/javascript">
    let LR = ${charac.getLr()};
    let UD = ${charac.getUd()};
	let Speed = 1;
</script>
-->

	<%@ include file="../common/foot.jspf"%>