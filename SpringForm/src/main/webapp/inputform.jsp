<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-type"  content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
	<form action = "inputProcess.me" method="post">
		<table align="center">
			<tr>
				<td>EMPNO</td>
				<td><input type="text" name="empno" size="10" maxlength="10"></td>
			</tr>
			<tr>
				<td>ename</td>
				<td><input type="text" name="ename" size="10" maxlength="10"></td>
			</tr>
			<tr>
				<td>job</td>
				<td><input type="text" name="job" size="10" maxlength="10"></td>
			</tr>
			<tr>
				<td>mgr</td>
				<td><input type="text" name="mgr" size="10" maxlength="10"></td>
			</tr>
			<tr>
				<td>sal</td>
				<td><input type="text" name="sal" size="10" maxlength="10"></td>
			</tr>
			<tr>
				<td>comm</td>
				<td><input type="text" name="comm" size="10" maxlength="10"></td>
			</tr>
			<tr>
				<td>deptno</td>
				<td><input type="text" name="deptno" size="10" maxlength="10"></td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="입력">
					<input type="reset" value="취소">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>