<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
		<form name="joinform" action="memberinsert.do" method = "post">
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