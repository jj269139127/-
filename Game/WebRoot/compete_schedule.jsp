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
 <script language="javascript">
var XMLHttpReq;
    var currentSort;  
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
        XMLHttpReq.open("POST", url, true);
        XMLHttpReq.onreadystatechange = processResponse;//指定响应函数
        XMLHttpReq.send(null);  // 发送请求
    }
    // 处理返回信息函数
    function processResponse() {
        if (XMLHttpReq.readyState == 4) { // 判断对象状态
            if (XMLHttpReq.status == 200) { // 信息已经成功返回，开始处理信息
                var result=XMLHttpReq.responseText;
                document.getElementById("com_sch").innerHTML=result;
            } else { //页面不正常
                  alert("还没有可以参加的赛事，请耐心等待。");
            }
        }
    }
    // 创建级联菜单函数
    function showSubMenu(obj) {
        sendRequest("scheduleTable.jsp?sort=" + obj);
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
          <th width="200" scope="col"><jsp:include page="index_left_student.jsp"/></th>
          <th width="600" height="550" scope="col" valign="top" bgcolor="#e3e3e3"><p>&nbsp;</p>
          <p>&nbsp;</p>
          比赛类型:
          <select name="sche" onchange="showSubMenu(this.options[this.options.selectedIndex].value)">
          <option value="">---请选择 ---</option>
          <option value="0">---田赛---</option>
          <option value="1">---径赛---</option>
          </select><p/>
           <div id="com_sch" style="height:450px;overflow-y:auto;">
           </div>
          
          
          
          
          
          
         </th> 
        </tr>
      </table></th>
    </tr>
  </table>
</body>
</html>
