<%@ page language="java" import="java.util.*,java.sql.*" pageEncoding="UTF-8"%>
<%@ page import="juan_servlet.ClassServlet" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'apartmentselect.jsp' starting page</title>
    
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
  班级：
  <select onchange="showDepartmentCompeter(this.options[this.options.selectedIndex].value)">
  	<option>---请选择---</option>
  	<%
  	String cname = new String(request.getParameter("sort").getBytes("ISO-8859-1"),"GB2312");
  	ClassServlet classservlet = new ClassServlet();
  	//System.out.println("*****"+cname+"*****");
  	ResultSet rs = classservlet.getDepartmentByCname(cname);
  	while(rs.next()){
  		out.println("<option value=\""+rs.getString(1)+"\">"+rs.getString(2)+"</option>");
  	}
  	 %>
  </select>
  </body>
</html>
