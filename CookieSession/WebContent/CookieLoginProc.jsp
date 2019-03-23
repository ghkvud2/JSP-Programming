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
		request.setCharacterEncoding("EUC-KR");
		String save = request.getParameter("save");
		String id = request.getParameter("id");
		if (save != null) {
			Cookie cookie = new Cookie("id", id);
			cookie.setMaxAge(60 * 3); // 3 minutes
			response.addCookie(cookie);
			out.write("쿠키 설정 완료");
		}
	%>

</body>
</html>