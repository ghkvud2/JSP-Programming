<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<center>
		<h2>ȸ������ ����</h2>
		<%
			request.setCharacterEncoding("EUC-KR");
		%>
	<jsp:useBean id="mbean" class="bean.MemberBean">
		<jsp:setProperty name="mbean" property="*"/>
	</jsp:useBean>
	
	<h1>useBean���</h1>
	<h3>���̵� : <jsp:getProperty property="id" name="mbean"/></h3>
	<h3>��й�ȣ : <jsp:getProperty property="pass" name="mbean"/></h3>
	<h3>�̸��� : <jsp:getProperty property="email" name="mbean"/></h3>
	<h3>�ּ� : <jsp:getProperty property="address" name="mbean"/></h3>
	<h3>�ڵ��� : <jsp:getProperty property="tel" name="mbean"/></h3>
	<br>
	<h1>���� ���</h1>
	<h3>���̵� : <%=mbean.getId() %></h3>
	<h3>��й�ȣ : <%=mbean.getPass() %></h3>
	<h3>�̸��� : <%=mbean.getEmail() %></h3>
	<h3>�ּ� : <%=mbean.getAddress() %></h3>
	<h3>�ڵ��� : <%=mbean.getTel() %></h3>
	
	
	
	</center>
</body>
</html>