<%@ page language="java" import="java.util.*,java.sql.*" pageEncoding="utf-8"%>
<%@ page import="util.*" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'scheduleTable.jsp' starting page</title>
    
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
     out.println("<table border='5' bgcolor=\"#ffffff\">");
  	out.println("<tr><th>项目编号</th><th>项目名称</th><th>比赛地点</th><th>开始时间</th><th>结束时间</th></tr>");
    String sort=new String(request.getParameter("sort").getBytes("ISO-8859-1"),"GB2312");
    DbConn dc=new DbConn();
    String sx="select student_sex from student where student_number="+session.getAttribute("username");
    ResultSet se=dc.select(sx);
    se.next();
    String ss=se.getString(1);
    //System.out.println(ss);
    if(ss==null || "null".equals(ss) || "".equals(ss))
    {System.out.println(ss+"1111");
    String saishi="select project_id from project where project_category='"+sort+"'";
    System.out.println(sort);
    ResultSet rs=dc.select(saishi);
    while(rs.next())
    {
    	int p_id=rs.getInt(1);
    	String s2="select project_name,schedule_address,schedule_starttime,schedule_endtime,schedule_name from project p,schedule s where p.project_id=s.project_id and p.project_id ="+rs.getInt(1)+"";
	    ResultSet rs2=dc.select(s2);
	    
	    while(rs2.next()){
    	out.println("<tr><td>"+rs.getInt(1)+"</td><td>"+rs2.getString(1)+rs2.getString(5)+"</td><td>"+rs2.getString(2)+"</td><td>"+rs2.getString(3)+"</td><td>"+rs2.getString(4)+"</td></tr>");
	     }    	
    }
    out.println("</table>");
    }
    else
    {
    String saishi="select project_id from project where project_category='"+sort+"' and project_sex='"+se.getString(1)+"'";
    ResultSet rs=dc.select(saishi);
    while(rs.next())
    {
    	int p_id=rs.getInt(1);
    	String s2="select project_name,schedule_address,schedule_starttime,schedule_endtime,schedule_name from project p,schedule s where p.project_id=s.project_id and p.project_id ="+rs.getInt(1)+"";
	    ResultSet rs2=dc.select(s2);
	    //String s[] = new String[3];
	    //s[0]=new String("初赛");
	    while(rs2.next()){
	    	out.println("<tr><td>"+rs.getInt(1)+"</td><td>"+rs2.getString(1)+rs2.getString(5)+"</td><td>"+rs2.getString(2)+"</td><td>"+rs2.getString(3)+"</td><td>"+rs2.getString(4)+"</td></tr>");
	    }	         	
    }
    out.println("</table>");
    
    }
     %>
  </body>
</html>
