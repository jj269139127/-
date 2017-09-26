package servlet;

import java.io.IOException;
import java.sql.Array;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Info.ClassBean;
import Info.StudentBean;
import util.DbConn;

public class ClassServlet extends HttpServlet{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public ArrayList getClassArray() throws SQLException
	{
		DbConn dc = new DbConn();
		String sql = "select distinct class_name from class";
		ResultSet rs = dc.select(sql);
		ArrayList classlist = new ArrayList();
		while(rs.next()){
			ClassBean classbean = new ClassBean();;
			classbean.setClass_name(rs.getString(1));	
			classlist.add(classbean);
		}
		return classlist;
	}
	public ResultSet getDepartmentByCname(String class_name)
	{
		DbConn dc = new DbConn();
		//System.out.println("*****123"+class_name);
		String sql = "select class_id,class_department from class where class_name ='"+class_name+"'";
		//System.out.println(sql);
		ResultSet rs = dc.select(sql);
		return rs;
	}
	public ArrayList getStudentByCname(String class_name) throws SQLException
	{
		DbConn dc = new DbConn();
		String sql = "select Competer_id, Student_name, Student_number from student where Competer_id>0 and Class_id in" +
				"(select class_id from class where class_name ='"+class_name+"')";
		ResultSet rs = dc.select(sql);
		ArrayList studentlist = new ArrayList();
		while(rs.next()){
			StudentBean studentbean = new StudentBean();
			studentbean.setCompeter_id(rs.getInt(1));
			studentbean.setStudent_name(rs.getString(2));
			studentbean.setStudent_number(rs.getInt(3));
			studentlist.add(studentbean);		
		}
		return studentlist;
	} 
	public ArrayList getStudentByClassid(String class_id) throws SQLException
	{
		DbConn dc = new DbConn();
		String sql = "select Competer_id, Student_name, Student_number from student where Competer_id>0 and class_id ='"+class_id+"'";
		ResultSet rs = dc.select(sql);
		ArrayList studentlist = new ArrayList();
		while(rs.next()){
			StudentBean studentbean = new StudentBean();
			studentbean.setCompeter_id(rs.getInt(1));
			studentbean.setStudent_name(rs.getString(2));
			studentbean.setStudent_number(rs.getInt(3));
			studentlist.add(studentbean);		
		}
		return studentlist;
	} 
}
