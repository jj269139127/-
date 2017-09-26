<%@ page language="java" import="java.util.*,java.sql.*" pageEncoding="utf-8"%>
<%@ page import="servlet.ProjectServlet" %>
<%@ page import="Model.ProjectBean" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'manager_Project_name.jsp' starting page</title>
    
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
<script>
   //function submit(){
      //document.getElementById("form").submit();
   //}
 </script>

  <select name="select" onChange="setValue(this.value)">
  	<option value="0">---请选择---</option>
  	<%
  	String category = new String(request.getParameter("sort").getBytes("ISO-8859-1"),"GB2312");
  	ProjectServlet projectservlet = new ProjectServlet();
  	//System.out.println("*****"+category+"*****");
  	ResultSet rs = projectservlet.getProjectByCategory(category);
  	while(rs.next()){
  		//System.out.println(rs.getString(1));
  		//System.out.println(rs.getString(2));
  		out.println("<option value=\""+rs.getString(1)+"\">"+rs.getString(2)+"</option>");
  	}
  	 %>
  </select>
  </body>
</html>
