<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>东华大学运动会管理系统</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
    <style type="text/css">
	.STYLE2 {	font-family: verdana, tahoma, sans-serif;
		FONT-SIZE: 12px;
		font-weight: bold;
		color: #000000;
	}
	.STYLE3 {font-size: 16px}
	.STYLE4 {font-size: 12px}
	.STYLE5 {font-family: verdana, tahoma, sans-serif; FONT-SIZE: 12px; font-weight: bold; }
	.grey {FONT-SIZE: 12px;color:#666666}
	.orange {font-family: verdana, tahoma, sans-serif;font-size:10px;color:#FF00ff}
	.password {background-image:url(images/password.gif);
		background-position: 1px 1px;
		background-repeat:no-repeat;
		padding-left:20px;
		height:20px;
		FONT-SIZE: 12px;}
	.title {font-family: verdana, tahoma, sans-serif;FONT-SIZE: 10px;font-weight:bold}
	.username {background-image:url(images/username.gif);
		background-position: 1px 1px;
		background-repeat:no-repeat;
		padding-left:20px;
		height:20px;
		FONT-SIZE: 12px;}
    </style>
</head>
  
  <body>
  <br>
  <table width="762" border="0" align="center">
    <tr>
      <td height="500" background="image/background2.jpg">
      <form name="form1" method="post" action="LoginServlet">
        <br><br><br><br><br><br><br>
        <table width="329" border="0" align="center">
          <tr>
            <td><table width="308" border="1" align="center" cellpadding="5" cellspacing="0" bgcolor="#127034">
              <tr>
                <td height="32" bgcolor="#F4F4F4" class="title" align="center"><span class="STYLE3">登&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;陆</span></td>
              </tr>
              <tr>
                <td></td>
              </tr>
              <tr>
                <td class="STYLE5" align="center">学&nbsp;&nbsp;&nbsp;号:&nbsp;<input name="username" type="text" size="19"></td>
              </tr>
              <tr>
                <td></td>
              </tr>
              <tr>
                <td class="STYLE5" align="center">密&nbsp;&nbsp;&nbsp;码:&nbsp;<input name="password" type="password" size="19"></td>
              </tr>
              <tr>
                <td class="STYLE5" align="center">身&nbsp;&nbsp;&nbsp;份:&nbsp;
                <select type="select" name="identity">
                <option value="0">管理员</option>
                <option value="1">运动员</option>
                </select>
                </td>
              </tr>
              <tr>
                <td align="right"><div align="center">
                  <input type="submit"  value="提交">
                </div></td>
              </tr>
            </table></td>
          </tr>
        </table>
        </form></td>
    </tr>
  </table>
</body>
</html>
