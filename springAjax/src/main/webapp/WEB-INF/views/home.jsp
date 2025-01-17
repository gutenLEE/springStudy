<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>Home</title>
	
<style>
	form{
		width : 600px;
		margin : 10px auto;
	}
	ul{
		padding : 0;
		margin : 0;
		list-style : none;
	}
	ul li{
		padding : 0;
		margin : 0 0 10px 0;
	}
	label{
		width : 150px;
		float : left;
	}
	table{
		border : 1px solid gray;
		margin: 0 auto;
		border-collapse: collapse;
		width : 600px
	}
	td{
		border : 1px solid black;
	}
	a{
		margin: 0 5px;
	}
	.tt{
		width : 90px
	}
</style>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
	
	//목록
	function selectData(){
		
		$('#output').empty(); // table 내부 내용을 제거 (초기화)
		
		$.ajax({
			url : '/springAjax/getPeopleJSON.do', 
			type : 'POST', //-> post는 form태그의 method가 post일때.  
			// datatype : 'json', 서버에서 보내줄 데이터 타입
			contentType : 'application/x-www-form-urlencoded;charset=utf-8',
			
			success :function(data){ // 콜백 함수
				$.each(data, function(index, item){
					output = ''
					output += '<tr id="row">';
					output += '<td>' + item.id + '</td>';
					output += '<td>' + item.name + '</td>';
					output += '<td>' + item.job + '</td>';
					output += '<td>' + item.address + '</td>';
					output += '<td>' + item.bloodtype + '</td>';
					output += '<td><a href="/springAjax/deletePeople.do" ';
					output += "class=delete_data ";
					output += 'id=' + item.id + '>삭제</a>';
					output += '<a onclick="test(event)">수정</a></td>';
					output += '</tr>';
					console.log("output = " + output);
					$('#output').append(output);
				});
			},
			error:function(){
				alert(" selectData() ajax 통신 실패");
			}

		});
	}
	/*output += '<a a href="/springAjax/updatePeople.do" class="update_date" id='+item.id+'>수정</a></td>'; */
	/*
	(참고) 파일 첨부시 필요함
	- cache : false 로 선언 시 ajax로 통신 중 cache가 넘어가 갱신된 데이터를 받아오지 못할 경우를 대비
	- content type : false로 선언 시 content-type 헤더가 multipart/form-data로 전송되게 함
	- processData : false로 선언 시 formData를 String으로 변환하지 않음
	*/
	
	function test(event){
		
		const trElem = event.target.parentNode.parentNode;
		console.log(event);
		console.log(this);

 		let arr = trElem.querySelectorAll("td");
 		
		hiddenInput = document.createElement('input');
		hiddenInput.type = 'hidden';
		hiddenInput.name = 'id';
		hiddenInput.value = arr[0].outerText;
 		arr[0].append(hiddenInput);
 		
 		name = arr[1].innerText;
 		job = arr[2].innerText;
 		address = arr[3].innerText;
 		bloodtype = arr[4].innerText;
 		
		arr[1].innerText='';
		arr[1].innerHTML = '<input type="text" name="name" placeholder="'+ name + '"class="tt"/>';
		arr[2].innerText='';
		arr[2].innerHTML = '<input type="text" name="job" placeholder="'+ job + '" class="tt"/>';
		arr[3].innerText='';
		arr[3].innerHTML = '<input type="text" name="address" placeholder="'+ address + '" class="tt"/>';
		arr[4].innerText=''
		arr[4].innerHTML = '<input type="text" name="bloodtype" placeholder="'+ bloodtype + '"  class="tt"/>';
		arr[5].innerText='';
		arr[5].innerHTML = '<a href="/springAjax/updatePeople.do" id="update_btn">수정</a>'
							+'<a onclick="selectData();">목록</a>'; 
	}
	
	///springAjax/updatePeople.do
	$(document).ready(function(){
		
		$(document).on('click', '#update_form', function(event){

			if(event.target.innerHTML == "수정"){
				var params = $(this).serialize();
				console.log('param + ' + params);
				
 				$.ajax({
					url : $('#update_btn').attr('href'),
					type : 'POST',
					data : params,
					contentType : 'application/x-www-form-urlencoded;charset=utf-8',
					dataType : 'json', //서버에서 보내줄 데이터 타입
					success: function(retVal){
						if(retVal.res=="OK"){
							selectData();
						}
						else{
							alert('update fail');
						}
					},
					error: function(){
						alert("insert ajax통신 실패!!!");
					}
				}); // ajax(); 
			// 기본 이벤트 제거
			event.preventDefault();
			}
 			else if(event.target.innerHTML == "목록"){
 				selectData();
			}
			event.preventDefault();
		});

		$('#input_data').click(function(event){
			
			var params = $('#insert_form').serialize(); // 주어진 데이터를 key-value로 직렬화해서 읽어오겠다.
			alert(params);
			
			jQuery.ajax({ // = $.ajax
				url : '/springAjax/insertPeople.do',
				type : 'POST',
				data : params, // 서버로 보낼 데이터
	
				contentType : 'application/x-www-form-urlencoded;charset=utf-8',
				dataType : 'json', //서버에서 보내줄 데이터 타입
				success: function(retVal){
				   if(retVal.res=="OK"){
				      //데이터 성공일 때 이벤트 작성
				      selectData();
				      //초기화
				      $('#id').val('');
				      $('#name').val('');
				      $('#job').val('');
				      $('#address').val('');
				      $('#bloodtype').val('');
				   }
				   else{
				      alert("Insert Fail!!!");
				   }
				},
				error:function(){
				   alert("insert ajax통신 실패!!!");
				}

			});
			// 기본 이벤트 제거
			event.preventDefault();
		});
		
		$(document).on('click', '.delete_data', function(event){
			jQuery.ajax({
				url : $(this).attr('href'),
				type : 'POST',
				data : {'id' : $(this).attr("id")}, // 속성값 읽어오기 
				// 서버로 보낼 데이터
				contentType : 'application/x-www-form-urlencoded;charset=utf-8',
				dataType : 'json',
				success : function(retVal){
					if(retVal.res == "OK"){
						selectData();
					}
					else{
						alert("delete Fail !!!");
					}
				},
				error : function(){
					alert("delete ajax 통신 실패 !");
				}
			});
			//기본 이벤트 제거
			event.preventDefault();
		});
		
		selectData();

	});
</script>
</head>
	<form id="insert_form" method="post">
		<fieldset>
			<legend>데이터 추가</legend>
			<ul>
				<li>
					<label for="id">아이디</label>
					<input type="text" name="id" id="id"/>
				</li>
				<li>
					<label for="name">이름</label>
					<input type="text" name="name" id="name"/>
				</li>
				<li>
					<label for="job">직업</label>
					<input type="text" name="job" id="job"/>
				</li>
				<li>
					<label for="address">주소</label>
					<input type="text" name="address" id="address"/>
				</li>		
				<li>
					<label for="bloodtype">혈액형</label>
					<input type="text" name="bloodtype" id="bloodtype"/>
				</li>	
				<li>
					<input type="button" value="추가" id="input_data"/>
				</li>		
			</ul>
		</fieldset>
	</form>
	<form id="update_form" method="post">
	   <table id="output"></table>
	</form>

<body>
<h1>
	Hello world!  
</h1>

<P>  The time on the server is ${serverTime}. </P>
</body>
</html>
