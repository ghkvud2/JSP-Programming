package com.board.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class BoardUpdateAction implements Action {

	private static BoardUpdateAction boardUpdateAction;
	static {
		boardUpdateAction = new BoardUpdateAction();
	}

	private BoardUpdateAction() {
	}

	public static BoardUpdateAction getInstance() {

		if (boardUpdateAction == null)
			boardUpdateAction = new BoardUpdateAction();

		return boardUpdateAction;
	}

	@Override
	public String action(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		return null;
	}

}
