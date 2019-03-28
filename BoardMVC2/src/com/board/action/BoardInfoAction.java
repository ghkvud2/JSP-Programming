package com.board.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class BoardInfoAction implements Action {

	private static BoardInfoAction boardInfoAction;
	static {
		boardInfoAction = new BoardInfoAction();
	}

	private BoardInfoAction() {
	}

	public static BoardInfoAction getInstance() {

		if (boardInfoAction == null)
			boardInfoAction = new BoardInfoAction();

		return boardInfoAction;
	}

	@Override
	public String action(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		 
		return null;
	}

}
