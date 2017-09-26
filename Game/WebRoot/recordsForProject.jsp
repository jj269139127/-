<%@ page language="java" import="java.util.*,java.sql.*" pageEncoding="utf-8"%>
<%@ page import="juan_servlet.ClassServlet" %>
<%@ page import="juan_servlet.RecordsServlet"%>
<%@ page import="Info.ClassBean" %>
<%@ page import="Info.StudentBean" %>
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
table.studenttable td {
	width: 80px;
}
-->
    </style>
<script type="text/javascript">   
var XMLHttpReq;
//创建XMLHttpRequest对象       
function createXMLHttpRequest() {
    if(window.XMLHttpRequest) { //Mozilla 浏览器
        XMLHttpReq = new XMLHttpRequest();
    }
    else if (window.ActiveXObject) { // IE浏览器
        try {
            XMLHttpReq = new ActiveXObject("Msxml2.XMLHTTP");
        } catch (e) {
            try {
                XMLHttpReq = new ActiveXObject("Microsoft.XMLHTTP");
            } catch (e) {}
        }
    }
}
//发送请求函数
function sendRequest(url) {
    createXMLHttpRequest();
    XMLHttpReq.open("GET", url, true);
    XMLHttpReq.onreadystatechange = processResponse;//指定响应函数
    XMLHttpReq.send(null);  // 发送请求
}
// 处理返回信息函数
function processResponse() {
    if (XMLHttpReq.readyState == 4) { // 判断对象状态
        if (XMLHttpReq.status == 200) { // 信息已经成功返回，开始处理信息
            var result = XMLHttpReq.responseText;    
            document.getElementById("recordsDiv").innerHTML = result;     
        } else { //页面不正常
            window.alert("该项目无合格的比赛记录。");
        }
    }
}
function getRecordsTable(){
	var pid = document.getElementById("projectid").value;
	if(pid)
		sendRequest("recordsTable.jsp?pid=" + pid+"&num="+Math.random());
	else
		alert("项目编号不能为空。");
}
function showDefaultRecords(){
	var pid = document.getElementById("projectid").value;
	if(pid)
		window.showModalDialog("defaultRecordsTable.jsp?pid=" + pid+"&num="+Math.random());
	else
		alert("项目编号不能为空。");
}
</script>
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
          <th width="200"><jsp:include page="index_left_manager.jsp"/></th>
          <th valign="top" bgcolor="#e3e3e3">
	          <table width="600">
	          	<tr>
	          	<br/><br/>
	          	<td width="300" align="right">项目编号：<input type="text" name="projectid"></td>
	          	<td width="30" align="left"><input type="button" value="查询" onclick="getRecordsTable()"/></td>
	          	<td width="270" align="left"><input type="button" value="查看无效数据" onclick="showDefaultRecords()"/></td>
		        </tr>         		          
		        <tr><td colspan="3">
		        <div id="recordsDiv" align="center">			
				<br>	
				<table border="5"  class="studenttable" bgcolor="#ffffff">
    				<tr align="center"><td>运动员编号</td><td>姓名</td><td>学院</td><td>班级</td><td>成绩</td><td>排名</td></tr>	
    				</table>
						
		          </div>	
		          </td></tr>
	          </table>   
          </th>                 
        </tr>
      </table></th>
    </tr>
  </table>
</body>
</html>
