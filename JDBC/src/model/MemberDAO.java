package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class MemberDAO {

	static String DB_DRIVER_CLASS = "oracle.jdbc.driver.OracleDriver";
	static String DB_URL = "jdbc:oracle:thin:@localhost:1521:orcl";
	static String DB_USERNAME = "ghkvud";
	static String DB_PASSWORD = "ghkvud";

	static Connection conn = null;
	static PreparedStatement pstmt = null;
	static ResultSet rs = null;

	public void getConnection() {

		try {
			Class.forName(DB_DRIVER_CLASS);
			conn = DriverManager.getConnection(DB_URL, DB_USERNAME, DB_PASSWORD);
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public void deleteMember(Member member) {
		try {
			getConnection();
			String sql = "delete from member where id=?";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, member.getId());

			int cnt = pstmt.executeUpdate();

			conn.close();

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void updateMember(Member member) {
		try {
			getConnection();
			String sql = "update member set email=?, tel=? where id=?";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, member.getEmail());
			pstmt.setString(2, member.getTel());
			pstmt.setString(3, member.getId());

			int cnt = pstmt.executeUpdate();

			conn.close();

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public String getPassword(String id) {

		String pass1 = "";
		try {
			getConnection();
			String sql = "select pass1 from member where id=?";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);

			ResultSet rs = pstmt.executeQuery();
			if (rs.next())
				pass1 = rs.getString(1);

			conn.close();

		} catch (Exception e) {
			e.printStackTrace();
		}
		return pass1;
	}

	public void insertMember(Member member) {

		try {
			getConnection();
			String sql = "insert into member values(?,?,?,?,?,?,?,?)";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			int idx = 1;
			pstmt.setString(idx++, member.getId());
			pstmt.setString(idx++, member.getJob());
			pstmt.setString(idx++, member.getAge());
			pstmt.setString(idx++, member.getPass1());
			pstmt.setString(idx++, member.getInfo());
			pstmt.setString(idx++, member.getEmail());
			pstmt.setString(idx++, member.getTel());
			pstmt.setString(idx++, member.getHobby());

			pstmt.executeUpdate();
			conn.close();

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public Member selectMember(String id) {

		Member member = new Member();

		try {
			getConnection();
			String sql = "select * from member where id=?";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				int idx = 1;
				member.setId(rs.getString("id"));
				member.setAge(rs.getString("age"));
				member.setJob(rs.getString("job"));
				member.setPass1(rs.getString("pass1"));
				member.setInfo(rs.getString("info"));
				member.setEmail(rs.getString("email"));
				member.setTel(rs.getString("tel"));
				member.setHobby(rs.getString("hobby"));
			}
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return member;
	}

	public List<Member> selectAllMember() {
		List<Member> list = new ArrayList<>();
		try {
			getConnection();
			String sql = "select * from member";
			PreparedStatement pstmt = conn.prepareStatement(sql);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				Member member = new Member();
				int idx = 1;
				member.setId(rs.getString("id"));
				member.setAge(rs.getString("age"));
				member.setJob(rs.getString("job"));
				member.setPass1(rs.getString("pass1"));
				member.setInfo(rs.getString("info"));
				member.setEmail(rs.getString("email"));
				member.setTel(rs.getString("tel"));
				member.setHobby(rs.getString("hobby"));
				list.add(member);
			}

			conn.close();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

}
