package juan_servlet;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import util.DbConn;

public class RecordsServlet extends HttpServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	public ResultSet getRankingForClass()
	{
		DbConn dc = new DbConn();
		String sql = "select distinct class_name, sum(class_score) from class" +
				" group by class_name" +
				" order by sum(class_score) desc";
		ResultSet rs = dc.select(sql);
		return rs;
	}
	public ResultSet getRankingByCnameInClass(String cname){
		DbConn dc = new DbConn();
		String sql = "select class_id, class_department, class_score from class" +
				" where class_name = '"+cname+"'" +
				" order by class_score desc";
		ResultSet rs = dc.select(sql);
		return rs;
	}
	public int getCnumForClassByCname(String cname){
		int num = 0;
		DbConn dc = new DbConn();
		String sql = "select count(*) from student " +
				" where competer_id >0 and class_id in" +
				"(select class_id from class where class_name='"+cname+"')";
		ResultSet rs = dc.select(sql);
		try {
			rs.next();
			num = rs.getInt(1);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}	
		return num;
	}
	public int getCnumForClassByClassid(int classid){
		int num = 0;
		DbConn dc = new DbConn();
		String sql = "select count(*) from student " +
				" where competer_id >0 and class_id ="+classid;
		ResultSet rs = dc.select(sql);
		try {
			rs.next();
			num = rs.getInt(1);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}	
		return num;
	}

	public void calculateTheScore() throws SQLException{
		DbConn dc = new DbConn();
		dc.update("update class set class_score = 0");
		ResultSet rs = dc.select("select competer_id, Grades_ranking from records where Grades_flag=1");
		while(rs.next()){
			int cid = rs.getInt(1);
			int score = 6-rs.getInt(2);
			if(rs.getInt(2)==0) continue;
			int class_id = getClassidByCid(cid);
			int classscore = getScoreByClassid(class_id)+score;			
			dc.update("update class set class_score="+classscore+" where class_id = "+class_id);		
		}
	}
	int getClassidByCid(int cid){
		int classid = 0;
		DbConn dc = new DbConn();
		ResultSet rs = dc.select("select class_id from student where competer_id="+cid);
		try {
			rs.next();
			classid = rs.getInt(1);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}	
		return classid;
	}
	int getScoreByClassid(int classid){
		int score = 0;
		DbConn dc = new DbConn();
		ResultSet rs = dc.select("select class_score from class where class_id="+classid);
		try {
			rs.next();
			score = rs.getInt(1);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}		
		return score;
	}
	public ResultSet getInfoByPinCid(String pid, String cid)
	{
		DbConn dc = new DbConn();
		String sql = "select r.competer_id, student_name, class_name, class_department, grades_flag, grades_grades" +
				" from records r, student s, class c" +
				" where r.competer_id=s.competer_id and s.class_id=c.class_id" +
				" and r.project_id="+pid;
		if(!cid.isEmpty())
			sql+=" and r.competer_id = "+cid;
		ResultSet rs = dc.select(sql);
		return rs;
	}
	public void changeCheckin(String pid, String cid){
		DbConn dc = new DbConn();
		String sql = "select grades_flag from records where project_id="+pid+
		" and competer_id="+cid;
		ResultSet rs = dc.select(sql);
		try {
			rs.next();
			if(rs.getInt(1)==1)
				dc.update("update records set grades_flag=0 where project_id="+pid+" and competer_id="+cid);
			else
				dc.update("update records set grades_flag=1 where project_id="+pid+" and competer_id="+cid);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public ResultSet getRecordsByProjectid(String pid){
		DbConn dc = new DbConn();
		String sql = "select r.competer_id, student_name, class_name, " +
				" class_department, grades_grades, grades_ranking" +
				" from records r, student s, class c" +
				" where r.competer_id = s.competer_id and s.class_id = c.class_id and grades_flag=1 and r.project_id="+pid;
		return dc.select(sql);	
	}
	public ResultSet getRecordsForInput(String pid, String cid){
		DbConn dc = new DbConn();
		String sql = "select r.competer_id, student_name, grades_grades, grades_ranking " +
				" from records r, student s" +
				" where r.competer_id = s.competer_id and grades_flag=1 and r.project_id="+pid;
		if(!cid.isEmpty())
			sql+=" and r.competer_id = "+cid;
		return dc.select(sql);	
	}
	public ResultSet getDefaultRecordsByPid(String pid){
		DbConn dc = new DbConn();
		String sql = "select r.competer_id, student_name, class_name, " +
		" class_department, grades_grades" +
		" from records r, student s, class c" +
		" where r.competer_id = s.competer_id and s.class_id = c.class_id and grades_flag=0 and r.project_id="+pid;
		return dc.select(sql);	
	}
	
	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException {
		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException {

		try{
		String pid = request.getParameter("projectid");
		String competerid = request.getParameter("competerid");
		if(!pid.isEmpty())
		{
			DbConn dc = new DbConn();
			String s = "select competer_id from records where grades_flag=1 and project_id="+pid;
			if(!competerid.isEmpty())
				s+=" and competer_id="+competerid;
			ResultSet cidRs = dc.select(s);
			while(cidRs.next()){
				String cid = cidRs.getString(1);
				String grades = request.getParameter("grades"+cid);
				String ranking = request.getParameter("ranking"+cid);
				String flag = request.getParameter("flag"+cid);
				int flag_=1;
				//System.out.println("********"+cid+"***********");
				//System.out.println("********"+grades+"***********");
				//System.out.println("********"+ranking+"***********");
				//System.out.println("********"+flag+"***********");
				if("null".equals(ranking))
					ranking = "0";
				if(!"1".equals(flag))
					flag_=0;
				//System.out.println("********"+flag_+"***********");
				String sql ="update records set grades_grades='"+grades+"', grades_ranking="+ranking+", grades_flag="+flag_+
				" where project_id="+pid+" and competer_id="+cid;
				dc.update(sql);
			}			
		}
		response.sendRedirect("recordsInput.jsp");	
		} catch(Exception e) {
		e.printStackTrace();
		}
	}
}
