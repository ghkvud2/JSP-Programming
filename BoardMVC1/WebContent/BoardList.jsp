<%@page import="model.BoardBean"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<%
		//전체 게시글의 목록을 JSP로 불러와야함
		BoardDAO boardDAO = new BoardDAO();
		List<BoardBean> list = boardDAO.getAllBoard();
	%>

	<h2 align="center">전체 글 보기</h2>
	<table align="center" width="800" border="1">
		<tr height="40">
			<td width="50" align="center">번호</td>
			<td width="350" align="center">제목</td>
			<td width="150" align="center">작성자</td>
			<td width="150" align="center">작성일</td>
			<td width="100" align="center">조회수</td>
		</tr>
		<%
			for (BoardBean boardBean : list) {
		%>
		<tr height="40">
			<!-- 글 번호는 게시판 카운터를 구현하면서 같이 구현합니다.  -->
			<td width="50" align="center">나중에 구현</td>
			<td width="350" align="left"><a
				href="BoardInfo.jsp?num=<%=boardBean.getNum()%>"><%=boardBean.getSubject()%></td>
			<td width="150" align="center"><%=boardBean.getWriter()%></td>
			<td width="150" align="center"><%=boardBean.getReg_date()%></td>
			<td width="100" align="center"><%=boardBean.getReadcount()%></td>
		</tr>
		<%
			}
		%>
		<tr height="40">
			<td align="center" colspan="5">
			<button onclick="location.href='BoardWriteForm.jsp'">글 쓰기</button>
			</td>
		</tr>
	</table>
</body>
</html>