package com.board.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.board.model.bean.BoardBean;
import com.board.model.service.BoardServiceImpl;

public class BoardListAction implements Action {

	private static BoardListAction boardListAction;
	static {
		boardListAction = new BoardListAction();
	}

	private BoardListAction() {
	}

	public static BoardListAction getInstance() {

		if (boardListAction == null)
			boardListAction = new BoardListAction();

		return boardListAction;
	}

	@Override
	public String action(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		List<BoardBean> list = BoardServiceImpl.getInstance().getAllBoard();
		request.setAttribute("list", list);
		return "move_list.do";
	}

}
