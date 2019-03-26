package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class BoardDAO {

	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	// DBCP ����ϴ� �޼ҵ�
	public void getConnection() {

		try {
			Context initCtx = new InitialContext();
			Context envCtx = (Context) initCtx.lookup("java:comp/env");
			DataSource dataSource = (DataSource) envCtx.lookup("jdbc/pool");
			conn = dataSource.getConnection();

		} catch (NamingException | SQLException e) {
			e.printStackTrace();
		}
	}

	public void deleteBoard(int num) {
		
		getConnection();
		try {
			String sql = "delete from board where num=?";
			pstmt = conn.prepareStatement(sql);
			int idx = 1;
			pstmt.setInt(idx++, num);

			pstmt.executeUpdate();
			pstmt.close();
			conn.close();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public void updateBoard(BoardBean boardBean) {

		getConnection();

		try {
			String sql = "update board set subject=?, content=? where num=?";
			pstmt = conn.prepareStatement(sql);
			int idx = 1;
			pstmt.setString(idx++, boardBean.getSubject());
			pstmt.setString(idx++, boardBean.getContent());
			pstmt.setInt(idx++, boardBean.getNum());

			pstmt.executeUpdate();
			pstmt.close();
			conn.close();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	// �亯 �Խñ��� �����ϴ� �޼ҵ�
	public void reWriteBoard(BoardBean boardBean) {

		// �켱������ �θ� ���� [�� �׷�], [�� ����], [�� ����] ���� �о�帰��.
		int ref = boardBean.getRef();
		int re_step = boardBean.getRe_step();
		int re_level = boardBean.getRe_level();

		getConnection();

		try {

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

			pstmt.close();
			conn.close();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	// �ϳ��� �Խñ��� select�ϴ� �޼ҵ�
	public BoardBean getOneBoard(int num) {

		BoardBean boardBean = new BoardBean();
		getConnection();
		try {

			// ��ȸ�� ������Ű�� SQL
			String readSQL = "update board set readcount = readcount+1 where num=?";
			pstmt = conn.prepareStatement(readSQL);
			pstmt.setInt(1, num);
			pstmt.executeUpdate();
			pstmt.close();
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
			pstmt.close();
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return boardBean;
	}

	// ��ü �Խñ� ������
	// �Խñ� ī���ʹ� ������ ����
	public List<BoardBean> getAllBoard() {

		getConnection();
		List<BoardBean> list = new ArrayList<>();
		try {
			String sql = "select * from board order by ref desc, re_step asc, re_level asc";
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
			pstmt.close();
			conn.close();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

	// ���ο� �� DB�� �����ϱ�
	public void insertBoard(BoardBean boardBean) {

		int ref = 0; // �� �׷�, ������ ������ ���� ū ref���� +1�� �����ָ� ��
		int re_step = 1; // �� ���� ������ 1�̴�.
		int re_level = 1;

		getConnection();

		try {

			// ref �ִ밪�� �������� ���� SQL�� ����
			String refSQL = "select max(ref) from board";
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
			pstmt.close();
			conn.close();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

}
