<%@ page language="java" import="java.util.*,java.sql.*" pageEncoding="utf-8"%>
<%@ page import="servlet.ProjectServlet" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'select_update.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
    更改数据后点击保存！ <br>
    <table border="5"  class="scheduletable" bgcolor="#ffffff">
    <tr align="center"><td>项目编号</td><td>项目名称</td><td>性别</td><td>最大人数</td><td>地点</td><td>开始时间</td><td>结束时间</td></tr>
    <%
  	String name = new String(request.getParameter("sort").getBytes("ISO-8859-1"),"GB2312");
  	ProjectServlet projectservlet = new ProjectServlet();
  	//System.out.println("update_name1---"+name+"*****");
  	ResultSet rs = projectservlet.getUpdateByName(name);
  	//System.out.println("update_name2---"+name+"*****getUpdateByName完成！");
  	rs.next();
  	//System.out.println("哇哈哈哈哈哈哈哈哈！");
		String ab=null;
		if((rs.getString(3)).equals("f"))//田赛
		{
			ab="女";
		}
		else
		{
			ab="男";
		}
	//out.print("<tr align=\"center\"><td>"+rs.getInt(1)+"</td>");
	out.print("<td><input type=\"text\" name=\"Project_id\" value=\""+rs.getInt(1)+"\" size=\"4\" readonly=\"readonly\"/></td>");
	out.print("<td>"+name+"</td>");
	out.print("<td>"+ab+"</td>");
	out.print("<td>"+rs.getInt(4)+"</td>");
	out.print("<td><input type=\"text\" name=\"Schedule_address\" value=\""+rs.getString(5)+"\" size=\"6\"/></td>");
	out.print("<td><input type=\"text\" name=\"Schedule_starttime\" value=\""+rs.getString(6)+"\" /></td>");
	out.print("<td><input type=\"text\" name=\"Schedule_endtime\" value=\""+rs.getString(7)+"\" /></td>");
  	%>
  </body>
</html>
