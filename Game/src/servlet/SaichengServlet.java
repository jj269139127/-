package servlet;
import java.io.IOException;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JOptionPane;

import util.*;

public class SaichengServlet extends HttpServlet{

	public SaichengServlet()
	{
		super();
	}

	/*public void destroy()
	{
		super.destroy; 
	}*/

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException
			{
		    	doPost(request, response);
			}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException
			{
		
	try{
		String ab=null;
		String cd=null;
		String ef=null;

		request.setCharacterEncoding("gb2312");
		String Project_name = request.getParameter("Project_name");       //实际为project_name
		String Schedule_address = request.getParameter("Schedule_address");  //Schedule_4	
		String Schedule_starttime = request.getParameter("Schedule_starttime");    //Schedule_2
		String Schedule_endtime = request.getParameter("Schedule_endtime");    //Schedule_3
		String Schedule_name = request.getParameter("Schedule_name"); 
		
		//String Project_Id=Project_sex+Project_category+Project_name;
		//int Project_id = Integer.parseInt(Project_Id);
				
		//System.out.println("Project_name********"+Project_name+"***********");
		//System.out.println("Schedule_address********"+Schedule_address+"***********");
		//System.out.println("Schedule_starttime********"+Schedule_starttime+"***********");
		//System.out.println("Schedule_endtime********"+Schedule_endtime+"***********");
		//System.out.println("Schedule_name********"+Schedule_name+"***********");

		//通过Project_name获得Project_id*********为ef
		DbConn dc1 = new DbConn();
		String sql1 = "select Project_id from project where Project_name='"+Project_name+"'";
		ResultSet rs1 = dc1.select(sql1);
		rs1.next();
		ef=rs1.getString(1);
		
		//System.out.println("Project_id********"+ef+"***********ef");
		//查看是否已经添加过本赛程
		String sql111 = "select Project_id from schedule where Project_id="+ef+" and Schedule_name='"+Schedule_name+"'";
		ResultSet rs111 = dc1.select(sql111);
		
		if(rs111.next())
		{
			//System.out.println("************"+rs111.getString(1));
			//JOptionPane.showMessageDialog(null, this,"项目已经添加，不能重复添加", Project_id); 
			JOptionPane.showMessageDialog(null, "赛程已经添加，不能重复添加", "", JOptionPane.ERROR_MESSAGE);
			response.sendRedirect("manager_saicheng.jsp");
		}
		else
		{
			DbConn dc = new DbConn();
			try {
				String sql;
				sql = "insert into schedule(Schedule_address,Schedule_starttime,Schedule_endtime,Project_id,Schedule_name) VALUES('"+Schedule_address+"','"+Schedule_starttime+"','"+Schedule_endtime+"',"+ef+",'"+Schedule_name+"')";
				dc.update(sql);
				response.sendRedirect("manager_saicheng.jsp");
			} catch (Exception e) {
				e.printStackTrace();
				//return false;
			} finally {
				dc.CloseConn();
			}
		}
	} catch(Exception e) {
		e.printStackTrace();
	}

	}	

	public void init() throws ServletException {
	}


}
