<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<h2>SessionName �������Դϴ�.</h2>
	<%
		String name = (String)session.getAttribute("name");
	%>
	<h3><%=name %>�� �ݰ����ϴ�.</h3>
</body>
</html>