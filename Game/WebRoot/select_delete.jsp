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
    
    <title>My JSP 'select_delete.jsp' starting page</title>
    
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
    删除成功，点击返回！ <br>
    <table border="5"  class="scheduletable" bgcolor="#ffffff">
    <tr align="center"><td>项目编号</td><td>项目名称</td><td>性别</td><td>最大人数</td><td>地点</td><td>开始时间</td><td>结束时间</td><td>修改</td><td>删除</td></tr>
    <%
  	String name = new String(request.getParameter("sort").getBytes("ISO-8859-1"),"GB2312");
  	ProjectServlet projectservlet = new ProjectServlet();
  	//System.out.println("delete_name1---"+name+"*****");
  	projectservlet.getDeleteScheduleByName(name);
  	//System.out.println("delete_name2---"+name+"*****getDeleteScheduleByName完成！");
  	%>
  </body>
</html>
