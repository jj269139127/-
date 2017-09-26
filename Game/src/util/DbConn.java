package util;
import java.sql.*;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import Info.*;


public class DbConn {
	
	private static Connection conn;
	//Connection ct;
	PreparedStatement pstmt;
	//连接数据库
	public static Connection getConn()
	{
		try {
			String url = "jdbc:mysql://localhost:3306/game";
 			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(url, "root", "123456");
			return conn;
			
		} catch (Exception e) {
			System.err.println("数据库连接异常:" + e.getMessage());
			return null;
		}
		
		
	}
	
	
	//关闭数据库
	public void CloseConn()
	{
		try {
			conn.close();
		} catch (Exception e) {
			System.err.println("数据库关闭异常:" + e.getMessage());
		}
	}
	
	public static void main(String[] args) {
		
	}
	

	
	//登录查询
	/*public boolean loginCheck(String username, String password, String identity)
	{
		Connection conn;
		DbConn dc = new DbConn();
		conn = dc.getConn();
		try {
			Statement stmt = conn.createStatement();
			String sql;
			if(identity.equals("0"))
				sql = "select * from manager where Manager_id = '"
					+username+"' and Manager_password = '"+password+"'";
			else
				sql = "select * from student where Student_number = '"
					+username+"' and Student_password = '"+password+"'";
			ResultSet rs = stmt.executeQuery(sql);
			if(rs.next()) {
				return true;
			} else {
				return false;
			}
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		} finally {
			dc.CloseConn();
		}
	}*/
	
	//查询函数
	public ResultSet select(String sql){
		Connection conn;
		DbConn dc = new DbConn();
		conn = dc.getConn();
		try {
			//System.out.println(sql);
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			//System.out.print("*******"+rs.getString("Manager_password")+"*********\n");
			return rs;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public int update(String sql)
	{
		Connection conn;
		DbConn dc = new DbConn();
		conn = dc.getConn();
		try {
			//System.out.println(sql);
			Statement stmt = conn.createStatement();
			int rs = stmt.executeUpdate(sql);
			//System.out.print("*******"+rs.getString("Manager_password")+"*********\n");
			return rs;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}
	public ArrayList classL(String sql){
		try{
			Connection conn;
			DbConn dc = new DbConn();
			conn = dc.getConn();
			pstmt=conn.prepareStatement(sql);
			//Statement stmt = conn.createStatement();
			ArrayList cst=new ArrayList();
			ResultSet rs=pstmt.executeQuery();
			while(rs.next()){
				ClassList it=new ClassList();
				it.setClass_id(rs.getInt(1));
				it.setClass_score(rs.getInt(4));
				it.setClass_name(rs.getString(3));
				it.setClass_department(rs.getString(2));
				cst.add(it);
			}
			return cst;
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}
	}
	
	public ArrayList classname(String sql){
		try{
			Connection conn;
			DbConn dc = new DbConn();
			conn = dc.getConn();
			pstmt=conn.prepareStatement(sql);
			ArrayList cst=new ArrayList();
			ResultSet rs=pstmt.executeQuery();
			while(rs.next()){
				ClassList it=new ClassList();
				it.setClass_name(rs.getString("Class_name"));
				//it.setClass_id(rs.getInt("Class_id"));
				//it.setClass_name(rs.getString("Class_id"));
				cst.add(it);
			}
			return cst;
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}
	}

}
