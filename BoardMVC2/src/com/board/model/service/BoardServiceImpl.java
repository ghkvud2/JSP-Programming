package com.board.model.service;

import java.util.List;

import com.board.model.bean.BoardBean;
import com.board.model.dao.BoardDAOImpl;

public class BoardServiceImpl implements BoardService {

	private static BoardServiceImpl boardServiceImpl;

	static {
		boardServiceImpl = new BoardServiceImpl();
	}

	private BoardServiceImpl() {
	}

	public static BoardServiceImpl getInstance() {
		if (boardServiceImpl == null)
			boardServiceImpl = new BoardServiceImpl();
		return boardServiceImpl;
	}

	@Override
	public void deleteBoard(int num) {
		// TODO Auto-generated method stub

	}

	@Override
	public void updateBoard(BoardBean boardBean) {
		// TODO Auto-generated method stub

	}

	@Override
	public void replyBoard(BoardBean boardBean) {
		// TODO Auto-generated method stub

	}

	@Override
	public void writeBoard(BoardBean boardBean) {
		BoardDAOImpl.getInstance().writeBoard(boardBean);
	}

	@Override
	public BoardBean getOneBoard(int num) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<BoardBean> getAllBoard() {
		return BoardDAOImpl.getInstance().getAllBoard();
	}

}
