<%@ page language="java" import="java.util.*,java.sql.*" pageEncoding="UTF-8"%>
<%@ page import="servlet.ProjectServlet" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'select_namex.jsp' starting page</title>
    
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
	<select name="Project_name" onChange="setValue1(this.value)">
  	<option>---请选择---</option>
  	<%
  	String category = new String(request.getParameter("sort").getBytes("ISO-8859-1"),"GB2312");
  	ProjectServlet projectservlet = new ProjectServlet();
  	//System.out.println("namex---"+category+"*****");
  	ResultSet rs = projectservlet.getProjectnameBySexX(category);
  	//System.out.println("category---"+category+"*****getProjectnameBySexX完成！");
  	while(rs.next()){
  		out.println("<option value=\""+rs.getString(1)+"\">"+rs.getString(1)+"</option>");
  	}
  	 %>
  </select>
  </body>
</html>
