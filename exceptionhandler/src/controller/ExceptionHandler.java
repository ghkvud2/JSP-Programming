package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import exception.CustomException;

public class ExceptionHandler extends HttpServlet {
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		execute(request, response);
//		
//		// Analyze the servlet exception
//		Throwable throwable = (Throwable) request.getAttribute("javax.servlet.error.exception");
//		Integer statusCode = (Integer) request.getAttribute("javax.servlet.error.status_code");
//		String servletName = (String) request.getAttribute("javax.servlet.error.servlet_name");
//
//		if (servletName == null) {
//			servletName = "Unknown";
//		}
//		String requestUri = (String) request.getAttribute("javax.servlet.error.request_uri");
//
//		if (requestUri == null) {
//			requestUri = "Unknown";
//		}
//
//		// Set response content type
//		response.setContentType("text/html");
//
//		PrintWriter out = response.getWriter();
//		String title = "Error/Exception Information";
//		String docType = "<!doctype html public \"-//w3c//dtd html 4.0 " + "transitional//en\">\n";
//
//		out.println(docType + "<html>\n" + "<head><title>" + title + "</title></head>\n" + "<body bgcolor = \"#f0f0f0\">\n");
//
//		if (throwable == null && statusCode == null) {
//			out.println("<h2>Error information is missing</h2>");
//			out.println("Please return to the <a href=\"" + response.encodeURL("http://localhost:8080/") + "\">Home Page</a>.");
//		} else {
//			out.println("<h2>Error information</h2>");
//			out.println("Servlet Name : " + servletName + "</br></br>");
//			out.println("Exception Type : " + throwable.getClass().getName() + "</br></br>");
//			out.println("The request URI: " + requestUri + "<br><br>");
//			out.println("The exception message: " + throwable.getMessage());
//			out.println("The attr: " + request.getParameter("attr"));
//		}
//		out.println("</body>");
//		out.println("</html>");
	}

	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		execute(request, response);
//		doGet(request, response);
	}

	private void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String requestUri = (String) request.getAttribute("javax.servlet.error.request_uri");
		Throwable throwable = (Throwable) request.getAttribute("javax.servlet.error.exception");
		CustomException customException = (CustomException) throwable;
		String LOC_GOV_CD = request.getParameter("LOC_GOV_CD");
		String DAT_DIS = request.getParameter("DAT_DIS");
		String FIN_DIS = request.getParameter("FIN_DIS");
		try {
			System.out.println("[요청 URI] : " + requestUri);
			System.out.println("[발생 예외] : " + throwable.getClass().getName());
			System.out.println("[코드] : " + customException.getCode());
			System.out.println("[메시지] : " + customException.getMessage());

		} catch (Throwable e) {
			System.out.println("[요청 URI] : " + requestUri);
			System.out.println("[발생 예외] : " + throwable.getClass().getName());
			System.out.println("[코드] : " + customException.getCode());
			System.out.println("[메시지] : " + customException.getMessage());
		}
		response.setContentType("text/html");
		response.setCharacterEncoding("euc-kr");
		String result = "LOC_GOV_CD=" + LOC_GOV_CD + "&DAT_DIS=" + DAT_DIS + "&FIN_DIS=" + FIN_DIS + "&CODE=" + customException.getCode() + "&MESSAGE=" + customException.getMessage();
		response.getWriter().write(result);
	}
}
