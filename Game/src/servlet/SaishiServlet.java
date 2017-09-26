package servlet;
import java.io.IOException;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JOptionPane;

import util.DbConn;

public class SaishiServlet extends HttpServlet
{

	public SaishiServlet()
	{
		super();
	}

	public void destroy()
	{
		super.destroy(); 
	}

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

		String Project_sex = request.getParameter("Project_sex");          //Project_5
		String Project_category = request.getParameter("Project_category");//Project_4	
		String Project_name = request.getParameter("Project_name");        //Project_2
		String Project_number = request.getParameter("Project_number");    //Project_3
		
		String Project_Id=Project_sex+Project_category+Project_name;
		int Project_id = Integer.parseInt(Project_Id);
				
		/*System.out.println("Project_sex********"+Project_sex+"***********");
		System.out.println("Project_category********"+Project_category+"***********");
		System.out.println("Project_name********"+Project_name+"***********");
		System.out.println("Project_id********"+Project_id+"***********");*/
		
		//是否有重复ID
		DbConn dc1 = new DbConn();
		String sql111 = "select Project_id from project where Project_id="+Project_id+"";
		ResultSet rs111 = dc1.select(sql111);
		
		if(rs111.next())
		{
			//System.out.println("************"+rs111.getString(1));
			//JOptionPane.showMessageDialog(null, this,"项目已经添加，不能重复添加", Project_id); 
			JOptionPane.showMessageDialog(null, "项目已经添加，不能重复添加", "", JOptionPane.ERROR_MESSAGE);
			response.sendRedirect("manager_saishi.jsp");
		}
		else
		{
		
			if(Project_sex.equals("1")){//女
				ab="女子";
				Project_sex="f";
			}
			else{//男
				ab="男子";
				Project_sex="m";				
			}
			if(Project_category.equals("0")){//田赛
				cd="田赛";
			}
			else{//1径赛
				cd="径赛";				
			}
			//获得田赛的名称
			//DbConn dc1 = new DbConn();
			String sql1 = "select name from category_name where id="+Project_name+"";
			ResultSet rs1 = dc1.select(sql1);
			rs1.next();
			ef=rs1.getString(1);
		
			Project_name=ab+ef;
			//Project_name=ab+cd+ef;
			//System.out.println("Project_name2********"+Project_name+"***********");
			
			DbConn dc = new DbConn();
			try {
				String sql;
				sql = "insert into project(Project_id,Project_sex,Project_category,Project_name,Project_number) VALUES("+Project_id+",'"+Project_sex+"','"+Project_category+"','"+Project_name+"',"+Project_number+")";
				dc.update(sql);
				response.sendRedirect("manager_saishi.jsp");
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
	
	/*public String getProject_name()
	{
		String a=null;
		DbConn dc = new DbConn();
		String sql = "select distinct Project_sex from project";
		ResultSet rs = dc.select(sql);
		ArrayList classlist = new ArrayList();
		while(rs.next()){
			ProjectBean projectbean = new ProjectBean();
			projectbean.setProject_sex(rs.getString(1));
			classlist.add(projectbean);
		}
		return a;
	}*/

}
