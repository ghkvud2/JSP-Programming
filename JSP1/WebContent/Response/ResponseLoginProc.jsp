<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<!--���ۿ� HTML ������ ����Ǳ� ������ response��ü ������ <h2>�� ������ �ʴ´�.  -->
	<h2>�α��� ó�� ������</h2>
	<%
		request.setCharacterEncoding("EUC-KR");
		//������ ����� ���̵�/��й�ȣ
		String dbid = "aaaa";
		String dbpass = "1234";

		String id = request.getParameter("id");
		String pass = request.getParameter("pass");

		//���̵�� �н����尡 ��ġ�ϸ� ������������ �̵���Ų��.
		if (dbid.equals(id) && dbpass.equals(pass)) {
			response.sendRedirect("ResponseMain.jsp?id=" + id);
		} else {
	%>
		<script type="text/javascript">
			alert("���̵�� �н����尡 ��ġ���� �ʽ��ϴ�.");
			history.go(-1);
		</script>
	<%
		}
	%>

</body>
</html>