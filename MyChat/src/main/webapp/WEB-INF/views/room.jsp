<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
 <!--  <link rel="stylesheet" href="reset.css"> -->
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
			padding-top: 50px;
			color : white;
			display : flex;
			flex-direction : column;
			justify-content : center;
			align-items: center;

		}
		input{
			background : #262626;
			border : none;
			border-bottom : 1px solid rgba(234, 212, 3, 0.2);
			line-height : 40px;
			font-size : 1em;
			color: white;
		}
		a{
			color: gold;
			text-decoration : none;
			padding-top: 10px;
		}

		th{
			border : 1px solid rgba(234, 212, 3, 0.2);
			width : 80px;
		}
    </style>
    <%
    	String id = (String)session.getAttribute("id");
     	String pw = (String)session.getAttribute("pw");
    %>
    <script>
    var socket = null;
    
    function connect(){
    	
		/* ws : 웹 소켓 변환.  <websocket:mapping handler="socketHandler" path="/boardcasting.do"/>  요 path로 요청이 들어오면 socketHandler가 실행된다. */
		w = new WebSocket("ws://localhost:8080/mychat/boardcasting.do");
		socket = w;
		/* on이 붙으면 해당 이벤트가 발생시 자동 호출되는 메서드다. */
		w.onopen = function(e){
			alert('WebSocket connected !');
			console.log(e);
			w.onmessage = function(e){ //여기서 메세지 전달 받는다. event 객체의 data 있따. 
				console.log(e); // messageEvent
				log(e.data.toString()); // log라는 이름으로 정의해준 익명함수 
			}			
		}
		w.onclose = function(e){ 
			log('webSocket closed');
		}
		w.onerror = function(e){
			log("webSocket error !! : " + e.data);
		}
    }
	
	(function(){

		connect();
	})();
    </script>
</head>
<body>
  <section>
      <div class="main-container">
			<table class="box">
				<tr>
					<th>닉네임</th>
					<th>상태</th>
					<th style="width :150px;">메세지 보내기</th>
					<th style="width : 100px;">받은 메세지</th>
				</tr>
			</table>
      </div>
  </section>
  
 <script>
 	const parent = document.querySelector('.box');
 	var boxElem = document.createElement('tr'); 	
 	var text = '<th>' + '<%=id %>' + '</th>' +
 				'<th id="state-round">' + '●' + '</th>' +
 				'<th style="width :150px;"><a href="#">Send</a></th>' +
 				'<th style="width :100px;">0</th>';
 	boxElem.innerHTML = text;
 	parent.append(boxElem);
 	
 	
 </script>
</body>
</html>