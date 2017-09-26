package servlet;

import java.io.IOException;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import util.DbConn;

public class SignUp extends HttpServlet{
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		DbConn dc = new DbConn();
		try{
		String sql="select competer_id from student where student_number="+session.getAttribute("username");
		ResultSet r = dc.select(sql);
		if(r.next())
		{
			int n=r.getInt(1);
			if(n==0)
			{
				String pick="select count(distinct competer_id) from student";
				ResultSet r1 = dc.select(pick);
				if(r1.next())
					n=r1.getInt(1)+1000;
				sql="update student set competer_id='"+n+"' where student_number="+session.getAttribute("username");
				
				int r2 = dc.update(sql);
				if(r2==1) {
					String game1=request.getParameter("depart");
					String game2=request.getParameter("depart2");
					String game3=request.getParameter("depart3");
					boolean ret=upd(game1,game2,game3,n);
					if(ret)
					request.getRequestDispatcher("index_student.jsp?succ="+n).forward(request,response);
					else
						request.getRequestDispatcher("index_student.jsp?success=su2").forward(request,response);
					//return true;
				}
				//else
					//return false;
			}
			else
			{
				String n2="select competer_id from student where student_number="+session.getAttribute("username");
				ResultSet r7=dc.select(n2);
				r7.next();
				int d=r7.getInt(1);
				String game1=request.getParameter("depart");
				String game2=request.getParameter("depart2");
				String game3=request.getParameter("depart3");
				boolean ret=upd(game1,game2,game3,d);
				if(ret)
			    	request.getRequestDispatcher("index_student.jsp?succ="+d).forward(request,response);
				else
					request.getRequestDispatcher("index_student.jsp?success=su2").forward(request,response);
			}
		}
		}catch (Exception e) {
			e.printStackTrace();
			//return false;
		} finally {
			dc.CloseConn();
		}
	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException {
		super.doPost(request, response);
	}
	public boolean upd(String game1,String game2,String game3,int n)
	{
		DbConn dc = new DbConn();
		try{
		if(!"g1".equals(game1))
			{
				String e="select project_id from project where project_name='"+game1+"'";
				ResultSet r6=dc.select(e);
				if(r6.next())
				{
				int d=r6.getInt(1);
				Connection conn;
				conn = dc.getConn();
				e="select count(competer_id) from records where competer_id='"+d+"'";
				r6=dc.select(e);
				r6.next();
				int v=r6.getInt(1);
				if(v==3)return false;
				e="select * from records where competer_id='"+n+"' and project_id='"+d+"'";
				r6=dc.select(e);
				if(r6.next()) return false;
				try {
					PreparedStatement stmt = conn.prepareStatement("insert into records (competer_id, project_id) values(?,?)");
					stmt.setInt(1, n);
					stmt.setInt(2, d);
					if(stmt.executeUpdate()==0)
						return false;
					} catch (Exception ww) {
						ww.printStackTrace();}
				}
			}
		if(!"g2".equals(game2))
		{
			String e2="select project_id from project where project_name='"+game2+"'";
			ResultSet r6=dc.select(e2);
			if(r6.next())
			{
			int d=r6.getInt(1);
			Connection conn;
			conn = dc.getConn();
			e2="select count(competer_id) from records where competer_id='"+d+"'";
			r6=dc.select(e2);
			r6.next();
			int v=r6.getInt(1);
			if(v==3)return false;
			e2="select * from records where competer_id='"+n+"' and project_id='"+d+"'";
			r6=dc.select(e2);
			if(r6.next()) return false;
			try {
				PreparedStatement stmt = conn.prepareStatement("insert into records (competer_id, project_id) values(?,?)");
				stmt.setInt(1, n);
				stmt.setInt(2, d);
				if(stmt.executeUpdate()==0)return false;
				} catch (Exception ww) {
					ww.printStackTrace();}
			}
		}
		if(!"g3".equals(game3))
		{
		String e3="select project_id from project where project_name='"+game3+"'";
		ResultSet r6=dc.select(e3);
		if(r6.next())
		{
		int d=r6.getInt(1);
		Connection conn;
		conn = dc.getConn();
		e3="select count(competer_id) from records where competer_id='"+d+"'";
		r6=dc.select(e3);
		r6.next();
		int v=r6.getInt(1);
		if(v==3)return false;
		e3="select * from records where competer_id='"+n+"' and project_id='"+d+"'";
		r6=dc.select(e3);
		if(r6.next()) return false;
		try {
			PreparedStatement stmt = conn.prepareStatement("insert into records (competer_id, project_id) values(?,?)");
			stmt.setInt(1, n);
			stmt.setInt(2, d);
			if(stmt.executeUpdate()==0)return false;
			} catch (Exception ww) {
				ww.printStackTrace();}
		}
		}
		return true;
	}catch (Exception ww) {
		ww.printStackTrace();
		return false;}finally {
			dc.CloseConn();
	}
	}
}
