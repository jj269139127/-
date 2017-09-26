<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="servlet.ProjectServlet" %>
<%@ page import="Model.ProjectBean" %>
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
 <script language="javascript">
function check(){
  var v=document.getElementById("Project_number").value;
  if(v==""){
    alert("人数不能为空!");
    return false;
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
	function showProjectTable(obj){
		sendRequest_("manager_Project_name.jsp?sort=" + obj+"&num="+Math.random());
	}
 //发送请求函数
	function sendRequest_(url) {
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
            
                  alert("您所请求的页面有异常1。");
            }
        }
    }
</script>
<script>
function setValue(val)
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
          
          
          
          <form name="form2" method="post" action="SaishiServlet" onsubmit="return check()">
            <table width="300">
            <tr>
                <td>性别</td>
                <td>
                	<select name="Project_sex">
                	<option value="0">---请选择---</option>
                	<option value="1">女</option>
                	<option value="2">男</option>
                	</select>                  
                </td>
              </tr>             
            <tr>
                <td>类型</td>
                <td>
                <select name="Project_category" onchange="showProjectTable(this.options[this.options.selectedIndex].value)">
                	<option value="3">---请选择---</option>
                	<option value="0">田赛</option>
                	<option value="1">径赛</option></select></td>
            </tr>
              <tr>
                <td>名称</td>
                <td>
                <div id="plistDiv">
                	<select name="text" onchange="showIdTable1(this.options[this.options.selectedIndex].value)">
		          <option value="0">---请选择---</option>
		          </select>  </div>      
                </td>
              </tr><tr><td>编号</td> <td><input type="text" name="Project_name" id="text" size="20" value="等待查询" readonly="readonly"></tr>				
              <tr>
              	<td>人数</td>
              	<td>
              		<input type="text" size="20" maxlength="20" name="Project_number">
              	</td>
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
