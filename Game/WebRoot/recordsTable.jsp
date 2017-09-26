<%@ page language="java" import="java.util.*,java.sql.*" pageEncoding="UTF-8"%>
<%@ page import="juan_servlet.RecordsServlet" %>
<%@ page import="Info.StudentBean" %>
<%@ page import="util.DbConn" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>  
  <body>
  	<%
    String pid=request.getParameter("pid");
 	RecordsServlet rservlet = new RecordsServlet();
 	ResultSet rs = rservlet.getRecordsByProjectid(pid);
 	%>
    <table border="5"  class="studenttable" bgcolor="#ffffff">
    <caption><font color="Red" size="5px">
    <%
    	DbConn dc = new DbConn();
    	ResultSet p = dc.select("select project_name from project where project_id="+pid);
    	p.next();
    	out.print(p.getString(1));
     %>
    </font></caption>
    <tr align="center"><td>运动员编号</td><td>姓名</td><td>学院</td><td>班级</td><td>成绩</td><td>排名</td></tr>
    <%
 	while(rs.next()){
 		out.print("<tr align=\"center\"><td>"+rs.getInt(1)+"</td>");
	    out.print("<td>"+rs.getString(2)+"</td>");
	    out.print("<td>"+rs.getString(3)+"</td>");
	    out.print("<td>"+rs.getString(4)+"</td>");
	    out.print("<td>"+rs.getString(5)+"</td>");
	    out.print("<td>"+rs.getString(6)+"</td>");  
	    }
     %>
     </table>
  </body>
</html>
