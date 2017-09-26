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
.STYLE1 {color: #333333;font-size: 14px;}
.STYLE2 {
	color: #0000ff;
	font-size: 24px;
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
          <th width="600" height="550" scope="col" valign="middle">
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
          
         <span  class="STYLE2"> 恭喜你，你已报名成功</span><p/>
         <span  class="STYLE1">请注意比赛时间和比赛地点，准时比赛</span><br/>
         <span  class="STYLE1">愿你赛出水平，赛出自己，获得优异成绩</span><p/>报名信息<br/>
         <%
         response.setCharacterEncoding("utf-8");
         	DbConn de=new DbConn();
         	String s1="select competer_id from student where student_number="+session.getAttribute("username")+"";
         	ResultSet rs=de.select(s1);
         	rs.next();
         	out.println("<div style=\"height:450px;overflow-y:auto;\">");
         	out.println("<table border='5'>");
         	out.println("<tr><td colspan=6>选手编号："+rs.getInt(1)+"</td></tr>");
         	out.println("<tr><th>项目编号</th><th>项目名称</th><th>项目类型</th><th>比赛地点</th><th>开始时间</th><th>结束时间</th></tr>");
         	String s2="select project_id from records where competer_id ="+rs.getInt(1);
         	ResultSet rs2=dc.select(s2);
         	while(rs2.next())
         	{
	         	int pd=rs2.getInt(1);
	         	String s3="select project_name,project_category,schedule_address,schedule_starttime,schedule_endtime,schedule_name from project p,schedule s where p.project_id=s.project_id and p.project_id ="+rs2.getInt(1)+"";
	         	ResultSet rs3=dc.select(s3);
	         	while(rs3.next()){
	         	if("0".equals(rs3.getString(2))) 
	         	{
	         	String s="田赛";
	         	out.println("<tr><td>"+pd+"</td><td>"+rs3.getString(1)+rs3.getString(6)+"</td><td>"+s+"</td><td>"+rs3.getString(3)+"</td><td>"+rs3.getString(4)+"</td><td>"+rs3.getString(5));
	         	}
	         	else
	         	{
	         	String s="径赛";
	         	out.println("<tr><td>"+pd+"</td><td>"+rs3.getString(1)+rs3.getString(6)+"</td><td>"+s+"</td><td>"+rs3.getString(3)+"</td><td>"+rs3.getString(4)+"</td><td>"+rs3.getString(5));
	         	}
	         	}
         	}
         	out.println("</table></div>");
         	}
          %>
          
          
          </th> 
        </tr>
      </table></th>
    </tr>
  </table>
</body>
</html>
