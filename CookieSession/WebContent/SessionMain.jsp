<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<%
	String center = request.getParameter("center");

	if (center == null) {
		center = "Center.jsp";
	}
	System.out.println("center : " + center);
%>
<body>
	<table align="center" width="800" border="1">
		<tr height="150">
			<td align="center" colspan="2"><jsp:include page="Top.jsp" />
		</tr>

		<tr height="400">
			<td align="center" width="200"><jsp:include page="Left.jsp" /></td>
			<td align="center" width="600"><jsp:include page="<%=center%>" /></td>
		</tr>

		<tr height="100">
			<td align="center" colspan="2"><jsp:include page="Bottom.jsp" /></td>
		</tr>
	</table>
</body>
</html>