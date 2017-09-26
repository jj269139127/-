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
	width: 120px;
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
            document.getElementById("checkinDiv").innerHTML = result;     
        } else { //页面不正常
            window.alert("该项目暂无报名记录。");
        }
    }
}
function getCheckinTable(){
	var pid = document.getElementById("projectid").value;
	var cid = document.getElementById("competerid").value;
	if(pid)
		sendRequest("CheckinTable.jsp?pid=" + pid+"&cid="+cid+"&num="+Math.random());
	else
		alert("项目编号不能为空。");
}
</script>
<script type="text/javascript"> 
    function getRankingForClass(){
    	window.location.reload(true);
    }
    
    var XMLHttpReqForCheckin;
    function doCheckin(i,pid,cid){
    	//alert(pid+"************"+cid);
    	document.getElementById("checkinButton"+i).disabled = true;
    	document.getElementById("cancelCheckinButton"+i).disabled = false;
    	sendRequestForCheckin("CheckinOperation.jsp?pid="+pid+"&cid="+cid+"&num="+Math.random());
    }
    function doCancelCheckin(i,pid,cid){
    	//alert(pid+"************"+cid);
    	document.getElementById("checkinButton"+i).disabled = false;
    	document.getElementById("cancelCheckinButton"+i).disabled = true;
    	sendRequestForCheckin("CheckinOperation.jsp?pid="+pid+"&cid="+cid+"&num="+Math.random());
    }
    function sendRequestForCheckin(url){
    	createXMLHttpReqForCheckin();
    	XMLHttpReqForCheckin.open("GET", url, true);
    	XMLHttpReqForCheckin.onreadystatechange = savecheckin;//指定响应函数
    	XMLHttpReqForCheckin.send(null);  // 发送请求
    }
    function createXMLHttpReqForCheckin(){
	    if(window.XMLHttpRequest) { //Mozilla 浏览器
	        XMLHttpReqForCheckin = new XMLHttpRequest();
	    }
	    else if (window.ActiveXObject) { // IE浏览器
	        try {
	            XMLHttpReqForCheckin = new ActiveXObject("Msxml2.XMLHTTP");
	        } catch (e) {
	            try {
	                XMLHttpReqForCheckin = new ActiveXObject("Microsoft.XMLHTTP");
	            } catch (e) {}
	        }
	    }
    }
    function savecheckin(){
    	if (XMLHttpReqForCheckin.readyState == 4) { // 判断对象状态
        if (XMLHttpReqForCheckin.status == 200) { // 信息已经成功返回，开始处理信息
            var result = XMLHttpReqForCheckin.responseText;    
            document.getElementById("result").innerHTML = result;     
        } else { //页面不正常
            window.alert("检录出错。");
        }
    }
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
	          	<td width="250">项目编号：<input type="text" name="projectid"></td>
	          	<td width="270">运动员编号：<input type="text" name="competerid"></td>
	          	<td width="30" align="left"><input type="button" value="查询" onclick="getCheckinTable()"/></td>
		        </tr>         		          
		        <tr><td colspan="3">
		        <div id="checkinDiv" align="center" style="height:480px;overflow-y:auto;">			
				<br>	
				<table border="5"  class="studenttable" bgcolor="#ffffff">
    				<tr align="center"><td>运动员编号</td><td>姓名</td><td>学院</td><td>班级</td><td>检录</td></tr>	
    				</table>
						
		          </div>	
		          </td></tr>
	          </table>   
          </th>                 
        </tr>
      </table></th>
    </tr>
  </table>
  <div id="result"></div>
</body>
</html>
