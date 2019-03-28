package com.board.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.board.model.bean.BoardBean;
import com.board.util.DBClose;
import com.board.util.DBConnection;

public class BoardDAOImpl implements BoardDAO {

	private static BoardDAOImpl boardDAOImpl;

	static {
		boardDAOImpl = new BoardDAOImpl();
	}

	private BoardDAOImpl() {
	}

	public static BoardDAOImpl getInstance() {
		if (boardDAOImpl == null)
			boardDAOImpl = new BoardDAOImpl();
		return boardDAOImpl;
	}

	@Override
	public void deleteBoard(int num) {

	}

	@Override
	public void updateBoard(BoardBean boardBean) {

	}

	@Override
	public void replyBoard(BoardBean boardBean) {

	}

	@Override
	public BoardBean getOneBoard(int num) {
		return null;
	}

	@Override
	public List<BoardBean> getAllBoard() {

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<BoardBean> list = new ArrayList<>();

		try {

			String sql = "select * from board order by ref desc, re_step asc, re_level asc";
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				BoardBean boardBean = new BoardBean();
				boardBean.setNum(rs.getInt("num"));
				boardBean.setWriter(rs.getString("writer"));
				boardBean.setEmail(rs.getString("email"));
				boardBean.setSubject(rs.getString("subject"));
				boardBean.setPassword(rs.getString("password"));
				boardBean.setReg_date(rs.getDate("reg_date").toString());
				boardBean.setRef(rs.getInt("ref"));
				boardBean.setRe_step(rs.getInt("re_step"));
				boardBean.setRe_level(rs.getInt("re_level"));
				boardBean.setReadcount(rs.getInt("readcount"));
				boardBean.setContent(rs.getString("content"));
				list.add(boardBean);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBClose.close(conn, pstmt, rs);
		}
		return list;

	}

	@Override
	public void writeBoard(BoardBean boardBean) {

		int ref = 0; // 글 그룹, 쿼리를 실행해 가장 큰 ref값에 +1을 더해주면 됨
		int re_step = 1; // 새 글은 무조건 1이다.
		int re_level = 1;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {

			// ref 최대값을 가져오기 위한 SQL문 실행
			String refSQL = "select max(ref) from board";
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(refSQL);
			rs = pstmt.executeQuery();
			if (rs.next())
				ref = rs.getInt(1) + 1;

			// board에 데이터 삽입
			String sql = "insert into board(num, writer, subject, email, password, reg_date, ref, re_step, re_level, readcount, content) ";
			sql += "values (board_num_seq.nextval, ?,?,?,?,sysdate,?,?,?,0,?)";
			pstmt = conn.prepareStatement(sql);

			int idx = 1;
			pstmt.setString(idx++, boardBean.getWriter());
			pstmt.setString(idx++, boardBean.getSubject());
			pstmt.setString(idx++, boardBean.getEmail());
			pstmt.setString(idx++, boardBean.getPassword());
			pstmt.setInt(idx++, ref);
			pstmt.setInt(idx++, re_step);
			pstmt.setInt(idx++, re_level);
			pstmt.setString(idx++, boardBean.getContent());
			pstmt.executeUpdate();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(conn, pstmt, rs);
		}

	}

}
