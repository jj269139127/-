<%@ page language="java" import="java.util.*,java.sql.*" pageEncoding="utf-8"%>
<%@ page import="util.*"%>
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
<%
	request.setCharacterEncoding("utf-8");
	response.setCharacterEncoding("utf-8");
	DbConn dc = new DbConn();
	ResultSet rs = dc.select("select student_sex,class_id from student where student_number="+session.getAttribute("username"));
	rs.next();
	String sex=rs.getString(1);
	if(sex==null || "".equals(sex)){
	response.sendRedirect("index_student.jsp?su=sex");
	}
	
	%>
function check()
{
	if(form1.depart.value==form1.depart2.value || form1.depart.value==form1.depart3.value || form1.depart2.value==form1.depart3.value)
	{alert("不能选报同一项目！");return false;}
	if(form1.depart.value=="g1" && form1.depart2.value=="g2" && form1.depart3.value=="g3")
	{alert("至少选报一个项目！");return false;}
	if(window.confirm("确定要报名吗？\n报名后不能修改"))return true;
	else return false;
	
}
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
    function sendRequest(url) {
        createXMLHttpRequest();
        XMLHttpReq.open("POST", url, true);
        XMLHttpReq.onreadystatechange = processResponse;
        XMLHttpReq.send(null);
    }
    function processResponse() {
        if (XMLHttpReq.readyState == 4) {
            if (XMLHttpReq.status == 200) {
                updateMenu();
            } else {
                  alert("您所请求的页面有异常。");
            }
        }
    }
    function updateMenu() {
        var res=XMLHttpReq.responseXML.getElementsByTagName("res");  
        var list = document.all.depart;
        list.options.length=0;
        list.add(new Option("---请选择---","g1"));
        for(var i=0;i<res.length;i++){
            list.add(new Option(res[i].firstChild.data,res[i].firstChild.data));
        }
    }
    function showSubMenu(obj) {
   sendRequest("MyJsp.jsp?sort=SELECT Project_name FROM project where Project_category='" + obj+"' and project_sex = (select student_sex from student where student_number="+<%=session.getAttribute("username")%>+")");
    }
      function sendRequest2(url) {
        createXMLHttpRequest();
        XMLHttpReq.open("POST", url, true);
        XMLHttpReq.onreadystatechange = processResponse2;
        XMLHttpReq.send(null);
    }
    function processResponse2() {
        if (XMLHttpReq.readyState == 4) {
            if (XMLHttpReq.status == 200) {
                updateMenu2();
            } else {
                  alert("您所请求的页面有异常。");
            }
        }
    }
    function updateMenu2() {
        var res=XMLHttpReq.responseXML.getElementsByTagName("res");  
        var list = document.all.depart2;
        list.options.length=0;
        list.add(new Option("---请选择---","g2"));
        for(var i=0;i<res.length;i++){
            list.add(new Option(res[i].firstChild.data,res[i].firstChild.data));
        }
    }
    function showSubMenu2(obj) {
   sendRequest2("MyJsp.jsp?sort=SELECT Project_name FROM project where Project_category='" + obj+"' and project_sex = (select student_sex from student where student_number="+<%=session.getAttribute("username")%>+")");
    }
      function sendRequest3(url) {
        createXMLHttpRequest();
        XMLHttpReq.open("POST", url, true);
        XMLHttpReq.onreadystatechange = processResponse3;
        XMLHttpReq.send(null);
    }
    function processResponse3() {
        if (XMLHttpReq.readyState == 4) {
            if (XMLHttpReq.status == 200) {
                updateMenu3();
            } else {
                  alert("您所请求的页面有异常。");
            }
        }
    }
    function updateMenu3() {
        var res=XMLHttpReq.responseXML.getElementsByTagName("res");  
        var list = document.all.depart3;
        list.options.length=0;
        list.add(new Option("---请选择---","g3"));
        for(var i=0;i<res.length;i++){
            list.add(new Option(res[i].firstChild.data,res[i].firstChild.data));
        }
    }
    function showSubMenu3(obj) {
   sendRequest3("MyJsp.jsp?sort=SELECT Project_name FROM project where Project_category='" + obj+"' and project_sex = (select student_sex from student where student_number="+<%=session.getAttribute("username")%>+")");
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
          
        <th  background="image/c1.jpg" width="600" height="550" scope="col" valign="middle">
        <table>
       
        </table>
        <form name="form1" method="post" action="SignUp" onsubmit="return check()">
        <table bgcolor="#7e98ed" width="600">
        <tr><td>
        <table border="2" bgcolor="#e3e3e3" cellpadding="2" cellspacing="3" align ="center" width="380"> 
        <tr><td rowspan=2>项目一</td><td>运动类型：</td>
        <td width="180">
        	<select name="gametype" onchange="showSubMenu(this.options[this.options.selectedIndex].value)">
        	<option value="">---请选择---</option>
       		<option value="0">田赛</option><option value="1">径赛</option>
       		</select></td></tr>
       		<tr><td>比赛项目：</td>
       		<td><select name="depart" >
    			<option value="g1">---请选择---</option>
    			</select></td></tr>
    			
    			<tr><td rowspan=2>项目二</td><td>运动类型：</td><td>
        	<select name="gametype2" onchange="showSubMenu2(this.options[this.options.selectedIndex].value)">
        	<option value="">---请选择---</option>
       		<option value="0">田赛</option><option value="1">径赛</option>
       		</select></td></tr>
       		<tr><td>比赛项目：</td>
       		<td><select name="depart2" >
    			<option value="g2">---请选择---</option>
    			</select></td></tr>
    			
    			<tr><td rowspan=2>项目三</td><td>运动类型：</td><td>
        	<select name="gametype3" onchange="showSubMenu3(this.options[this.options.selectedIndex].value)">
        	<option value="">---请选择---</option>
       		<option value="0">田赛</option><option value="1">径赛</option>
       		</select></td></tr>
       		<tr><td>比赛项目：</td>
       		<td><select name="depart3" >
    			<option value="g3">---请选择---</option>
    			</select></td></tr>
    			<tr><td></td><td><input type="submit" value="确定报名"></input></td>
    			<td><input type="reset" value="重置"/></td></tr>
       		</table></td></tr></table>
    					
        </form>
        </th>
          
          
          
          
          
          
          
          
          
          
        </tr>
      </table></th>
    </tr>
  </table>
</body>
</html>
