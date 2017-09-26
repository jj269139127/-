<%@ page language="java" import="java.util.*,java.sql.*" pageEncoding="UTF-8"%>
<%@ page import="juan_servlet.ProjectServlet" %>
<%@ page import="juan_servlet.ScheduleServlet" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
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
    <% 
  String projectid = request.getParameter("pid"); 
  int pid = Integer.valueOf(projectid); 
  ProjectServlet projectservlet = new ProjectServlet(); 
  ScheduleServlet scheservlet = new ScheduleServlet();
  ResultSet rsp = projectservlet.getProjectByProjectid(pid); 
  ResultSet rs = scheservlet.getScheduleByPid(pid);
  rsp.next(); 
   
   %>
   <br><br><br>
   <div align="center">
   <table border="5" width="400">
   <tr><td align="right" width="80">比赛编号：</td><td><%=rsp.getInt(1)%></td></tr>
   <tr><td align="right">项目名称：</td><td><%=rsp.getString(2)%></td></tr>
   <tr><td align="right">类别：</td><td><%
   if(rsp.getString(3).equals("1"))
   		out.print("径赛");
   		else out.print("田赛");
	%></td></tr>
   <tr><td align="right">最大人数：</td><td><%=rsp.getInt(4)%></td></tr>
   
   
   <% if(rs.next()){%>
   <tr><td align="right">地点：</td><td><%=rs.getString(1)%></td></tr>
   <%
   	   out.println("<tr><td align=\"right\">"+rs.getString(4)+"：</td><td>"+rs.getString(2)+"~"+rs.getString(3)+"</td></tr>");
       while(rs.next()){
       		out.println("<tr><td align=\"right\">"+rs.getString(4)+"：</td><td>"+rs.getString(2)+"~"+rs.getString(3)+"</td></tr>");
       }}
       else{
    %>
    <tr><td align="right">地点：</td><td>未安排</td></tr>
    <tr><td align="right">时间：</td><td>未安排</td></tr>
    <%} %>
   </table></div>
  </body>
</html>
