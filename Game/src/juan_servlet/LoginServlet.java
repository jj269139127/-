package juan_servlet;
import java.io.IOException;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.JOptionPane;


import util.DbConn;

public class LoginServlet extends HttpServlet {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;


	public LoginServlet() {
		super();
	}

	public void destroy() {
		super.destroy(); 
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	try{
		HttpSession session=request.getSession();
		boolean ret = false;
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String identity = request.getParameter("identity");
		//System.out.println("********"+identity+"***********");
		session.setAttribute("username", username);
		
		ret = loginCheck(username, password, identity);
		if(ret == true){
			if(identity.equals("0")){//管理员
				session.setAttribute("identity", "管理员");
				response.sendRedirect("index_manager.jsp");
			}
			else{//运动员
				session.setAttribute("identity", "运动员");
				response.sendRedirect("index_student.jsp");				
			}
		} else 
		{
			JOptionPane.showMessageDialog(null, "用户名或密码不正确，登录失败！", "", JOptionPane.ERROR_MESSAGE);
			response.sendRedirect("login.jsp");
		}
		
	} catch(Exception e) {
		e.printStackTrace();
	}

	}
	
	//登录查询
	public boolean loginCheck(String username, String password, String identity)
	{
		DbConn dc = new DbConn();
		try {
			String sql;
			if(identity.equals("0"))
				sql = "select * from manager where Manager_id = '"
					+username+"' and Manager_password = '"+password+"'";
			else
				sql = "select * from student where Student_number = '"
					+username+"' and Student_password = '"+password+"'";
			ResultSet rs = dc.select(sql);	
			if(rs.next()) {
				
				return true;
			} else {
				return false;
			}
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		} finally {
			dc.CloseConn();
		}
	}
	

	public void init() throws ServletException {
	}

}
