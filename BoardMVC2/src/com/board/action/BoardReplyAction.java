package com.board.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class BoardReplyAction implements Action {

	private static BoardReplyAction boardReplyAction;
	static {
		boardReplyAction = new BoardReplyAction();
	}

	private BoardReplyAction() {
	}

	public static BoardReplyAction getInstance() {

		if (boardReplyAction == null)
			boardReplyAction = new BoardReplyAction();

		return boardReplyAction;
	}
	
	
	@Override
	public String action(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		return null;
	}

}
