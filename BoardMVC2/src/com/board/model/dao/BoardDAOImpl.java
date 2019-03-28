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

		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = DBConnection.getConnection();
			String sql = "delete from board where num=?";
			pstmt = conn.prepareStatement(sql);
			int idx = 1;
			pstmt.setInt(idx++, num);
			pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBClose.close(conn, pstmt);
		}
	}

	@Override
	public void updateBoard(BoardBean boardBean) {

		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			conn = DBConnection.getConnection();
			String sql = "update board set subject=?, content=? where num=?";
			pstmt = conn.prepareStatement(sql);
			int idx = 1;
			pstmt.setString(idx++, boardBean.getSubject());
			pstmt.setString(idx++, boardBean.getContent());
			pstmt.setInt(idx++, boardBean.getNum());
			pstmt.executeUpdate();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(conn, pstmt);
		}

	}

	@Override
	public void replyBoard(BoardBean boardBean) {

		Connection conn = null;
		PreparedStatement pstmt = null;

		// �켱������ �θ� ���� [�� �׷�], [�� ����], [�� ����] ���� �о�帰��.
		int ref = boardBean.getRef();
		int re_step = boardBean.getRe_step();
		int re_level = boardBean.getRe_level();

		try {
			conn = DBConnection.getConnection();
			// �θ� �ۺ��� ū [�� ����]�� ���� ���� 1�� ������Ų��.
			String levelSQL = "update board set re_level = re_level+1 where ref=? and re_level > ?";
			pstmt = conn.prepareStatement(levelSQL);
			pstmt.setInt(1, ref);
			pstmt.setInt(2, re_level);
			pstmt.executeUpdate();

			String sql = "insert into board values(board_num_seq.nextval,?,?,?,?,sysdate,?,?,?,0,?)";
			pstmt = conn.prepareStatement(sql);
			int idx = 1;
			pstmt.setString(idx++, boardBean.getWriter());
			pstmt.setString(idx++, boardBean.getEmail());
			pstmt.setString(idx++, boardBean.getSubject());
			pstmt.setString(idx++, boardBean.getPassword());
			pstmt.setInt(idx++, boardBean.getRef());
			pstmt.setInt(idx++, boardBean.getRe_step() + 1);
			pstmt.setInt(idx++, boardBean.getRe_level() + 1);
			pstmt.setString(idx++, boardBean.getContent());
			pstmt.executeUpdate();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(conn, pstmt);
		}
	}

	@Override
	public BoardBean getOneBoard(int num) {

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		BoardBean boardBean = new BoardBean();

		try {

			conn = DBConnection.getConnection();
			// ��ȸ�� ������Ű�� SQL
			String readSQL = "update board set readcount = readcount+1 where num=?";
			pstmt = conn.prepareStatement(readSQL);
			pstmt.setInt(1, num);
			pstmt.executeUpdate();

			// �Խñ� �ϳ� �������� SQL
			String sql = "select * from board where num=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			if (rs.next()) {

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
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(conn, pstmt, rs);
		}
		return boardBean;

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

		int ref = 0; // �� �׷�, ������ ������ ���� ū ref���� +1�� �����ָ� ��
		int re_step = 1; // �� ���� ������ 1�̴�.
		int re_level = 1;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {

			// ref �ִ밪�� �������� ���� SQL�� ����
			String refSQL = "select max(ref) from board";
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(refSQL);
			rs = pstmt.executeQuery();
			if (rs.next())
				ref = rs.getInt(1) + 1;

			// board�� ������ ����
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
