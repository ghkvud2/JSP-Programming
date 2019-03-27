<%@page import="model.Member"%>
<%@page import="java.util.List"%>
<%@page import="model.MemberDAO"%>
<%@page import="com.sun.swing.internal.plaf.metal.resources.metal"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<%
		MemberDAO memberDAO = new MemberDAO();
		List<Member> list = memberDAO.selectAllMember();
		request.setAttribute("list", list);
	%>
	<h2 align="center">��� ȸ�� ���� ����</h2>
	<table align="center" width="800" border="1">
		<tr height="50">
			<td align="center" width="150">���̵�</td>
			<td align="center" width="250">�̸���</td>
			<td align="center" width="200">��ȭ��ȣ</td>
			<td align="center" width="200">���</td>
		</tr>
		<c:forEach var="memberBean" items="${list}">
			<tr height="50">
				<td align="center" width="150"><a
					href="MemberInfo.jsp?id=${memberBean.id }">${memberBean.id}</a></td>
				<td align="center" width="250">${memberBean.email }</td>
				<td align="center" width="200">${memberBean.tel }</td>
				<td align="center" width="200">${memberBean.hobby }</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>