package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import code.ValidationCode;
import exception.CustomException;

@WebServlet("/WCC1Controller")
public class WCC1Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("\n\n=========[GET]==========");
		execute(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("\n\n=========[POST]==========");
		execute(request, response);
	}

	private void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		response.setContentType("text/html");
		response.setCharacterEncoding("euc-kr");
		String LOC_GOV_CD = request.getParameter("LOC_GOV_CD");
		String DAT_DIS = request.getParameter("DAT_DIS");
		String FIN_DIS = request.getParameter("FIN_DIS");
		try {
			response.setContentType("text/html");
			response.setCharacterEncoding("utf-8");
			boolean flag = true;
			if (flag)
				throw new CustomException(ValidationCode.LOC_GOV_CD_ERROR);

		} catch (CustomException e) {
			System.out.println("[컨트롤러]");
			String result = "LOC_GOV_CD=" + LOC_GOV_CD + "&DAT_DIS=" + DAT_DIS + "&FIN_DIS=" + FIN_DIS + "&CODE=" + e.getCode() + "&MESSAGE=" + e.getMessage();
			response.getWriter().write(result);
		}
	}

}
