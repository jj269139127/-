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
            document.getElementById("rankingDiv").innerHTML = result;     
        } else { //页面不正常
            window.alert("您所请求的页面有异常。");
        }
    }
}
function showRankingTable(obj){
	sendRequest("rankingTable_manager.jsp?sort=" + obj+"&num="+Math.random());
}
</script>
<script type="text/javascript"> 
    function getRankingForClass(){
    	window.location.reload(true);
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
	          	<td width="300" align="right"><input type="button" value="查看学院总分排名" onclick="getRankingForClass()"/></td>
	          	<td width="300" align="left">
		          <select name="recordInClass" onchange="showRankingTable(this.options[this.options.selectedIndex].value)">
		          <option >---请选择---</option>
		          <%
		          ClassServlet classServlet = new ClassServlet();
		          ArrayList classlist = classServlet.getClassArray();
		          Iterator cit = classlist.iterator();
		          while(cit.hasNext()){
		          ClassBean cb = (ClassBean)cit.next();
		          out.println("<option value="+cb.getClass_name()+">"+cb.getClass_name()+"</option>)");
		          }%>
		          </select></td>
		          </tr>         		          
		          <tr><td colspan="2">
		          <br>
		          <div id="rankingDiv" align="center" style="height:480px;overflow-y:auto;">			
					
					<table border="5"  class="studenttable" id="rankingTable" bgcolor="#ffffff">
    				<tr align="center"><td>名称</td><td>人数</td><td>得分</td><td>排名</td></tr>	
    				<%
    				RecordsServlet rservlet = new RecordsServlet();
    				rservlet.calculateTheScore();
    				ResultSet rs = rservlet.getRankingForClass();
    				int i=0;
    				while(rs.next()){
    					int num = rservlet.getCnumForClassByCname(rs.getString(1));
    					out.print("<tr align=\"center\"><td>"+rs.getString(1)+"</td><td>"+num+"</td><td>"+rs.getInt(2)+"</td><td>"+(++i)+"</td></tr>");
    				}
    				 %>
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
