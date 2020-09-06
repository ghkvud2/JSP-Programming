package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import code.ValidationCode;
import exception.CustomException;

@WebServlet("/WCC2Controller")
public class WCC2Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		execute(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		execute(request, response);
	}

	private void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		response.setCharacterEncoding("utf-8");
		String LOC_GOV_CD = request.getParameter("LOC_GOV_CD");
		String DAT_DIS = request.getParameter("DAT_DIS");
		String FIN_DIS = request.getParameter("FIN_DIS");
		boolean flag = true;
		if (flag)
			throw new CustomException(ValidationCode.LOC_GOV_CD_ERROR);
	}

}
