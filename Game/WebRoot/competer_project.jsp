<%@ page language="java" import="java.util.*,java.sql.*" pageEncoding="UTF-8"%>
<%@ page import="juan_servlet.StudentServlet" %>
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
  String cid = request.getParameter("cid");
  StudentServlet studentservlet = new StudentServlet();
  ResultSet rs = studentservlet.getStudentByCid(cid);
  ResultSet rsp = studentservlet.getProjectByCid(cid);
  rs.next();
   %>
   <br><br><br>
   <div align="center">
   <table border="5">
   <tr><td>运动员编号：</td><td><%=rs.getInt(1)%></td></tr>
   <tr><td>运动员姓名：</td><td><%=rs.getString(2)%></td></tr>
   <tr><td align="right">学号：</td><td><%=rs.getInt(3)%></td></tr>
   <tr><td align="right">性别：</td><td>
   <%
   if(rs.getString(4).equals("f"))  out.println("女");
   else if (rs.getString(4).equals("m")) out.println("男");
   %>
   </td></tr>
   <tr><td align="right">系别：</td><td><%=rs.getString(5)%></td></tr>
   <tr><td align="right">班级：</td><td><%=rs.getString(6)%></td></tr>
   <%
   	   int i = 1;
       while(rsp.next()){
       		out.println("<tr><td align=\"right\">项目"+i+"：</td><td>"+rsp.getString(1)+"</td></tr>");
       		i++;
       }
    %>
   <tr><td align="right">简介：</td><td><textarea rows="5" cols="20" readonly style="overflow:auto"><%=rs.getString(7)%></textarea></td></tr>
   </table></div>
  </body>
</html>
