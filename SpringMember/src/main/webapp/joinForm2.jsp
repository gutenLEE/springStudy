<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원관리 시스템 회원가입 페이지</title>
<style>
	body{
		display : flex;
		justify-content: center;
		align-items: center; 
	}
</style>
</head>
<body>
	<form name="joinform" action="./joinprocess.me" method = "post">
		<table border=1>
			<tr>
				<td colspan=2 align=center>
					<b><font size=5> 회원가입 페이지</font></b>
				</td>
			</tr>
			<tr>
				<td>아이디 : </td>
				<td><input type="text" name="id"/></td>
			</tr>
			<tr>
				<td>비밀번호 : </td>
				<td><input type="password" name="password"/></td>
			</tr>
			<tr>
				<td>이름 : </td>
				<td><input type="text" name="name"/></td>
			</tr>
			<tr>
				<td>나이 : </td>
				<td><input type="text" name="age" maxlength=2 size=5/></td>
			</tr>
			<tr>
				<td>성별 : </td>
				<td>
					<input type="radio" name="gender" value="남" checked/>남
					<input type="radio" name="gender" value="여"/>여
				</td>
			</tr>
			<tr>
				<td>이메일 : </td>
				<td><input type="text" name="email" size=30/></td>
			</tr>
			<tr>
				<td colspan=2 align=center>
					<!-- 인라인 형식의 자바스크립트 코드. -->
					<a href="javascript:joinform.submit()">회원가입</a>
					<a href="javascript:joinform.reset()">다시작성</a>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>