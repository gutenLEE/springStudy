<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style>
body{
	background : pink;
}
#output{
	width : 90%;
	height : 80vh;
	border : none;
	background: white;
	z-index : 1000;
}
.container{
	position : relative;
	top : 510px;
}
</style>
</head>
<body>
		<div class="container">
			<input type="text" id="input" placeholder="input message....." size="40"/>
			<button id="send_button">Send</button>
		</div>
		<div id="output" ></div>
</body>
</html>