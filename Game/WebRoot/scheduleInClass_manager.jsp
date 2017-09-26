<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="juan_servlet.ClassServlet" %>
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
</head>
  
  <body>

<script type="text/javascript">
	var XMLHttpReq1;
	var XMLHttpReq2;
	function createXMLHttpRequest() {
		if(window.XMLHttpRequest1) { //Mozilla 浏览器
			XMLHttpReq1 = new XMLHttpRequest();
		}
		else if (window.ActiveXObject) { // IE浏览器
			try {
				XMLHttpReq1 = new ActiveXObject("Msxml2.XMLHTTP");
			} catch (e) {
				try {
					XMLHttpReq1 = new ActiveXObject("Microsoft.XMLHTTP");
				} catch (e) {}
			}
		}
		if(window.XMLHttpRequest2) { //Mozilla 浏览器
			XMLHttpReq2 = new XMLHttpRequest();
		}
		else if (window.ActiveXObject) { // IE浏览器
			try {
				XMLHttpReq2 = new ActiveXObject("Msxml2.XMLHTTP");
			} catch (e) {
				try {
					XMLHttpReq2 = new ActiveXObject("Microsoft.XMLHTTP");
				} catch (e) {}
			}
		}
	}
	function showScheduleTable(obj){
		//alert(obj);
		sendRequest("scheduleTable_manager.jsp?sort=" + obj+"&num="+Math.random(),"departmentselect.jsp?sort="+obj+"&num="+Math.random());
	}
 //发送请求函数
	function sendRequest(url1,url2) {
	//alert(url1+"*****"+url2);
		createXMLHttpRequest();
		XMLHttpReq1.open("GET", url1, true);
		XMLHttpReq2.open("GET", url2, true);
		XMLHttpReq1.onreadystatechange = processResponse1;//指定响应函数
		XMLHttpReq2.onreadystatechange = processResponse2;
		XMLHttpReq1.send(null);  // 发送请求
		XMLHttpReq2.send(null);
	}
// 处理返回信息函数
   	function processResponse1() {
        if (XMLHttpReq1.readyState == 4) { // 判断对象状态
            if (XMLHttpReq1.status == 200) { // 信息已经成功返回，开始处理信息
       //alert(XMLHttpReq1.responseText);
                var result = XMLHttpReq1.responseText; 
    			document.getElementById("plistDiv").innerHTML=result;
            } else { //页面不正常
                  alert("您所请求的页面有异常1。");
            }
        }
    }
    function processResponse2() {
        if (XMLHttpReq2.readyState == 4) { // 判断对象状态
            if (XMLHttpReq2.status == 200) { // 信息已经成功返回，开始处理信息
                var result = XMLHttpReq2.responseText; 
    			document.getElementById("secondselect").innerHTML=result;
            } else { //页面不正常
            
                  alert("您所请求的页面有异常2。");
            }
        }
    }
</script>
<script type="text/javascript">
	var XMLHttpReq;
	function createXMLHttpRequest_() {
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
	function showDepartmentCompeter(obj){
		sendRequest_("scheduleTable_manager.jsp?sort=" + obj+"&num="+Math.random());
	}
 //发送请求函数
	function sendRequest_(url) {
	//alert(url);
		createXMLHttpRequest_();
		XMLHttpReq.open("GET", url, true);
		XMLHttpReq.onreadystatechange = processResponse_;//指定响应函数
		XMLHttpReq.send(null);  // 发送请求
	}
// 处理返回信息函数
   	function processResponse_() {
        if (XMLHttpReq.readyState == 4) { // 判断对象状态
            if (XMLHttpReq.status == 200) { // 信息已经成功返回，开始处理信息
                var result = XMLHttpReq.responseText; 
    			document.getElementById("plistDiv").innerHTML=result;
            } else { //页面不正常
            
                  alert("您所请求的页面有异常3。");
            }
        }
    }
</script>
 <script type="text/javascript">
function getProjectInformation(pid)
{
	window.showModalDialog("project_schedule.jsp?pid="+pid);
}
function getCompeterList(pid,cname)
{
	window.showModalDialog("project_competerlist.jsp?pid="+pid+"&sort="+cname);
}
</script>

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
	          	<br/><br/><td width="300">
	          	<div align="right">
	          	学院：
		          <select name="recordInClass" onchange="showScheduleTable(this.options[this.options.selectedIndex].value)">
		          <option name="">---请选择---</option>
		          <%
		          ClassServlet classServlet = new ClassServlet();
		          ArrayList classlist = classServlet.getClassArray();
		          Iterator cit = classlist.iterator();
		          while(cit.hasNext()){
		          ClassBean cb = (ClassBean)cit.next();
		          out.println("<option value="+cb.getClass_name()+">"+cb.getClass_name()+"</option>)");
		          }%>
		          </select></div></td>
		          <td width="300"><div id="secondselect"> 班级： 
		          <select name="department" onchange="">
		          <option value="">---请选择---</option>
		          </select>
		          </div></td>
		          </tr>         		          
		          <tr><td colspan="2">
		          <br>
		          <div id="plistDiv" align="center"  style="height:480px;overflow-y:auto;">			
					
					<table border="5"  class="studenttable" bgcolor="#ffffff">
					<tr align="center"><td>项目编号</td><td>名称</td><td>人数</td><td>类别</td><td>详细资料</td><td>人员</td></tr>	
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
