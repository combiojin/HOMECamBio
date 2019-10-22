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
			PreparedStatement pstmt = conn.prepareStatement(" SELECT * FROM board1 order by num desc ");
		
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

}
