<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="java.util.ArrayList"%>
<%
	ArrayList<String> title = (ArrayList<String>) request.getAttribute("title");
//	ArrayList<String> title_link = (ArrayList<String>) request.getAttribute("title_link");

	ArrayList<String> rank1 = (ArrayList<String>) request.getAttribute("rank1");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>네이버 스포츠 뉴스 크롤링</title>
<style>
	td{
		text-align : center;
	}
</style>
</head>
<body>
	<br />
	<table border="0" align="center">
		<tr align="center">
			<td><a href="/ccrwaling/crawl2.do">순위</a></td>
			<td><a href="/crwaling/crawl2.do?index=1">퍙점순(현재 상영작)</a></td>
			<td><a href="/crwaling/crawl2.do?index=2">평점순</a></td>
		</tr>
		 <tr align="center">
		<%
			for (int i=0; i<title.size(); i++)
			{
		%>
	      	<td><%=title.get(i).toString()%></td>
		<%
			}
		%>
	 	</tr>
		<tr align="center">
			<td>순위</td>
			<td>영화제목</td>
			<td>평점</td>
		</tr>

		<%
			for (int i = 0; i < rank1.size(); i++) {
		%>
		<tr>
			<td><%=i + 1%>위 &nbsp;</td>
			<td><%=rank1.get(i).toString()%></td>
		</tr>
		<%
			}
		%>
	</table>
</body>
</html>