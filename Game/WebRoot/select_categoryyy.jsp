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
    
    <title>My JSP 'select_categoryyy.jsp' starting page</title>
    
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
	<% String flag_sex=null;
    //out.print("<select onchange=\"showTable2(this.options[this.options.selectedIndex].value,"+flag_sex+")\">");
    //System.out.println("<select onchange=\"showTable2(this.options[this.options.selectedIndex].value,"+flag_sex+")\">");
  %>
	<select onchange="showTable2(this.options[this.options.selectedIndex].value)">
  	<option>---请选择---</option>
  	<% 	
	String sex = new String(request.getParameter("sort").getBytes("ISO-8859-1"),"GB2312");
	flag_sex=sex;
	ProjectServlet projectservlet = new ProjectServlet();
  	//System.out.println("categoryyy---"+sex+"*****");
  	//System.out.println("categoryyy---"+flag_sex+"哇哇");
  	ResultSet rs = projectservlet.getCategoryBySex(sex);
  	//System.out.println("categoryyy---"+sex+"*****getCategoryBySex完成！");
  	while(rs.next()){
  		String ab=null;
  		if((rs.getString(1)).equals("0"))//田赛
  		{
  			ab="田赛";
  			ab=ab+flag_sex;
  		}
  		else
  		{
  			ab="径赛";
  			ab=ab+flag_sex;
  		}
  		out.println("<option value=\""+ab+"\">"+ab+"</option>");
  		//out.println("<option value=\""+rs.getString(1)+"\">"+rs.getString(1)+"</option>");
  	}
  	 %>
  </select>
  </body>
</html>
