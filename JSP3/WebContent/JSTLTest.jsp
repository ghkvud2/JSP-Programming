<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

	<!-- ���������ϱ� -->

	<!-- if�� ����ϱ�  -->
	<c:if test="${i>3}">
		�ȳ��ϼ��� <br>
	</c:if>
	
	
	<c:forEach begin="1" end="10" >
		�׽�Ʈ�Դϴ�. <br>
	</c:forEach>
	
	<c:forEach var="i" begin="1" end="10">
		<c:set var="sum" value="${sum + i }"/>
	</c:forEach>
	sum : ${sum }

</body>
</html>