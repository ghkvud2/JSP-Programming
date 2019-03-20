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
		<h2>회원정보 보기</h2>
		<%
			request.setCharacterEncoding("EUC-KR");
		%>
	<jsp:useBean id="mbean" class="bean.MemberBean">
		<jsp:setProperty name="mbean" property="*"/>
	</jsp:useBean>
	
	<h1>useBean사용</h1>
	<h3>아이디 : <jsp:getProperty property="id" name="mbean"/></h3>
	<h3>비밀번호 : <jsp:getProperty property="pass" name="mbean"/></h3>
	<h3>이메일 : <jsp:getProperty property="email" name="mbean"/></h3>
	<h3>주소 : <jsp:getProperty property="address" name="mbean"/></h3>
	<h3>핸드폰 : <jsp:getProperty property="tel" name="mbean"/></h3>
	<br>
	<h1>선언문 사용</h1>
	<h3>아이디 : <%=mbean.getId() %></h3>
	<h3>비밀번호 : <%=mbean.getPass() %></h3>
	<h3>이메일 : <%=mbean.getEmail() %></h3>
	<h3>주소 : <%=mbean.getAddress() %></h3>
	<h3>핸드폰 : <%=mbean.getTel() %></h3>
	
	
	
	</center>
</body>
</html>