<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:set var="pageTitle" value="MAIN"></c:set>
<%@ include file="../common/head.jspf"%>

<div class="main relative">
	<img src="https://github.com/user-attachments/assets/007e8af7-3561-4c0d-8585-6c941cbde9ad" alt="" />
	<c:if test="${!rq.isLogined() }">
		<form method="POST" action="../member/doLogin">

			<div class="id absolute text_color">
				I D : <input class="csp" type="text" placeholder="아이디 입력" name="loginId" />
			</div>

			<div class="pw absolute text_color">
				PW : <input class="csp" type="password" placeholder="비밀번호 입력" name="loginPw"></input>
			</div>


			<a class="join_bt absolute text_color" href="../member/join">회 원 가 입</a>


			<button class="login_out_bt absolute text_color" type="submit">로 그 인</button>
	</c:if>
	<c:if test="${rq.isLogined() }">

		<div class="member_name absolute text_color">
			${loginedMemberNickname }님 <br /> 환영합니다
		</div>
		<div class="start absolute cursor-pointer">
			<div class="start-text absolute">게임시작</div>
			<img class="start-1" src="https://github.com/user-attachments/assets/f3f4bbe0-bdb9-4960-b9cd-968471a760fb" alt="" />
			<img class="start-2" src="https://github.com/user-attachments/assets/7f9beadb-1431-4f67-b06e-0f95ad29d4fc" alt="" />
		</div>
		<div class="login_out_bt absolute text_color">
			<a href="../member/doLogout">로그아웃</a>
		</div>
		</form>
	</c:if>


</div>

<%@ include file="../common/foot.jspf"%>