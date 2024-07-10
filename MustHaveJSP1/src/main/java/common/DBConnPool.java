package common;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class DBConnPool {
	public Connection con;
	//정적 쿼리문 사용시 사용
	public Statement stmt;
	//동적 쿼리문 사용시 사용
	public PreparedStatement psmt;
	public ResultSet rs;
	
	public DBConnPool() {
		try {
			Context initCtx = new InitialContext();
			Context ctx = (Context)initCtx.lookup("java:comp/env");
			DataSource source = (DataSource)ctx.lookup("dbcp_myoracle");
			con = source.getConnection();
			System.out.println("DB커넥션 풀 연결성공");
		}
		catch (Exception e) {
			System.out.println("DB커넥션 풀 연결실패");
			e.printStackTrace();
		}
	}
	
	public void close() {
		try {
			if(rs != null) rs.close();
			if(stmt != null) stmt.close();
			if(psmt != null) psmt.close();
			if(con != null) con.close();

			System.out.println("DB 커넥션 풀 자원 반납");//마찬가지로 디버그용 - 주석처리가능
		}
		catch(Exception e) {
			e.printStackTrace();
		}
	}
}
