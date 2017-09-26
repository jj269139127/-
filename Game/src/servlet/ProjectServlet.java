package servlet;

import java.sql.*;
import java.util.ArrayList;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpSession;

import Model.ProjectBean;
import util.DbConn;


public class ProjectServlet extends HttpServlet{
	
	private static final long serialVersionUID = 1L;
	
	public ResultSet getProjectByCategory(String project_category)//ˢ��������
	{
		String ab=null;
		//System.out.println("1********"+project_category+"***********");
		if(project_category.equals("0")){//����
			ab="����";
		}
		else{//����
			ab="����";				
		}
		//System.out.println("2********"+ab+"***********");
		DbConn dc = new DbConn();
		String sql = "select id,name from category_name where category='"+ab+"'";
		ResultSet rs = dc.select(sql);
		return rs;
	}
	
	public ArrayList getSexArray() throws SQLException
	{
		DbConn dc = new DbConn();
		String sql = "select distinct Project_sex from project";
		ResultSet rs = dc.select(sql);
		ArrayList classlist = new ArrayList();
		while(rs.next()){
			ProjectBean projectbean = new ProjectBean();
			projectbean.setProject_sex(rs.getString(1));
			classlist.add(projectbean);
		}
		return classlist;
	}

	public ResultSet getCategoryBySex(String sex) throws SQLException//ˢ�±�������
	{
		String ab=null;
		//System.out.println("s0********"+sex+"");
		if(sex.equals("Ů")){//Ů
			ab="f";
		}
		else{//��
			ab="m";				
		}
		//System.out.println("s1********"+ab+"");
		DbConn dc = new DbConn();
		String sql = "select distinct Project_category from project where Project_sex='"+ab+"'";
		//System.out.println("s2********"+ab+"");
		ResultSet rs = dc.select(sql);
		//System.out.println("s3********"+ab+"");
		return rs;
	}
	public ResultSet getProjectnameBySex(String project_sex)//ˢ��������1
	{
		String ab=null;
		ab=project_sex;
		//System.out.println("c0********"+project_sex+"***********");
		if(project_sex.equals("Ů")){//Ů
			ab="f";
		}
		else{//��
			ab="m";				
		}
		//System.out.println("c1********"+ab+"***********");
		DbConn dc = new DbConn();
		String sql = "select Project_name from project where Project_sex='"+ab+"'";
		//System.out.println("c2********"+ab+"***********");
		ResultSet rs = dc.select(sql);
		//System.out.println("c3********"+ab+"***********");
		return rs;
	}

	public ResultSet getProjectnameBySexX(String project_category)//ˢ��������2
	{
		String ab=null;
		String cd=null;
		ab=project_category;
		//System.out.println("r0********"+project_category+"***********");
		if(project_category.equals("����Ů")){//����Ů
			ab="0";
			cd="f";
		}
		else if(project_category.equals("������")){//������
			ab="0";
			cd="m";
		}
		else if(project_category.equals("����Ů")){//����Ů
			ab="1";
			cd="f";
		}
		else{//������
			ab="1";
			cd="m";				
		}
		//System.out.println("r1********"+ab+"***********");
		//System.out.println("r1--sex********"+cd+"***********");
		DbConn dc = new DbConn();
		String sql = "select project_name from project where project_category ='"+ab+"' and Project_sex='"+cd+"'";
		//String sql = "select Project_name from project where Project_category='"+ab+"'";
		//System.out.println("r2********"+ab+"***********");
		ResultSet rs = dc.select(sql);
		//System.out.println("r3********"+ab+"***********");
		return rs;
	}
	
	public ResultSet getScheduleBySex(String project_sex)//ˢ�±�1
	{
		String ab=null;
		ab=project_sex;
		//System.out.println("c0********"+project_sex+"***********");
		if(project_sex.equals("Ů")){//Ů
			ab="f";
		}
		else{//��
			ab="m";				
		}
		//System.out.println("c1********"+ab+"***********");
		DbConn dc = new DbConn();
		String sql = "select project.Project_id,Project_name,Project_sex,Project_number,"
				+ "Schedule_address,Schedule_starttime,Schedule_endtime,Schedule_name "
				+ "from project,schedule "
				+ "where project.Project_id=schedule.Project_id and Project_sex='"+ab+"'";
		//System.out.println("c2********"+ab+"***********");
		ResultSet rs = dc.select(sql);
		//System.out.println("c3********"+ab+"***********");
		return rs;
	}
	public ResultSet getScheduleBySexX(String project_category)//ˢ�±�2
	{
		String ab=null;
		String cd=null;
		ab=project_category;
		//System.out.println("r0********"+project_category+"***********");
		if(project_category.equals("����Ů")){//����Ů
			ab="0";
			cd="f";
		}
		else if(project_category.equals("������")){//������
			ab="0";
			cd="m";
		}
		else if(project_category.equals("����Ů")){//����Ů
			ab="1";
			cd="f";
		}
		else{//������
			ab="1";
			cd="m";				
		}
		//System.out.println("r1********"+ab+"***********");
		//System.out.println("r1--sex********"+cd+"***********");
		DbConn dc = new DbConn();
		String sql = "select project.Project_id,Project_name,Project_sex,Project_number,"
				+ "Schedule_address,Schedule_starttime,Schedule_endtime,Schedule_name "
				+ "from project,schedule "
				+ "where project.Project_id=schedule.Project_id and project_category ='"+ab+"' and Project_sex='"+cd+"'";
		//System.out.println("r2********"+ab+"***********");
		ResultSet rs = dc.select(sql);
		//System.out.println("r3********"+ab+"***********");
		return rs;
	}

	public void getDeleteScheduleByName(String name)//ɾ������
	{
		//System.out.println("id1********"+name+"***********");
		DbConn dc = new DbConn();
		String sql = "delete from schedule where Project_id ="
				+ "(select Project_id from project where Project_name='"+name+"')";
		//System.out.println("id2********"+name+"***********");
		dc.update(sql);
		//System.out.println("id3********"+name+"***********");
	}
	
	public ResultSet getUpdateByName(String project_name)//��������
	{
		//System.out.println("v0********"+project_name+"***********");
		DbConn dc = new DbConn();
		String sql = "select project.Project_id,Project_name,Project_sex,Project_number,"
				+ "Schedule_address,Schedule_starttime,Schedule_endtime "
				+ "from project,schedule "
				+ "where project.Project_id=schedule.Project_id and project_name ='"+project_name+"'";
		//System.out.println("v2********"+project_name+"***********");
		ResultSet rs = dc.select(sql);
		//System.out.println("v3********"+project_name+"***********");
		return rs;
	}
	
	public ResultSet getSaishiBySex(String project_sex)//ˢ������1
	{
		String ab=null;
		ab=project_sex;
		//System.out.println("10********"+project_sex+"***********");
		if(project_sex.equals("Ů")){//Ů
			ab="f";
		}
		else{//��
			ab="m";				
		}
		//System.out.println("11********"+ab+"***********");
		DbConn dc = new DbConn();
		String sql = "select Project_id,Project_sex,Project_category,Project_name,Project_number from project where Project_sex='"+ab+"'";
		//System.out.println("12********"+ab+"***********");
		ResultSet rs = dc.select(sql);
		//System.out.println("13********"+ab+"***********");
		return rs;
	}
	public ResultSet getSaishiBySexX(String project_category)//ˢ������2
	{
		String ab=null;
		String cd=null;
		ab=project_category;
		//System.out.println("20********"+project_category+"***********");
		if(project_category.equals("����Ů")){//����Ů
			ab="0";
			cd="f";
		}
		else if(project_category.equals("������")){//������
			ab="0";
			cd="m";
		}
		else if(project_category.equals("����Ů")){//����Ů
			ab="1";
			cd="f";
		}
		else{//������
			ab="1";
			cd="m";				
		}
		//System.out.println("21********"+ab+"***********");
		//System.out.println("21--sex********"+cd+"***********");
		DbConn dc = new DbConn();
		String sql = "select Project_id,Project_sex,Project_category,Project_name,Project_number from project where project_category ='"+ab+"' and Project_sex='"+cd+"'";
		//System.out.println("22********"+ab+"***********");
		ResultSet rs = dc.select(sql);
		//System.out.println("23********"+ab+"***********");
		return rs;
	}

	public void getDeleteSaishiByName(String id)//ɾ������
	{
		//System.out.println("���¸���ɾ������********"+id+"***********");
		DbConn dc1 = new DbConn();
		String sql1 = "delete from schedule where Project_id ='"+id+"'";
		//System.out.println("ɾ������********"+id+"***********");
		DbConn dc = new DbConn();
		String sql = "delete from project where Project_id='"+id+"'";
		//System.out.println("ɾ������********"+id+"***********");
		dc.update(sql);
		//System.out.println("ɾ������********"+id+"***********");
	}
	
	public ResultSet getUpdateSaishiByName(String id)//��������
	{
		//System.out.println("���¸���********"+id+"***********");
		DbConn dc = new DbConn();
		String sql = "select Project_id,Project_sex,Project_category,Project_name,Project_number from project where project_id ='"+id+"'";
		//System.out.println("���¸���"+id+"***********");
		ResultSet rs = dc.select(sql);
		//System.out.println("���¸���"+id+"***********");
		return rs;
	}	
}
