<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

	<h2>�� �������� �α��� ������ �Ѿ���� �������Դϴ�.</h2>

	<%
		//request.setCharacterEncoding("EUC-KR");
		//String id = request.getParameter("id");
		//String pass = request.getParameter("pass");
		//response.sendRedirect("ResponseRedirect.jsp?id=" + id + "&pass=" + pass);
	%>
	<jsp:forward page="ResponseRedirect.jsp">
		<jsp:param value="mmmm" name="id" />
	</jsp:forward>

	<h3>������ �Ѿ�����?</h3>

</body>
</html>