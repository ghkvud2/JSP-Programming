<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
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
		String[] hobbys = request.getParameterValues("hobby");

		String textHobby = "";
		for (String hobby : hobbys)
			textHobby += hobby + " ";
	%>
	<jsp:useBean id="member" class="model.Member">
		<jsp:setProperty name="member" property="*" />
		<jsp:setProperty name="member" property="hobby" value="<%=textHobby%>" />
	</jsp:useBean>

	<%
		String DB_DRIVER_CLASS = "oracle.jdbc.driver.OracleDriver";
		String DB_URL = "jdbc:oracle:thin:@localhost:1521:orcl";
		String DB_USERNAME = "ghkvud";
		String DB_PASSWORD = "ghkvud";

		try {
			Class.forName(DB_DRIVER_CLASS);
			Connection conn = DriverManager.getConnection(DB_URL, DB_USERNAME, DB_PASSWORD);
			String sql = "insert into member values(?,?,?,?,?,?,?,?)";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			int idx = 1;
			pstmt.setString(idx++, member.getId());
			pstmt.setString(idx++, member.getJob());
			pstmt.setString(idx++, member.getAge());
			pstmt.setString(idx++, member.getPass1());
			pstmt.setString(idx++, member.getInfo());
			pstmt.setString(idx++, member.getEmail());
			pstmt.setString(idx++, member.getTel());
			pstmt.setString(idx++, member.getHobby());
			
			pstmt.executeUpdate();
			
			conn.close();

		} catch (Exception e) {
			e.printStackTrace();
		}
	%>
	오라클 접속 완료

</body>
</html>