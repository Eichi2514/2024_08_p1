<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:set var="pageTitle" value="캐릭터 생성"></c:set>
<%@ include file="../common/head.jspf"%>
<div class="bg relative">
	<!-- p1 캐릭터 선택 배경 -->
	<img src="https://github.com/user-attachments/assets/e717516d-7431-4258-baef-0eef4cd00adb" alt="" />

	<div class="signs absolute">캐릭터 생성</div>

	<form method="POST" action="doMake">
	<div class="charac absolute">
		<button class="charac_make absolute text_color" type="submit">캐릭터 생성</button>
	</div>
		<div class="charac_window absolute text_color">
			<div class="charac_name">캐릭터 이름</div>
			<input type="text" name="name" />
			<input type="hidden" value="${type}" name="type" />
			<input type="hidden" value="${loginedMemberId}" name="memberId" />
			<div class="charac_type">속성</div>
			<a class="left_bt absolute" href="make?type=${start}"></a> <a class="right_bt absolute" href="make?type=${end}"></a>
			<c:if test="${type == 1}">
				<div>불</div>
			</c:if>
			<c:if test="${type == 2}">
				<div>물</div>
			</c:if>
			<c:if test="${type == 3}">
				<div>풀</div>
			</c:if>
		</div>
	</form>

</div>
<%@ include file="../common/foot.jspf"%>