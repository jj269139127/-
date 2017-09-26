package juan_servlet;

import java.sql.ResultSet;

import javax.servlet.http.HttpServlet;

import util.DbConn;

public class ScheduleServlet extends HttpServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	public ResultSet getScheduleByPid(int project_id)
	{
		DbConn dc = new DbConn();
		String sql = "select schedule_address, schedule_starttime, schedule_endtime, schedule_name from schedule" +
				" where project_id ="+project_id;
		ResultSet rs = dc.select(sql);
		return rs;
	}
}
