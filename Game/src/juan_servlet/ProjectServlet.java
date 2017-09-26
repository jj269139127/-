package juan_servlet;

import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.http.HttpServlet;
import util.DbConn;

public class ProjectServlet extends HttpServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	public ResultSet getProjectByCname(String class_name)
	{
		DbConn dc = new DbConn();
		String sql = "select project_id, project_name, project_category from project" +
				" where project_id in (" +
				" select project_id from records where competer_id in (" +
				" select competer_id from student where class_id in (" +
				" select class_id from class where class_name='"+class_name+"')))";
		ResultSet rs = dc.select(sql);
		return rs;
	}
	 
	public ResultSet getProjectByClassid(int class_id)
	{
		DbConn dc = new DbConn();
		String sql = "select project_id, project_name, project_category from project" +
				" where project_id in (" +
				" select project_id from records where competer_id in (" +
				" select competer_id from student where class_id = "+class_id+"))";
		ResultSet rs = dc.select(sql);
		return rs;
	}
	public ResultSet getProjectByProjectid(int pid)
	{
		DbConn dc = new DbConn();
		String sql = "select project_id, project_name, project_category, project_number from project" +
				" where project_id ="+pid;
		ResultSet rs = dc.select(sql);
		return rs;
	}
	
	public int getNumByProject(String class_name, int project_id){
		int n = 0;
		DbConn dc = new DbConn();
		String sql = "select count(*) from records " +
				" where project_id="+project_id+" and competer_id in ( " +
				" select competer_id from student where class_id in(" +
				" select class_id from class where class_name='"+class_name+"'))";
		ResultSet rs = dc.select(sql);
		try {
			rs.next();
			n=rs.getInt(1);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return n;
	}
	public int getNumByProject(int class_id, int project_id){
		int n = 0;
		DbConn dc = new DbConn();
		String sql = "select count(*) from records " +
				" where project_id="+project_id+" and competer_id in ( " +
				" select competer_id from student where class_id ="+class_id+")";
		ResultSet rs = dc.select(sql);
		try {
			rs.next();
			n=rs.getInt(1);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return n;
	}
}
