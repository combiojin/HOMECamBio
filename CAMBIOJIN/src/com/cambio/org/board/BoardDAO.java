package com.cambio.org.board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.cambio.org.ConnectionPool;
import com.cambio.org.member.MemberDTO;

public class BoardDAO {
	
	private static BoardDAO bd = new BoardDAO();
	public static BoardDAO getInstance() {
		return bd;		
	}
	
	public void boardlist(HttpServletRequest request) {
		try {
			List<BoardDTO> list = new ArrayList<BoardDTO>();
			Connection conn = ConnectionPool.getConnection();	//context.xml 에 DB연결
			PreparedStatement pstmt = conn.prepareStatement(" SELECT * FROM board order by num desc ");
		
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				list.add(
					new BoardDTO(	
							rs.getInt("num"),
							rs.getString("title"),
							rs.getString("content"),
							rs.getString("moddate"),
							rs.getString("writer")
					)
				);
			}
			request.setAttribute("BoardList", list);
			
		}catch (Exception e) {
			e.printStackTrace();
		}		
	}
	
	public void cntboard(HttpServletRequest request) {
		try {
			int cnt = 0;
			Connection conn = ConnectionPool.getConnection();	//context.xml 에 DB연결
			PreparedStatement pstmt = conn.prepareStatement(" select count(num)  from board ");
			ResultSet rs = pstmt.executeQuery();
			
			if(rs.next())
				cnt = rs.getInt(1);
			
			if(cnt%10 != 0 ) {
				cnt = cnt / 10+1;
			} else {
				cnt = cnt / 10;				
			}
			
			request.setAttribute("boardcnt", cnt);
			
		}catch (Exception e) {
			e.printStackTrace();
		}	
	}
	
	public void boardlistSelect(HttpServletRequest request) {
		String number = request.getParameter("pageNum");
				
		int num = number == null ? 1: Integer.parseInt(number);

		num = 10*(num-1);
		
		try {
			List<BoardDTO> list = new ArrayList<BoardDTO>();
			Connection conn = ConnectionPool.getConnection(); // context.xml 에 DB연결
			PreparedStatement pstmt = conn.prepareStatement(" select * from board " + 
																" order by num desc " + 
																" limit ?,10 ");
			
			pstmt.setInt(1, num);
					
			ResultSet rs = pstmt.executeQuery();

			while (rs.next()) {
				list.add(
					new BoardDTO(
						rs.getInt("num"), 
						rs.getString("title"),
						rs.getString("content"),
						rs.getString("moddate"),
						rs.getString("writer")
						)
					);
			}
			request.setAttribute("BoardList", list);

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void boardinsert(HttpServletRequest request) {
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		String writer = request.getParameter("writer");

		try {
			Connection conn = ConnectionPool.getConnection();
			PreparedStatement pstmt = conn
					.prepareStatement(" insert into board " + 
							" (title,content,writer) " + 
							" values " + 
							" (?,?,?) ");
			pstmt.setString(1, title);
			System.out.println(title);
			pstmt.setString(2, content);
			pstmt.setString(3, writer);
			pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void boardWriterList(HttpServletRequest request) {
		
	}

}
