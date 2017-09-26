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
    
    <title>My JSP 'select_saishi.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body><table border="5"  class="scheduletable" bgcolor="#ffffff">
    <tr align="center"><td>项目编号</td><td>性别</td><td>类型</td><td>名称</td><td>最大人数</td><td>修改</td><td>删除</td></tr>

  	<%
  	String sex = new String(request.getParameter("sort").getBytes("ISO-8859-1"),"GB2312");
  	ProjectServlet projectservlet = new ProjectServlet();
  	//System.out.println("saishi---"+sex+"123456sex*****");
  	ResultSet rs = projectservlet.getSaishiBySex(sex);
  	//System.out.println("saishi---"+sex+"*****getSaishiBySex完成！");
  	while(rs.next()){
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
	    	out.print("<tr align=\"center\"><td>"+rs.getInt(1)+"</td>");
	    	out.print("<td>"+cd+"</td>");
	    	out.print("<td>"+ab+"</td>");
	    	out.print("<td>"+rs.getString(4)+"</td>");
	    	out.print("<td>"+rs.getInt(5)+"</td>");
	    	out.print("<td><input type=\"button\" value=\"修改\" onclick=\"UpdateSchedule('"+rs.getInt(1)+"')\"/></td>");
	    	out.print("<td><input type=\"button\" value=\"删除\" onclick=\"DeleteSchedule('"+rs.getInt(1)+"')\"/></td>");
  	}
  	 %>
  </body>
</html>
