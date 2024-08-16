<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:set var="pageTitle" value="캐릭터 선택"></c:set>
<%@ include file="../common/head.jspf"%>
<div class="bg relative">
	<!-- p1 캐릭터 선택 배경 -->
	<img src="https://github.com/user-attachments/assets/e717516d-7431-4258-baef-0eef4cd00adb" alt="" />

	<div class="signs absolute">캐릭터 선택</div>
	<div class="charac1 absolute">
		<a class="charac_make absolute text_color" href="../charac/make?type=1">캐릭터 생성</a>
	</div>
	<div class="charac2 absolute">
		<a class="charac_make absolute text_color" href="../charac/make?type=1">캐릭터 생성</a>
	</div>
	<div class="charac3 absolute">
		<a class="charac_make absolute text_color" href="../charac/make?type=1">캐릭터 생성</a>
	</div>

</div>
<%@ include file="../common/foot.jspf"%>