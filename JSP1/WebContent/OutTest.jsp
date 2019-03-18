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
	String name = "알리미 어플";
%>

<%=name %>이 화면에 출력 [스크립트릿으로 표현]
<p>
<%
	out.println(name+ "이 화면에 출력 [out객체 이용]");
%>

</body>
</html>