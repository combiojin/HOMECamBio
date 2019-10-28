package com.cambio.org.member;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.cambio.org.member.*;
import com.mysql.cj.Session;
import com.cambio.org.ConnectionPool;

public class MemberDAO {

	private static MemberDAO md = new MemberDAO();

	public static MemberDAO getInstance() {
		return md;
	}

	public boolean checkLogin(HttpServletRequest request, String id, String pwd) {
		boolean logincheck = true;

		try {
			Connection conn = ConnectionPool.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(" select * from member1 where id=? and pwd = ? ");
			pstmt.setString(1, id);
			pstmt.setString(2, pwd);
			ResultSet rs = pstmt.executeQuery();

			if (rs.next()) {
				logincheck = true;
			} else {
				logincheck = false;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return logincheck;
	}

	// member insert
	public void memberinsert(HttpServletRequest request) {
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		String cpwd = request.getParameter("cpwd");
		String name = request.getParameter("name");
		String birth = request.getParameter("birth");
		String gender = request.getParameter("gender");
		String punmber = request.getParameter("punmber");
		String mail = request.getParameter("mail");

		try {
			Connection conn = ConnectionPool.getConnection();
			PreparedStatement pstmt = conn
					.prepareStatement(" insert into member1 " + " (num,id,pwd,cpwd,name,birth,gender,punmber,mail) "
							+ " values(memberseq.NEXTVAL,?,?,?,?,?,?,?,?) ");
			pstmt.setString(1, id);
			pstmt.setString(2, pwd);
			pstmt.setString(3, cpwd);
			pstmt.setString(4, name);
			pstmt.setString(5, birth);
			pstmt.setString(6, gender);
			pstmt.setString(7, punmber);
			pstmt.setString(8, mail);
			pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void memberlist(HttpServletRequest request) {
		try {
			List<MemberDTO> list = new ArrayList<MemberDTO>();
			Connection conn = ConnectionPool.getConnection(); // context.xml 에 DB연결
			PreparedStatement pstmt = conn.prepareStatement(" SELECT * FROM member1 order by num desc ");

			ResultSet rs = pstmt.executeQuery();

			while (rs.next()) {
				list.add(new MemberDTO(rs.getInt("num"), rs.getString("id"), rs.getString("pwd"), rs.getString("cpwd"),
						rs.getString("name"), rs.getString("birth"), rs.getString("gender"), rs.getString("punmber"),
						rs.getString("mail")));
			}
			request.setAttribute("myList", list);

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void memberUpdate(HttpServletRequest request) {

		try {

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void mypageMember(HttpServletRequest request) {
		try {
			List<MemberDTO> list = new ArrayList<MemberDTO>();
			Connection conn = ConnectionPool.getConnection(); // context.xml 에 DB연결
			PreparedStatement pstmt = conn.prepareStatement(" SELECT * FROM member1 order by num desc ");

			ResultSet rs = pstmt.executeQuery();

			while (rs.next()) {
				list.add(new MemberDTO(rs.getInt("num"), rs.getString("id"), rs.getString("pwd"), rs.getString("cpwd"),
						rs.getString("name"), rs.getString("birth"), rs.getString("gender"), rs.getString("punmber"),
						rs.getString("mail")));
			}
			request.setAttribute("mypage", list);

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
