package com.cambio.org;

import java.sql.Connection;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class ConnectionPool {
	
	private static Connection conn = null;
	
	public static Connection getConnection() {
		if(conn !=null) {
			return conn;
		}
		else {
			try {
				Context initContext = (Context) new InitialContext().lookup("java:comp/env");
				DataSource ds = (DataSource) initContext.lookup("jdbc/orcle");
				conn = ds.getConnection();
			}catch (Exception e) {
				e.printStackTrace();
			}
		}
		return conn;
	}
}

집에가서 옮겨넣기
<Resource

	auth = "Container"

	driverClassName = "oracle.jdbc.driver.OracleDriver"

	url = "jdbc:oracle:thin:@localhost:1521:xe"

	username = "scott"

	password = "1234"

	name = "jdbc/Oracle11g"

	type = "javax.sql.DataSource"

	maxActive ="50"	  

	maxWait = "1000"

/>

