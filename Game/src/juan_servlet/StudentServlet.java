package juan_servlet;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.servlet.http.HttpServlet;
import util.DbConn;
import Info.ClassBean;

public class StudentServlet extends HttpServlet{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public ResultSet getStudentByCid(String cid) throws SQLException
	{
		DbConn dc = new DbConn();
		String sql = "select competer_id, student_name, student_number, " +
				"student_sex, class_name, class_department, student_introduction from student a,class b" +
				" where a.class_id = b.class_id and competer_id = "+cid;
		ResultSet rs = dc.select(sql);
		return rs;
	}
	public ResultSet getProjectByCid(String cid) throws SQLException
	{
		DbConn dc = new DbConn();
		String sql = "select project_name from project where project_id in " +
				"(select project_id from records where competer_id="+cid+")";
		ResultSet rs = dc.select(sql);
		return rs;
	}
	public ResultSet getStudentForSche(String pid,String sort){
		DbConn dc = new DbConn();
		String sql = null;
		if(!sort.matches("[0-9]+"))
			sql = "select competer_id, student_name, student_number, student_sex from student" +
				" where competer_id in (select competer_id from records where project_id="+pid+")" +
				" and class_id in (select class_id from class where class_name='"+sort+"')";
		else
			sql = "select competer_id, student_name, student_number, student_sex from student" +
			" where competer_id in (select competer_id from records where project_id="+pid+")" +
			" and class_id ='"+sort+"'";
		ResultSet rs = dc.select(sql);
		return rs;
	}


}
