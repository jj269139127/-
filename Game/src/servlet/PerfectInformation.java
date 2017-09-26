package servlet;

import java.io.IOException;
import java.sql.ResultSet;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import util.DbConn;

public class PerfectInformation extends HttpServlet{
	public PerfectInformation() {
		super();
	}

	public void destroy() {
		super.destroy(); 
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("UTF-8");
		String student_number=request.getParameter("studentnumber");
		String student_name=request.getParameter("studentname");
		String student_sex=request.getParameter("sex");
		if("null".equals(student_sex) || student_sex==null)
			student_sex="";
		String class_name=request.getParameter("xueyuan");
		String class_department=request.getParameter("depart");
		String student_introduction=request.getParameter("introduction");
		boolean ret = InsertInformation(student_number,student_name,student_sex,class_name,class_department,student_introduction);
		if(ret==true)
		{
			request.getRequestDispatcher("index_student.jsp?success=su").forward(request,response);
		}else
			response.sendRedirect("error.jsp");
	}
	public boolean InsertInformation(String studentnumber,String student_name,String student_sex, String class_name, String class_department,String student_introduction)
	{
		DbConn dc = new DbConn();
		try {
			String sql;
			sql="select class_id from class where class_department='"+class_department+"'";
			ResultSet rs = dc.select(sql);
			if(rs.next())
			{
				int class_id=rs.getInt("Class_id");
				sql="update student set Student_name='"+student_name+"',Student_sex='"+student_sex+"',class_id="+class_id+",Student_introduction='"+student_introduction+"'where student_number="+studentnumber;
				int r = dc.update(sql);
				if(r==1) {
					
					return true;
				}
				else
					return false;
			}
			 else {
				return false;
			}
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		} finally {
			dc.CloseConn();
		}
	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException {
doPost(request, response);
}
	public void init() throws ServletException {
	}

}

