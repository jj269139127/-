<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="juan_servlet.ClassServlet" %>
<%@ page import="Info.StudentBean" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>  
  <body>
    <table border="5"  class="studenttable" bgcolor="#FFFFFF">
    <tr align="center"><td>运动员编号</td><td>姓名</td><td>学号</td><td>详细资料</td></tr>
    <%
    String sort=new String(request.getParameter("sort").getBytes("ISO-8859-1"),"GB2312");
    
    //String classid=new String(request.getParameter("classid").getBytes("ISO-8859-1"),"GB2312");
    if(!sort.matches("[0-9]+")){
    ClassServlet classServlet = new ClassServlet();
    ArrayList<StudentBean> slist = classServlet.getStudentByCname(sort);
    Iterator cit = slist.iterator();
    	while(cit.hasNext()){
    		StudentBean cb = (StudentBean)cit.next();
    		out.print("<tr align=\"center\"><td>"+cb.getCompeter_id()+"</td>");
    		out.print("<td>"+cb.getStudent_name()+"</td>");
    		out.print("<td>"+cb.getStudent_number()+"</td>");
    		out.print("<td><input type=\"button\" value=\"详细信息\" onclick=\"getCompeterInformation('"+cb.getCompeter_id()+"')\"/></td>");
    	}
    }
    else
    {
    ClassServlet classServlet = new ClassServlet();
    ArrayList<StudentBean> slist = classServlet.getStudentByClassid(sort);
    Iterator cit = slist.iterator();
    	while(cit.hasNext()){
    		StudentBean cb = (StudentBean)cit.next();
    		out.print("<tr align=\"center\"><td>"+cb.getCompeter_id()+"</td>");
    		out.print("<td>"+cb.getStudent_name()+"</td>");
    		out.print("<td>"+cb.getStudent_number()+"</td>");
    		out.print("<td><input type=\"button\" value=\"详细信息\" onclick=\"getCompeterInformation('"+cb.getCompeter_id()+"')\"/></td>");
    	}
    }
     %>
  </body>
</html>
