<%@ page language="java" import="java.util.*,java.sql.*" pageEncoding="UTF-8"%>
<%@ page import="juan_servlet.ProjectServlet" %>
<%@ page import="Info.StudentBean" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>  
  <body>
    <table border="5"  class="studenttable" bgcolor="#ffffff">
    <tr align="center"><td>项目编号</td><td>名称</td><td>人数</td><td>类别</td><td>详细资料</td><td>人员</td></tr>
    <%
    String sort=new String(request.getParameter("sort").getBytes("ISO-8859-1"),"GB2312");
	//System.out.println("********"+sort+"**********");
    if(!sort.matches("[0-9]+")){
	    ProjectServlet projectServlet = new ProjectServlet();
	    ResultSet prs = projectServlet.getProjectByCname(sort);
	    while(prs.next()){
	    	out.print("<tr align=\"center\"><td>"+prs.getInt(1)+"</td>");
	    	out.print("<td>"+prs.getString(2)+"</td>");
	    	out.print("<td>"+projectServlet.getNumByProject(sort,prs.getInt(1))+"</td>");
	    	if(prs.getString(3).equals("1"))
	    		out.print("<td>径赛</td>");
	    	else out.print("<td>田赛</td>");
	    	out.print("<td><input type=\"button\" value=\"详细信息\" onclick=\"getProjectInformation('"+prs.getInt(1)+"')\"/></td>");
	    	out.print("<td><input type=\"button\" value=\"名单\" onclick=\"getCompeterList('"+prs.getInt(1)+"','"+sort+"')\"/></td>");
	    }
    }
    else
    {
    	int classid = Integer.valueOf(sort);
    	ProjectServlet projectServlet = new ProjectServlet();
	    ResultSet prs = projectServlet.getProjectByClassid(classid);
	    while(prs.next()){
	    	out.print("<tr align=\"center\"><td>"+prs.getInt(1)+"</td>");
	    	out.print("<td>"+prs.getString(2)+"</td>");
	    	out.print("<td>"+projectServlet.getNumByProject(classid,prs.getInt(1))+"</td>");
	    	if(prs.getString(3).equals("1"))
	    		out.print("<td>径赛</td>");
	    	else out.print("<td>田赛</td>");
	    	out.print("<td><input type=\"button\" value=\"详细信息\" onclick=\"getProjectInformation('"+prs.getInt(1)+"')\"/></td>");
	    	out.print("<td><input type=\"button\" value=\"名单\" onclick=\"getCompeterList('"+prs.getInt(1)+"','"+classid+"')\"/></td>");
	    }
    }
     %>
  </body>
</html>
