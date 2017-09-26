package servlet;

import java.io.IOException;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import util.DbConn;

public class ChakansaishiServlet extends HttpServlet{
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
				doPost(request, response);
			}

			public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

				String Project_id = request.getParameter("Project_id");
				String Project_number = request.getParameter("Project_number");
				
				/*System.out.println("Project_id********"+Project_id+"***********");
				System.out.println("Project_category********"+Project_number+"***********");*/
				
				DbConn dc = new DbConn();
				try {
					String sql;
					sql = "update project set Project_number="+Project_number+" where Project_id="+Project_id+"";
					dc.update(sql);
					response.sendRedirect("manager_chakansaishi.jsp");
				} catch (Exception e) {
					e.printStackTrace();
					//return false;
				} finally {
					dc.CloseConn();
				}
			}
}
