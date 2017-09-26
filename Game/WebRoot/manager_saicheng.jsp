<%@ page language="java" import="java.util.*" contentType="text/html; charset=gb2312" pageEncoding="utf-8"%>
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
	<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
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

 <script language="javascript">
function check(){
  var v0=document.getElementById("Schedule_address").value;
  var v1=document.getElementById("Schedule_starttime").value;
  var v2=document.getElementById("Schedule_endtime").value;
  if(v0==""){
    alert("比赛地址不能为空!");
    return false;
  }
  if(v1==""){
    alert("比赛开始时间不能为空!");
    return false;
  }
  if(v2==""){
    alert("比赛结束时间不能为空!");
    return false;
  }
}
</script>
<script type="text/javascript">
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
		sendRequest("select_name.jsp?sort=" + obj+"&num="+Math.random(),"select_category.jsp?sort="+obj+"&num="+Math.random());
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
		sendRequest_("select_namex.jsp?sort=" + obj+"&num="+Math.random());
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
<script>
function setValue1(val)
{
	//alert(val);
	document.getElementById("text").value = val;
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
          
          <th width="600" height="550" scope="col"  valign="top" bgcolor="#e6e6e6"><br>
          
          
          
          <form name="form2" method="post" action="SaichengServlet" onsubmit="return check()">
            <table width="400">
            <tr>
                <td>性别</td>
                <td>
	          	<div align="left">
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
                </select>
                </div>               
                </td>
              </tr>             
            <tr>
                <td>类型</td>
                <td><div id="secondselect">
                <select name="Project_category" onchange="">
                	<option value="0">---请选择---</option>
                	</select>
            </tr>
              <tr>
                <td>名称</td>
                <td>
                <div id="plistDiv">
                	<select name="Project_name" >
		          <option value="0">---请选择---</option>
		          </select>  </div>            
                </td>
              </tr>              
              <tr>
              <td>进程</td>
              <td>
                	<select name="Schedule_name" >
		          <option value="决赛">决赛</option>
		          <option value="初赛">初赛</option>
		          <option value="复赛">复赛</option> 
		          </select>            
                </td>
              
              </td>
              
              
              
              
              </tr>
			  <!--<tr>
              	<td>人数：</td>
              	<td>
              		<input type="text" size="20" maxlength="20" name="Project_number">
              	</td>
              </tr>    -->            

              <tr>
              	<td>地点</td>
              	<td>
              		<input type="text" size="20" maxlength="20" name="Schedule_address">
              	</td>
              </tr>
              <tr>
                <td>开始</td>
                <td><label>
                  <input type="text" size="20" maxlength="20" name="Schedule_starttime">
                  <!--<input type="text" id="datetimepicker" value="2012-05-15 21:05"></input>-->
                </label></td>
              </tr>
              <tr>
                <td>结束</td>
                <td><label>
                  <input type="text" size="20" maxlength="20" name="Schedule_endtime">
                </label></td>
              </tr>
              <tr>
                <td colspan="2" align="center">
                <label>
                  <input type="submit" name="button" value="提交">
                </label>
                &nbsp;&nbsp;&nbsp;
                <label>
                  <input type="reset" name="button2" value="重置">
                </label></td>
              </tr>
            </table>
          </form>
          
          
          
          
          </th>        
        </tr>
      </table></th>
    </tr>
  </table>
</body>
</html>
