package com.cambio.org.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.cambio.org.ConnectionPool;

public class MemberDAO {
	
	private static MemberDAO md = new MemberDAO();
	public static MemberDAO getInstance() {
		return md;
	}

	//member insert
	public void memberinsert(HttpServletRequest request) {
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		String cpwd = request.getParameter("cpwd");
		String name = request.getParameter("name");
		String birth = request.getParameter("birth");
		String gender = request.getParameter("gender");
		String pnumber = request.getParameter("pnumber");
		String mail = request.getParameter("mail");
		
		try {
			Connection conn = ConnectionPool.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(" insert into member1 " + 
					" (id,pw,cpwd,name,birth,gender,pnumber,mail) " + 
					" values(?,?,?,?,?,?,?,?) ");
			pstmt.setString(1, id);
			pstmt.setString(2, pwd);
			pstmt.setString(3, cpwd);
			pstmt.setString(4, name);
			pstmt.setString(5, birth);
			pstmt.setString(6, gender);
			pstmt.setString(7, pnumber);
			pstmt.setString(8, mail);
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
