<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
  <link rel="stylesheet" href="reset.css">
    <style>
        .main-container{
            background:#262626;
            width: 500px;
            height: 600px;
            position: relative;
            margin: 0 auto;
            margin-top: 23px;
            border-radius: 8px;
        }
        .element {
		  clip: rect(10px, 20px, 30px, 40px);
		}
		.box{
			margin: 0 auto;
			padding-top: 100px;
			color : white;
			display : flex;
			flex-direction : column;
			justify-content : center;
			align-items: center;
			
			width : 200px;
		}
		input{
			background : #262626;
			border : none;
			border-bottom : 1px solid rgba(234, 212, 3, 0.2);
			line-height : 40px;
			font-size : 1em;
			color: white;
		}
		input[type="submit"]{
			color: gold;
			text-decoration : none;
			padding-top: 10px;
		}
    </style>
</head>
<body>
  <section>
      <div class="main-container">
      	<form action="/mychat/room.do" name="loginform" method="post">
      		<div class="box">      		
	      		<input type="text" name ="id"  id="id"  placeholder="닉네임을 입력하세요" autocomplete="on"/>
	      		<input type="password" name ="pw" id="pw"  placeholder="비밀번호를 입력하세요"/>
	      		<input type="submit" value="들어가기" />
      		</div>
      	</form>
      </div>
  </section>
</body>
</html>