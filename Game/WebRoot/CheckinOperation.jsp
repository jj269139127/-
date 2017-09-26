<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="juan_servlet.RecordsServlet" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'CheckinOperation.jsp' starting page</title>
    
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
    	String pid = new String(request.getParameter("pid").getBytes("ISO-8859-1"),"GB2312");
    	String cid=new String(request.getParameter("cid").getBytes("ISO-8859-1"),"GB2312");
    	RecordsServlet r = new RecordsServlet();
    	r.changeCheckin(pid,cid);
     %>
  </body>
</html>
