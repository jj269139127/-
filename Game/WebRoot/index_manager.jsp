<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
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
          <th width="200" scope="col"><jsp:include page="index_left_manager.jsp"/></th>
          <th width="600" height="550" scope="col" valign="top"><p>&nbsp;</p>
          <p>&nbsp;</p>
          <p>&nbsp;</p>
          <p><img src="image/index.jpg" width="450" height="323"></p>
          <br><br><br>       
          <p align="center"><span class="STYLE2"> 作者：雷前春 &nbsp;&nbsp; 倪梦妃&nbsp;&nbsp;&nbsp; 金娟 </span></p></th>
        </tr>
      </table></th>
    </tr>
  </table>
</body>
</html>
