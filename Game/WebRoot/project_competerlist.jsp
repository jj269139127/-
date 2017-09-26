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
  String pid = request.getParameter("pid");
  String sort = new String(request.getParameter("sort").getBytes("ISO-8859-1"),"GB2312");
  StudentServlet studentservlet = new StudentServlet();
  ResultSet rs = studentservlet.getStudentForSche(pid,sort);
   %>
   <br><br><br>
   <div align="center">
   <table border="5" width="400">
   <tr align="center"><td width="100">运动员编号</td><td width="100">姓名</td><td width="100">学号</td><td width="100">性别</td></tr>
   <%
   		while(rs.next()){
   		if(rs.getString(4).equals("f"))
   			out.print("<tr align=\"center\"><td>"+rs.getInt(1)+"</td><td>"+rs.getString(2)+"</td><td>"+rs.getInt(3)+"</td><td>女</td></tr>");
   		else
   			out.print("<tr align=\"center\"><td>"+rs.getInt(1)+"</td><td>"+rs.getString(2)+"</td><td>"+rs.getInt(3)+"</td><td>男</td></tr>");
   		}
    %>
   </table></div>
  </body>
</html>
