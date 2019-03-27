<%@page import="model.BoardBean"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<h2 align="center">��ü �� ����</h2>

	<%
		//[��ü �� ����]�� ����¡ ó�� ����
		BoardDAO boardDAO = new BoardDAO();
		List<BoardBean> list = new ArrayList<BoardBean>();
		//1. ȭ�鿡 ������ ������ ������ ����
		int pageSize = 10;

		//2. ���� ������ ���� �о��
		//BoardList.jsp�� ���ʷ� ȣ���ϰų� ���� �� ���� �� �Ѿ���� pageNum�� null�̹Ƿ� 1���������� ��������Ѵ�.
		String pageNum = request.getParameter("pageNum");
		
		if (pageNum == null)
			pageNum = "1";

		int totalCount = boardDAO.getAllCount(); //3. ��ü ���� ������ �����ϴ� ����
		int number = 0; //4. ������ �ѹ��� ����
		int currentPage = Integer.parseInt(pageNum); //5. ���� ������ �ϴ� ������

		//6. ���� �������� ������ ���� ��ȣ�� ����
		int startRow = (currentPage - 1) * pageSize + 1;
		int endRow = currentPage * pageSize;
		
		number = totalCount - (currentPage - 1) * pageSize;
		list = boardDAO.getAllBoard(startRow, endRow);
	%>
	<table align="center" width="800" border="1">
		<tr height="40">
			<td align="right" colspan="5">
				<button onclick="location.href='BoardWriteForm.jsp'">�� ����</button>
			</td>
		</tr>
		<tr height="40">
			<td width="50" align="center">��ȣ</td>
			<td width="350" align="center">����</td>
			<td width="150" align="center">�ۼ���</td>
			<td width="150" align="center">�ۼ���</td>
			<td width="100" align="center">��ȸ��</td>
		</tr>
		<%
			for (BoardBean boardBean : list) {
		%>
		<tr height="40">
			<td width="50" align="center"><%=number--%></td>
			<td width="350" align="left"><a
				href="BoardInfo.jsp?num=<%=boardBean.getNum()%>"
				style="text-decoration: none"> <%
 			if (boardBean.getRe_step() > 1) {
 				for (int i = 0; i < (boardBean.getRe_step() - 1) * 3; i++) {
 			%> &nbsp; <%
 				}
 			}
 			%> <%=boardBean.getSubject()%></td>
			<td width="150" align="center"><%=boardBean.getWriter()%></td>
			<td width="150" align="center"><%=boardBean.getReg_date()%></td>
			<td width="100" align="center"><%=boardBean.getReadcount()%></td>
		</tr>
		<%
			}
		%>
	</table>
	<p align="center">
		<!-- JSP �ϴܿ� ����¡ ó�� -->
		<%
			if (totalCount > 0) {
				//pageSize�� �� ������ �������� ���� ����, �������� ���� ��쿡�� (�� + 1)�� ��
				int totalPage = totalCount / pageSize + (totalCount % pageSize == 0 ? 0 : 1);

				//���� ������ ���ڸ� �����Ѵ�.
				int pageBlock = 10;
				int startPage = 1;
				if (currentPage % pageBlock != 0) {
					startPage = (int) (currentPage / pageBlock) * pageBlock + 1;
				} else {
					startPage = (int) (currentPage / pageBlock - 1) * pageBlock + 1;
				}

				int endPage = startPage + pageBlock - 1; //ȭ�鿡 ������ ������ ������ ����
				if (endPage > totalPage)
					endPage = totalPage;

			if (startPage > pageBlock) {
		%>
		<a href="BoardList.jsp?pageNum=<%=startPage - pageBlock%>">[����]</a>
		<%
			}
				for (int i = startPage; i <= endPage; i++) {
		%>
		<a href="BoardList.jsp?pageNum=<%=i%>">[<%=i%>]
		</a>
		<%
			}
				if (endPage < totalPage) {
		%>
		<a href="BoardList.jsp?pageNum=<%=startPage + pageBlock%>">[����]</a>
		<%
			}
		}
		%>
	
</body>
</html>