<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:set var="pageTitle" value="MAIN"></c:set>
<%@ include file="../common/head.jspf"%>

<div class="main relative">
	<img src="https://github.com/user-attachments/assets/007e8af7-3561-4c0d-8585-6c941cbde9ad" alt="" />

	<form method="POST" action="../member/doLogin">

		<div class="id absolute text_color">
			I D : <input class="csp" type="text" placeholder="아이디 입력" name="loginId" />
		</div>

		<div class="pw absolute text_color">
			PW : <input class="csp" type="password" placeholder="비밀번호 입력" name="loginPw"></input>
		</div>

		<div class="join_bt absolute text_color">
			<a href="../member/join">회 원 가 입</a>
		</div>

		<button class="login_bt absolute text_color" type="submit">
		로 그 인
		</button>



	</form>


</div>

<%@ include file="../common/foot.jspf"%>