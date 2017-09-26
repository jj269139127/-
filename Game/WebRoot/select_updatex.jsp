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
    
    <title>My JSP 'select_updatex.jsp' starting page</title>
    
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
    更改数据后点击保存！<br>
    <table border="5"  class="scheduletable" bgcolor="#ffffff">
    <tr align="center"><td>项目编号</td><td>性别</td><td>类型</td><td>名称</td><td>最大人数</td></tr>
    <%
  	String id = new String(request.getParameter("sort").getBytes("ISO-8859-1"),"GB2312");
  	ProjectServlet projectservlet = new ProjectServlet();
  	//System.out.println("update_name3---"+id+"*****");
  	ResultSet rs = projectservlet.getUpdateSaishiByName(id);
  	//System.out.println("update_name4---"+id+"*****getUpdateSaishiByName完成！");
  	rs.next();
  	//System.out.println("快点修改！");
		String ab=null;
		String cd=null;
		if((rs.getString(3)).equals("0"))//田赛
		{
			ab="田赛";
		}
		else
		{
			ab="径赛";
		}
		if((rs.getString(2)).equals("f"))//田赛
		{
			cd="女";
		}
		else
		{
			cd="男";
		}
	out.print("<td><input type=\"text\" name=\"Project_id\" value=\""+rs.getInt(1)+"\" readonly=\"readonly\"/></td>");
	out.print("<td>"+cd+"</td>");
	out.print("<td>"+ab+"</td>");
	out.print("<td>"+rs.getString(4)+"</td>");
	out.print("<td><input type=\"text\" name=\"Project_number\" value=\""+rs.getInt(5)+"\" /></td>");
  	%>
  </body>
</html>
