
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<html>
<head>
<title>Home</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">

	function selectEmp() {
		$('#output').empty();
		var params = {"str" : "aaaa"};
		$.ajax({
		     url :'/ajax2/setEmpJSON.me',
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
		});
		/* $.ajax({
			url : '/ajax2/getEmp.me',
			type : 'POST',
			//dataType : 'json', //서버에서 보내줄 데이터 타입
			contentType : 'application/x-www-form-urlencoded;charset=utf-8',
			success : function(data) {
				$.each(data, function(index, item) {
					var output = '';
					output += '<tr align="center">';
					output += '<td>' + item.empno + '</td>';
					output += '<td>' + item.ename + '</td>';
					output += '<td>' + item.job + '</td>';
					output += '<td>' + item.mgr + '</td>';
					output += '<td>' + item.hiredate + '</td>';
					output += '<td>' + item.sal + '</td>';
					output += '<td>' + item.comm + '</td>';
					output += '<td>' + item.deptno + '</td>';
					output += '</tr>';
					console.log("output:" + output);
					$('#output').append(output);
				});
			},
			error : function() {
				 
				alert("ajax통신 실패1")

			}

		}); */
	}
	$(document).ready(function() {

		selectEmp();
	});
</script>

</head>

<body>
	<h1>Hello world!</h1>

	<form>
		<div class="container">

			<input type="checkbox" name="job" id="salesman" value="salesman" />
			<label for="salesman"> salesman</label> <input type="checkbox"
				name="job" id="clerk" value="clerk" /> <label for="salesman">
				clerk</label> <input type="checkbox" name="job" id="analyst" value="analyst" />
			<label for="salesman"> analyst</label> <input type="checkbox"
				name="job" id="manager" value="manager" /> <label for="salesman">
				manager</label>
		</div>
		<div class="container">
			<input type="checkbox" name="deptno" id="dallas" value="10" /> <label
				for="salesman"> 10</label> <input type="checkbox" name="deptno"
				id="chicago" value="20" /> <label for="salesman"> 20</label> <input
				type="checkbox" name="deptno" id="newyork" value="30" /> <label
				for="salesman"> 30</label> <input type="submit" value="조회" />
		</div>
	</form>
	<form method="post">
	<table border="1">
		<tr>
			<td>Empno</td>
			<td>Ename</td>
			<td>Job</td>
			<td>Mgr</td>
			<td>Hiredate</td>
			<td>Sal</td>
			<td>Comm</td>
			<td>Deptno</td>
		</tr>
	</table>
		<table id="output" border="1"></table>
	</form>
</body>
</html>