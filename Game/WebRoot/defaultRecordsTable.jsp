<%@ page language="java" import="java.util.*,java.sql.*" pageEncoding="UTF-8"%>
<%@ page import="juan_servlet.RecordsServlet" %>
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
    <style type="text/css">
    <!--
	table.studenttable td {
		width: 96px;
	}
	-->
    </style>
  </head>
  
  <body>
  <%
  String pid = request.getParameter("pid");
  RecordsServlet rservlet = new RecordsServlet();
  ResultSet rs = rservlet.getDefaultRecordsByPid(pid);
   %>
   <br><br><br>
   <div align="center">
   <table border="5" class="studenttable">
   <tr align="center"><td>运动员编号</td><td>姓名</td><td>学院</td><td>班级</td><td>成绩</td></tr>
   <%
 	while(rs.next()){
 		out.print("<tr align=\"center\"><td>"+rs.getInt(1)+"</td>");
	    out.print("<td>"+rs.getString(2)+"</td>");
	    out.print("<td>"+rs.getString(3)+"</td>");
	    out.print("<td>"+rs.getString(4)+"</td>");  
	   	out.print("<td>"+rs.getString(5)+"</td>");
	    }
     %>
   </table></div>
  </body>
</html>
