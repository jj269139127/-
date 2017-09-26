package servlet;

import java.io.IOException;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import util.DbConn;

public class ChakansaichengServlet extends HttpServlet{

		public void doGet(HttpServletRequest request, HttpServletResponse response)
				throws ServletException, IOException {
					doPost(request, response);
				}

		public void doPost(HttpServletRequest request, HttpServletResponse response)
				throws ServletException, IOException {

				String Project_id = request.getParameter("Project_id");
				String Schedule_address = request.getParameter("Schedule_address");
				String Schedule_starttime = request.getParameter("Schedule_starttime");
				String Schedule_endtime = request.getParameter("Schedule_endtime");
						
				/*System.out.println("Project_id********"+Project_id+"***********");
				System.out.println("Project_category********"+Schedule_address+"***********");
				System.out.println("Project_name********"+Schedule_starttime+"***********");
				System.out.println("Project_id********"+Schedule_endtime+"***********");*/
						
				DbConn dc = new DbConn();
				try {
					String sql;
					sql = "update schedule set Schedule_address='"+Schedule_address+"',"
									+ "Schedule_starttime='"+Schedule_starttime+"',Schedule_endtime='"+Schedule_endtime+"' "
											+ "where Project_id="+Project_id+"";dc.update(sql);
					response.sendRedirect("manager_chakansaicheng.jsp");
				} catch (Exception e) {
					e.printStackTrace();
							//return false;
				} finally {
					dc.CloseConn();
				}
			}			
}
