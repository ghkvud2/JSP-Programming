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

	// DBCP 사용하는 메소드
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

	//전체 게시글 얻어오기
	//게시글 카운터는 다음에 구현
	public List<BoardBean> getAllBoard() {

		getConnection();
		List<BoardBean> list = new ArrayList<>();
		try {
			String sql = "select * from board order by ref desc, re_step asc";
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

	//새로운 글 DB에 저장하기
	public void insertBoard(BoardBean boardBean) {

		int ref = 0; // 글 그룹, 쿼리를 실행해 가장 큰 ref값에 +1을 더해주면 됨
		int re_step = 1; // 새 글은 무조건 1이다.
		int re_level = 1;

		getConnection();

		try {

			// ref 최대값을 가져오기 위한 SQL문 실행
			String refSQL = "select max(ref) from board";
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
			pstmt.close();
			conn.close();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

}
