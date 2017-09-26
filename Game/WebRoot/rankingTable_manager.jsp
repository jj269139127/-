<%@ page language="java" import="java.util.*,java.sql.*" pageEncoding="utf-8"%>
<%@ page import="juan_servlet.RecordsServlet"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'rankingTable_manager.jsp' starting page</title>
    
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
    <table border="5"  class="studenttable" id="rankingTable" bgcolor="#ffffff">
    	<tr align="center"><td>名称</td><td>人数</td><td>得分</td><td>排名</td></tr>	
    	<%
    	  	String cname=new String(request.getParameter("sort").getBytes("ISO-8859-1"),"GB2312");
    		RecordsServlet rservlet = new RecordsServlet();
    		ResultSet rs = rservlet.getRankingByCnameInClass(cname);
    		int i=0;
    		while(rs.next()){
    			int num = rservlet.getCnumForClassByClassid(rs.getInt(1));
    			out.print("<tr align=\"center\"><td>"+rs.getString(2)+"</td><td>"+num+"</td><td>"+rs.getInt(3)+"</td><td>"+(++i)+"</td></tr>");
    		}
    	%>
    	</table>
  </body>
</html>
