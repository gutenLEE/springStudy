<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page session  = "true" %>
<html>
<head>
	<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
	<title>Home</title>
	<style>

		#trigger{
			display : inline;
			background : gold;
			padding : 5px;
			border-radius : 2px;
			color : dodgerblue;
			font-size : 2em;
		}
		#trigger:hover{
			background : black;
		}
		#chatFrame{
			border : none;
		}
		#box{
			display :flex;
			width : 30vw;
			flex-direction : column;
			justify-content : center;
			align-items: center;
		}
	</style>


</head>
<body>
	<div id="box"> 
		<div id="trigger">채팅 시작</div>
		<form action="">
			id : <input type="text" name = "id" id = "id" />
		</form>
	</div>

	<div class="container"></div>
	
	<script>
	
		function callIframe(){
			
			var Id = document.querySelector('#id').value;
			
			var IframeElem = document.createElement('iframe');
			var containerOfiframe = document.querySelector('.container');
			
			IframeElem.src = "./chat.do";
			IframeElem.id = "chatFrame";
			IframeElem.name = "iframe";
			IframeElem.width="380px";
			IframeElem.height = "580px";
			IframeElem.style = "border-radius : 8px";
			containerOfiframe.appendChild(IframeElem);
		};
	
		
		const AnchorElem = document.querySelector('#trigger');
		
		AnchorElem.addEventListener('click', function(event, AnchorElem){
			callIframe();
		});
		
		
		
	</script>
</body>
</html>
