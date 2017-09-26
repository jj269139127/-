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
    String cid=request.getParameter("cid");
 	RecordsServlet rservlet = new RecordsServlet();
 	ResultSet rs = rservlet.getRecordsForInput(pid,cid);
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
    
    <tr align="center"><td>运动员编号</td><td>姓名</td><td>成绩</td><td>排名</td><td>成绩有效</td></tr>
    <%
 	while(rs.next()){
 		out.print("<tr align=\"center\"><td>"+rs.getInt(1)+"</td>");
	    out.print("<td>"+rs.getString(2)+"</td>"); 
	    String grades;
	    if("null".equals(rs.getString(3))||"".equals(rs.getString(3))||rs.getString(3)==null){
	    	grades = "";
	    }
	    else
	    	grades=rs.getString(3);
	    //System.out.println(grades);
	    out.print("<td><input name=\"grades"+rs.getInt(1)+"\" type=\"text\" size=\"12\" value=\""+grades+"\"/>"); 
	    out.print("<td><input name=\"ranking"+rs.getInt(1)+"\" type=\"text\" size=\"12\" value=\""+rs.getString(4)+"\"/>");
	    out.print("<td><input name=\"flag"+rs.getInt(1)+"\" type=\"checkbox\"  value=\"1\" Checked></tr>");
	    }
     %>
     </table>
  </body>
</html>
