<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="servlet.ProjectServlet" %>
<%@ page import="Model.ProjectBean"%>
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
  
  <body><script type="text/javascript">
	//一次刷新两个div
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
	function showTable(obj){
		//alert(obj);
		sendRequest("select_schedule.jsp?sort=" + obj+"&num="+Math.random(),"select_categoryy.jsp?sort="+obj+"&num="+Math.random());
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
	//*****二次刷新一个div
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
	function showTable2(obj){
		//alert(obj);
		sendRequest_("select_schedulex.jsp?sort=" + obj+"&num="+Math.random());
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
	//*****三次刷新一个div
	var XMLHttpReq;
	function createXMLHttpRequest_1() {
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
	function UpdateSchedule(obj)
	{
		//alert(obj);
		sendRequest_1("select_update.jsp?sort=" + obj+"&num="+Math.random());
	}
 //发送请求函数
	function sendRequest_1(url) {
	//alert(url);
		createXMLHttpRequest_1();
		XMLHttpReq.open("GET", url, true);
		XMLHttpReq.onreadystatechange = processResponse_1;//指定响应函数
		XMLHttpReq.send(null);  // 发送请求
	}
// 处理返回信息函数
   	function processResponse_1() {
        if (XMLHttpReq.readyState == 4) { // 判断对象状态
            if (XMLHttpReq.status == 200) { // 信息已经成功返回，开始处理信息
                var result = XMLHttpReq.responseText; 
    			document.getElementById("plistDiv").innerHTML=result;
            } else { //页面不正常
            
                  alert("您所请求的页面有异常4。");
            }
        }
    }
</script>
<script type="text/javascript">
	//*****四次刷新一个div
	var XMLHttpReq;
	function createXMLHttpRequest_2() {
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
	function DeleteSchedule(obj)
	{
		//alert(obj);
		sendRequest_2("select_delete.jsp?sort=" + obj+"&num="+Math.random());
	}
 //发送请求函数
	function sendRequest_2(url) {
	//alert(url);
		createXMLHttpRequest_2();
		XMLHttpReq.open("GET", url, true);
		XMLHttpReq.onreadystatechange = processResponse_2;//指定响应函数
		XMLHttpReq.send(null);  // 发送请求
	}
// 处理返回信息函数
   	function processResponse_2() {
        if (XMLHttpReq.readyState == 4) { // 判断对象状态
            if (XMLHttpReq.status == 200) { // 信息已经成功返回，开始处理信息
                var result = XMLHttpReq.responseText; 
    			document.getElementById("plistDiv").innerHTML=result;
            } else { //页面不正常
            
                  alert("您所请求的页面有异常5。");
            }
        }
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
          <th width="200" scope="col"><jsp:include page="index_left_manager.jsp"/></th>
          <th width="600" height="550" scope="col"  valign="top" bgcolor="#e6e6e6">
          
          <form method="post" action="ChakansaichengServlet">
          <table width="600">
	          	<tr>
	          	<br/><br/><td width="300">
	          	<div align="right">
		          <select name="Project_sex" onchange="showTable(this.options[this.options.selectedIndex].value)">
                	<option name="">---请选择---</option>
		          <%
		          ProjectServlet classServlet = new ProjectServlet();
		          ArrayList classlist = classServlet.getSexArray();
		          Iterator cit = classlist.iterator();
		          while(cit.hasNext()){
		          ProjectBean cb = (ProjectBean)cit.next();
		          String ab=null;
		          if((cb.getProject_sex()).equals("f"))
		          {//女
						ab="女";
				  }
				  else{//男
						ab="男";				
				  }
				  out.println("<option value="+ab+">"+ab+"</option>)");
		          //out.println("<option value="+cb.getProject_sex()+">"+cb.getProject_sex()+"</option>)");
		          }%>
                </select></div></td>
		          <td width="50" align="left">
		          
		          <div id="secondselect">  
		          <select name="category" onchange="">
		          <option value="">---请选择---</option>
		          </select>
		          </div></td>
		          
		          <td width="50" align="center">
		          <input type="button" name="返回" value="返回" onclick="window.location.href='manager_chakansaicheng.jsp'">
		          </td><td width="300" align="left"><input id="save" type="submit" value="保存" ></td></tr>      		          
		          <tr>
		          <td colspan="4">
		          
		          <div id="plistDiv" align="center" style="height:480px;overflow-y:auto;">			
					
					<table border="5"  class="studenttable" bgcolor="#ffffff">
					<tr align="center"><td>项目编号</td><td>项目名称</td><td>性别</td><td>最大人数</td><td>地点</td><td>开始时间</td><td>结束时间</td><td>修改</td><td>删除</td></tr>
				  	
					<tr></tr>
    				</table>          
        </tr>
      </table>
      </form>
      </th>
    </tr>
  </table>
</body>
</html>
