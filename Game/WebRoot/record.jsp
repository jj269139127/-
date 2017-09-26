<%@ page language="java" import="java.util.*,java.sql.*" pageEncoding="utf-8"%>
<%@ page import="util.*"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>运动会管理系统</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->


	
    <style type="text/css">
<!--
.STYLE1 {color: #0000FF}
.STYLE2 {
	color: #333333;
	font-size: 14px;
}
-->
    </style>
</head>
  
  <body>

  <table width="800" align="center" cellspacing="0">
    <tr>
      <th scope="col"><table width="800" border="1" cellspacing="0" bordercolor="#999999">
        <tr>
          <th height="150" colspan="2" scope="col"><img src="image/henfu.jpg" width="800" height="176"></th>
        </tr>
        <tr>
          <th height="40" colspan="2" scope="col"><jsp:include page="index_center.jsp"/></th>
        </tr>
        <tr>
          <th width="200" scope="col"><jsp:include page="index_left_student.jsp"/></th>
          <th width="600" height="550" scope="col" valign="middle" bgcolor="#e3e3e3">
          <%
         	DbConn dc = new DbConn();
         	String info="select competer_id from student where student_number="+session.getAttribute("username")+"";
         	ResultSet ret=dc.select(info);
         	ret.next();
         	int num=ret.getInt(1);
         	if(num==0)
         	{
         	response.sendRedirect("index_student.jsp?success=sign");
         	}else{
          %>
          <%
          response.setCharacterEncoding("utf-8");
          response.setCharacterEncoding("utf-8");
         	DbConn de=new DbConn();
         	String s1="select project_id,grades_grades,grades_ranking,grades_flag from records where competer_id =(select competer_id from student where student_number="+session.getAttribute("username")+")";
         	ResultSet rs=de.select(s1);
         	out.println("<div style=\"height:480px;overflow-y:auto;\">");
         	out.println("<table border='5' bgcolor=\"#ffffff\">");
         	out.println("<caption><font size=\"22px\">你的成绩如下</font></caption>");
         	out.println("<tr><th>项目编号</th><th>项目名称</th><th>项目类型</th><th>比赛成绩</th><th>比赛排名</th><th>比赛状态</th></tr>");
         	while(rs.next())
         	{
         	String s2="select project_name,project_category from project where project_id="+rs.getInt(1);
         	ResultSet rs2=de.select(s2);
         	rs2.next();
	         	if("0".equals(rs2.getString(2))) 
	         	{
	         	String s="田赛";
	         	if(rs.getInt(4)==0) {String f="未比赛";
		         	out.println("<tr><td>"+rs.getInt(1)+"</td><td>"+rs2.getString(1)+"</td><td>"+s+"</td><td>"+rs.getInt(2)+"</td><td>"+rs.getString(3)+"</td><td>"+f);
		         	}
		         	else{String f="已比赛";
		         	out.println("<tr><td>"+rs.getInt(1)+"</td><td>"+rs2.getString(1)+"</td><td>"+s+"</td><td>"+rs.getInt(2)+"</td><td>"+rs.getString(3)+"</td><td>"+f);
		         	}
	         	}
	         	else
	         	{
	         	String s="竞赛";
	         	if(rs.getInt(4)==0) {String f="未比赛";
		         	out.println("<tr><td>"+rs.getInt(1)+"</td><td>"+rs2.getString(1)+"</td><td>"+s+"</td><td>"+rs.getInt(2)+"</td><td>"+rs.getString(3)+"</td><td>"+f);
		         	}
		         	else{String f="已比赛";
		         	out.println("<tr><td>"+rs.getInt(1)+"</td><td>"+rs2.getString(1)+"</td><td>"+s+"</td><td>"+rs.getInt(2)+"</td><td>"+rs.getString(3)+"</td><td>"+f);
		         	}
		         }
         	}
         	out.println("</table></div>");}
           %>
          
          
          
          
          
          
          
          
          
          
        </tr>
      </table></th>
    </tr>
  </table>
</body>
</html>
