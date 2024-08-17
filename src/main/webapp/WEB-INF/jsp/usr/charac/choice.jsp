<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:set var="pageTitle" value="캐릭터 선택"></c:set>
<%@ include file="../common/head.jspf"%>
<div class="bg relative">
	<!-- p1 캐릭터 선택 배경 -->
	<img src="https://github.com/user-attachments/assets/e717516d-7431-4258-baef-0eef4cd00adb" alt="" />

	<div class="signs absolute">캐릭터 선택</div>

	<div class="charac1 absolute">
		<c:if test="${characs[0] == null}">
			<a class="charac_make absolute text_color" href="make?type=1">캐릭터 생성</a>
		</c:if>
		<c:if test="${characs[0] != null}">
			<img class="make_img z-20" src="${characs[0].getType()}" alt="" />
			<a class="charac_choice absolute text_color" href="${characs[1].getLocation()}?charac=${characs[0].getId()}">선택</a>
			<a class="charac_delete absolute text_color" href="doDelete?id=0">삭제</a>
		</c:if>
	</div>
	<div class="charac2 absolute">
		<c:if test="${characs[1] == null}">
			<a class="charac_make absolute text_color" href="make?type=1">캐릭터 생성</a>
		</c:if>
		<c:if test="${characs[1] != null}">
			<img class="make_img z-20" src="${characs[1].getType()}" alt="" />
			<a class="charac_choice absolute text_color" href="${characs[1].getLocation()}?charac=${characs[1].getId()}">선택</a>
			<a class="charac_delete absolute text_color" href="doDelete?id=0">삭제</a>
		</c:if>
	</div>
	<div class="charac3 absolute">
		<c:if test="${characs[2] == null}">
			<a class="charac_make absolute text_color" href="make?type=1">캐릭터 생성</a>
		</c:if>
		<c:if test="${characs[2] != null}">
			<img class="make_img z-20" src="${characs[2].getType()}" alt="" />
			<a class="charac_choice absolute text_color" href="${characs[1].getLocation()}?charac=${characs[2].getId()}">선택</a>
			<a class="charac_delete absolute text_color" href="doDelete?id=0">삭제</a>
		</c:if>
	</div>

</div>
<%@ include file="../common/foot.jspf"%>