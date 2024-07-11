package common;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

/*
JNDI(Java Naming and Directory Interface) : 디렉토리 서비스에서 제공하는 
	데이터 및 객체를 찾아서 참조(lookup)하는 API로 쉽게 말하면 외부에 
	있는 객체를 이름으로 찾아오기 위한 기술이다.
	
DECP(DataBase Connection Pool : 커넥션 풀) : DB와 연결된 커넥션 객체를 
	미리 만들어	풀(Pool)에 저장해 뒀다가 필요할 때 가져다 쓰고 반납하는 
	기법을 말한다. DB에 부하를 줄이고 자원을 효율적으로 관리할 수 있다.
*/

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
