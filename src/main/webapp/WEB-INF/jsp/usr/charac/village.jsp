<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="com.example.demo.vo.Charac" %>

<c:set var="pageTitle" value="마을"></c:set>
<%@ include file="../common/ingame_head.jspf"%>

<div class="ig level absolute">레벨 : ${charac.getLevel()}</div>
<div class="ig name absolute">캐릭터 명 : ${charac.getName()}</div>
<div class="ig money absolute">돈 : ${charac.getMoney()}</div>
<div class="ig hp absolute"> 생명력 : </div>
<div class="hp_bar absolute z-10 bg-red-500"></div>
<div class="ig exp absolute">경험치 :</div>
<div class="exp_bar absolute z-10 bg-yellow-400"></div>

<div class="bg relative">
	<!-- p1 마을배경 -->
	<img src="https://github.com/user-attachments/assets/4877f97d-174f-4a42-993f-a82566b39434" alt="" />
	<div class="absolute village_charac">
		<img class="move village_charac_img" src="${charac.getType()}" alt="" />
	</div>

</div>

<style type="text/css">
.hp_bar {
    width: ${charac.getHp()}px;
	height: 40px;
	top: 100px;
	left: 450px;
}
.exp_bar {
	width: ${charac.getExp()}px;
	height: 40px;
	top: 140px;
	left: 450px;
}

.village_charac {
	top: 850px;
	left: 650px;
}

.village_charac_img {
	animation: move 1s linear infinite both;
}
/* 자동정렬시 아래부분 깨짐 주의 */
@keyframes move {
    0% { transform: translate(0); }
    20% { transform: translate(-5px, 5px); }
    40% { transform: translate(-5px, -5px); }
    60% { transform: translate(5px, 5px); }
    80% { transform: translate(5px, -5px); }
    100% { transform: translate(0); }
}
</style>

<script type="text/javascript">
	let UD = 850;
	let LR = 650;
	let Speed = 1;

	function up() {
		if (5 < UD) {
			UD -= 5 * Speed;
			$(".village_charac").css("top", UD + "px");
		}
		console.log("LR:" + LR + ", UD:" + UD);
	}

	function down() {
		if (UD < 905) {
			UD += 5 * Speed;
			$(".village_charac").css("top", UD + "px");
		}
		console.log("LR:" + LR + ", UD:" + UD);
	}

	function left() {
		if (10 < LR) {
			LR -= 5 * Speed;
			$(".village_charac").css("left", LR + "px");
		}
		console.log("LR:" + LR + ", UD:" + UD);
	}

	function right() {
		if (LR < 905) {
			LR += 5 * Speed;
			$(".village_charac").css("left", LR + "px");
		}
		console.log("LR:" + LR + ", UD:" + UD);
	}

	document.addEventListener("keydown", checkKey, false);

	function checkKey(e) {
		console.clear();
		if (e.keyCode === 37) {
			left();
		} else if (e.keyCode === 38) {
			up();
		} else if (e.keyCode === 39) {
			right();
		} else if (e.keyCode === 40) {
			down();
		}
	}
</script>


<%@ include file="../common/foot.jspf"%>