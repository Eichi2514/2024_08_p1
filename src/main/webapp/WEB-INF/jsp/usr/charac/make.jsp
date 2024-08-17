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
			<c:if test="${type == 1}">
				<img class="make_img" src="https://github.com/user-attachments/assets/fdf48c2f-3cbe-43fc-98a7-30221b7e76ba" alt="" />
			</c:if>
			<c:if test="${type == 2}">
				<img class="make_img" src="https://github.com/user-attachments/assets/ddc0532f-8541-4839-9a01-e0e5ca75e64c" alt="" />
			</c:if>
			<c:if test="${type == 3}">
				<img class="make_img" src="https://github.com/user-attachments/assets/df177da2-b93b-4acf-9f13-ef680da07ea3" alt="" />
			</c:if>

			<button class="charac_make absolute text_color" type="submit">캐릭터 생성</button>
		</div>
		<div class="charac_window absolute text_color">
			<div class="charac_name">캐릭터 이름</div>
			<input type="text" name="name" /> <input type="hidden" value="${type}" name="num" /> <input type="hidden"
				value="${loginedMemberId}" name="memberId" />
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