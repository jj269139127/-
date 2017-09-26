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
 	ResultSet rs = rservlet.getInfoByPinCid(pid,cid);
 	int i=1;
 	%>
 	
    <table border="5"  class="studenttable" bgcolor="#FFFFFF">
    <caption><font color="Red">
    <%
    	DbConn dc = new DbConn();
    	ResultSet p = dc.select("select project_name from project where project_id="+pid);
    	p.next();
    	out.print(p.getString(1));
     %>
    </font></caption>
    <tr align="center"><td>运动员编号</td><td>姓名</td><td>学院</td><td>班级</td><td>检录</td></tr>
    <%
 	while(rs.next()){
 		out.print("<tr align=\"center\"><td>"+rs.getInt(1)+"</td>");
	    out.print("<td>"+rs.getString(2)+"</td>");
	    out.print("<td>"+rs.getString(3)+"</td>");
	    out.print("<td>"+rs.getString(4)+"</td>");  
	    //System.out.println(rs.getString(6));
	    if(rs.getInt(5)==0&&("null".equals(rs.getString(6))||"".equals(rs.getString(6))||rs.getString(6)==null))
	    {
	    	out.print("<td><input id=\"checkinButton"+i+"\"type=\"button\" value=\"检录\" onclick=\"doCheckin('"+i+"','"+pid+"','"+rs.getInt(1)+"')\"/>");
	    	out.print("<input id=\"cancelCheckinButton"+i+"\"type=\"button\" value=\"取消检录\" onclick=\"doCancelCheckin('"+i+"','"+pid+"','"+rs.getInt(1)+"')\" disabled=\"disabled\"/></td>");
	    }
	    else
	    {
	    	out.print("<td><input id=\"checkinButton"+i+"\"type=\"button\" value=\"检录\" onclick=\"doCheckin('"+i+"','"+pid+"','"+rs.getInt(1)+"')\" disabled=\"disabled\"/>");
	    	out.print("<input id=\"cancelCheckinButton"+i+"\"type=\"button\" value=\"取消检录\" onclick=\"doCancelCheckin('"+i+"','"+pid+"','"+rs.getInt(1)+"')\"/></td>");
	    }
	    i++;
	    }
     %>
     </table>
  </body>
</html>
