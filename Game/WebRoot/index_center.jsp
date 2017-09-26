<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="java.text.SimpleDateFormat" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%
  SimpleDateFormat matter=new SimpleDateFormat("yyyy年MM月dd日"); 
  Date date=new Date(); 
  String nowTime=matter.format(date); 
 %>
<table width="800" border="0" cellspacing="0">
  <tr>
    <td width="50">&nbsp;</td>
    <td width="150"><div align="right"><strong>当前用户：</strong></div></td>
    <td width="170"><strong><%=session.getAttribute("username") %></strong></td>
    <td width="150" height="40"><div align="right"><strong>当前时间：</strong></div></td>
    <td width="150"><strong><%=nowTime %></strong></td>
    <td width="150"><div align="right"><strong>类型：</strong></div></td>
    <td width="100"><strong><%=session.getAttribute("identity") %></strong></td>
    <td width="50">&nbsp;</td>
  </tr>
</table>
