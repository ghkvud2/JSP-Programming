package com.board.model.dao;

import java.util.List;

import com.board.model.bean.BoardBean;

public interface BoardDAO {

	public void deleteBoard(int num);

	public void updateBoard(BoardBean boardBean);

	public void replyBoard(BoardBean boardBean);

	public void writeBoard(BoardBean boardBean);

	public BoardBean getOneBoard(int num);

	public List<BoardBean> getAllBoard();

}
