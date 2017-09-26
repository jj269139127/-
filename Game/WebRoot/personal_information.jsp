<%@ page language="java" import="java.util.*,java.sql.*" pageEncoding="UTF-8"%>
<%@page import="Info.*"%>
<%@page import="util.DbConn"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'personal_information.jsp' starting page</title>
    
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
	.STYLE1 {font-size: 10px;color: #008000}
	.STYLE2 {
		color: #008000;
		font-size: 25px;
	}
	-->
    </style>

  </head>
  
  <body>
  <script language="javascript">
function check(){
  var v=document.getElementById("depart").value;
  var Object=document.getElementsByName("sex");
	if(Object[0].checked==false && Object[1].checked==false)
	{
	alert("性别不能为空!");
	    return false;
	    }
  if(v==""){
    alert("班级不能为空!");
    return false;
  }
}
var XMLHttpReq;
    var currentSort;
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
        XMLHttpReq.open("POST", url, true);
        XMLHttpReq.onreadystatechange = processResponse;//指定响应函数
        XMLHttpReq.send(null);  // 发送请求
    }
    // 处理返回信息函数
    function processResponse() {
        if (XMLHttpReq.readyState == 4) { // 判断对象状态
            if (XMLHttpReq.status == 200) { // 信息已经成功返回，开始处理信息
                updateMenu();
            } else { //页面不正常
                  alert("您所请求的页面有异常。");
            }
        }
    }
    //更新菜单函数
    function updateMenu() {
        var res=XMLHttpReq.responseXML.getElementsByTagName("res");  
        var list = document.all.depart;
        list.options.length=0;
        list.add(new Option("---请选择---",""));
        for(var i=0;i<res.length;i++){
            list.add(new Option(res[i].firstChild.data,res[i].firstChild.data));
        }
    }
    // 创建级联菜单函数
    function showSubMenu(obj) {
        sendRequest("MyJsp.jsp?sort=SELECT Class_department FROM class where class_name='" + obj+"'");
    }

</script>
  <table width="800" align="center" cellspacing="0">
    <tr>
      <th scope="col">
      <table width="800" border="1" cellspacing="0" bordercolor="#999999">
        <tr>
          <th height="150" colspan="2" scope="col"><img src="image/henfu.jpg" width="800" height="176"></th>
        </tr>
        <tr>
          <th height="40" colspan="2" scope="col"><jsp:include page="index_center.jsp"/></th>
        </tr>
        <tr>
          <th width="200" scope="col"><jsp:include page="index_left_student.jsp"/></th>
          <th width="600" height="550" scope="col" valign="top"  bgcolor="#E3E3E3">
          <p>&nbsp;</p>
          <p>&nbsp;</p>
         
          <form name="form1" method="post" action="PerfectInformation" onsubmit="return check()">
          <jsp:useBean id="clast" class="util.DbConn" scope="page"></jsp:useBean>
          <%
          String sql2="select student_name,Student_sex,student_introduction from student where student_number="+session.getAttribute("username");
           ResultSet r=clast.select(sql2);
           r.next();
           %>
          <table border="3" bordercolor="#123456" cellpadding="2" cellspacing="3" align ="center" width="380">
          <caption><span class="STYLE2"><B>修改完善个人信息</B></span></caption>
          <tr><td>学号：</td><td><input type="text" name ="studentnumber" value="<%=session.getAttribute("username") %>" readonly="readonly"></td>
          <td><span class="STYLE1">（不能修改）</span></td></tr>
          <%
          String Nn=r.getString(1);
          if("null".equals(Nn) || Nn==null || "".equals(Nn)) 
          	Nn=""; 
          %>
          <tr><td>姓名：</td><td colspan=2><input type="text" name ="studentname" value="<%=Nn %>"></td></tr>
          <tr><td>性别：</td>
          <td colspan=2>
          <% if("f".equals(r.getString(2)))
          {
          out.println("<input type=\"radio\" name=\"sex\" value=\"f\" checked>女&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
          out.println("<input type=\"radio\" name=\"sex\" value=\"m\">男</td></tr>");
          }
          else if("m".equals(r.getString(2)))
          {
          out.println("<input type=\"radio\" name=\"sex\" value=\"f\">女&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
          out.println("<input type=\"radio\" name=\"sex\" value=\"m\" checked>男</td></tr>");
          }
          else
          {
          out.println("<input type=\"radio\" name=\"sex\" value=\"f\">女&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
          out.println("<input type=\"radio\" name=\"sex\" value=\"m\">男</td></tr>");
          }
          %>
          
                         <tr><td>系别：</td><td colspan=2>
                         <select name="xueyuan" onchange="showSubMenu(this.options[this.options.selectedIndex].value)">
                         <%
							DbConn dc = new DbConn();
							ResultSet rs = dc.select("select class_name,class_department from class where class_id = (select class_id from student where student_number="+session.getAttribute("username")+")");
							//System.out.println(rs.next());
							String class_name="null";
							String class_department="null";
							if(rs.next()){
							class_name=rs.getString(1);
							class_department=rs.getString(2);
							if(!"null".equals(class_name)){
							out.println("<option value=\""+class_name+"\">"+class_name+"</option>");}
							}
						%>
                         <option value="0">---请选择---</option>
                        <%
                        String sql="select distinct Class_name from class";
                        ArrayList Class1=(ArrayList)clast.classname(sql);
                        Iterator cl=Class1.iterator();
						while(cl.hasNext()){
  						ClassList ie=(ClassList)cl.next();
  						if(ie.getClass_name().equals(class_name))
  						continue;
                        %>
        				 <option value="<%= ie.getClass_name() %>"><%= ie.getClass_name() %></option>
        				 
			          <% 
			          }
			          %></select></td></tr>
			          <tr><td>班级：</td><td colspan=2>
			          
			          <select name="depart" >
			          <% 
			          if(!class_department.equals("null")){
							out.println("<option value=\""+class_department+"\">"+class_department+"</option>");
							}
							%>
    				  <option value="">---请选择---</option>
			          
    					</select>
			          </td></tr>
			          
          <tr><td>简介</td><td colspan=2><textarea name="introduction" rows="6" cols="30"></textarea></td></tr>
          <tr><td></td>
          <td><input type="submit" value="提交"></td>
          <td><input type="reset" value="重置"></td></tr>
          </table>
          </form></th></tr>
          
      </table></th>
    </tr>
  </table>
</body>
</html>
