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
		<h2>ȸ�� ���� ����</h2>
		<%
			//POST ������� �����Ͱ� �Ѿ�� �� �ѱ��� ���� �� �־
			request.setCharacterEncoding("EUC-KR");

			String id = request.getParameter("id");
			String pass1 = request.getParameter("pass1");
			String pass2 = request.getParameter("pass2");
			String email = request.getParameter("email");
			String tel = request.getParameter("tel");
			String[] hobbys = request.getParameterValues("hobby");
			String job = request.getParameter("job");
			String age = request.getParameter("age");
			String info = request.getParameter("info");

			if (!pass1.equals(pass2)) {
		%>
		<script type="text/javascript">
			alert("��й�ȣ�� Ʋ���ϴ�.");
			history.go(-1);
		</script>
		<%
			}
		%>

		<table width="500" border="1">
			<tr height="50">
				<td width="150" align="center">���̵�</td>
				<td width="350"><%=id%></td>
			</tr>
			<tr height="50">
				<td width="150" align="center">�н�����</td>
				<td width="350"><%=pass1%></td>
			</tr>
			<tr height="50">
				<td width="150" align="center">�̸��� �ּ�</td>
				<td width="350"><%=email%></td>
			</tr>
			<tr height="50">
				<td width="150" align="center">��ȭ��ȣ</td>
				<td width="350"><%=tel%></td>
			</tr>
			<tr height="50">
				<td width="150" align="center">����� ���ɺо�</td>
				<td width="350">
				<%for(int i = 0 ; i < hobbys.length; i++){
					out.write(hobbys[i] +" ");
				} %>
				</td>
			</tr>
			<tr height="50">
				<td width="150" align="center">����</td>
				<td width="350"><%=job%></td>
			</tr>
			<tr height="50">
				<td width="150" align="center">����</td>
				<td width="350"><%=age%></td>
			</tr>
			<tr height="50">
				<td width="150" align="center">�ϰ���� ��</td>
				<td width="350"><%=info%></td>
			</tr>
		</table>
	</center>

</body>
</html>