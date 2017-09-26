<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
 <table width="200" height="569" border="1" cellspacing="0" bordercolor="#ffffff" bgcolor="#6699CC">
 	<tr>
 	<td><div align="right" class="STYLE1">&gt;&gt;</div></td>
 	<td><div align="left"><a href="index_manager.jsp">首页</a></div></td></tr>
    <tr>
      <th width="43" scope="col"><img src="image/aaa.jpg" width="35" height="34"></th>
      <th width="153" scope="col"><div align="left">赛事赛程管理</div></th>
    </tr>
    <tr>
      <td><div align="right" class="STYLE1">&gt;&gt;</div></td>
      <td><div align="left"><a href="<%=path %>/manager_saishi.jsp">赛事管理</a></div></td>
    </tr>  
    <tr>
      <td><div align="right" class="STYLE1">&gt;&gt;</div></td>
      <td><div align="left"><a href="<%=path %>/manager_chakansaishi.jsp">查看赛事</a></div></td>
    </tr>
   
    <tr>
      <td><div align="right"><span class="STYLE1">&gt;&gt;</span></div></td>
      <td><div align="left"><a href="<%=path %>/manager_saicheng.jsp">赛程管理</a></div></td>
    </tr>
    <tr>
      <td><div align="right"><span class="STYLE1">&gt;&gt;</span></div></td>
      <td><div align="left"><a href="<%=path %>/manager_chakansaicheng.jsp">查看赛程</a></div></td>
    </tr>
    <tr>
      <th><img src="image/aaa.jpg" width="34" height="33"></th>
      <th><div align="left">各系管理</div></th>
    </tr>

    <tr>
      <td><div align="right"><span class="STYLE1">&gt;&gt;</span></div></td>
      <td><div align="left"><a href="competeInClass_manager.jsp">运动员管理</a></div></td>
    </tr>
    <tr>
      <td><div align="right"><span class="STYLE1">&gt;&gt;</span></div></td>
      <td><div align="left"><a href="scheduleInClass_manager.jsp">查询赛程安排</a></div></td>
    </tr>
    <tr>
      <td><div align="right"><span class="STYLE1">&gt;&gt;</span></div></td>
      <td><div align="left"><a href="<%=path %>/rankingForClass_manager.jsp">查询排名信息</a></div></td>
    </tr>
    
    <tr>
      <th><img src="image/aaa.jpg" width="35" height="34"></th>
      <th><div align="left">运动会组委会管理</div></th>
    </tr>
    <tr>
      <td><div align="right"><span class="STYLE1">&gt;&gt;</span></div></td>
      <td><div align="left"><a href="Checkin.jsp">检录</a></div></td>
    </tr>
    <tr>
      <td><div align="right"><span class="STYLE1">&gt;&gt;</span></div></td>
      <td><div align="left"><a href="recordsInput.jsp">成绩录入</a></div></td>
    </tr>
    <tr>
      <td><div align="right"><span class="STYLE1">&gt;&gt;</span></div></td>
      <td><div align="left"><a href="recordsForProject.jsp">成绩查看</a></div></td>
    </tr>
    <tr>
      <td><div align="right"><span class="STYLE1">&gt;&gt;</span></div></td>
      <td><div align="left"><a href="http://pe.dhu.edu.cn/">宣传</a></div></td>
    </tr>
    <tr>
      <td><div align="right"><span class="STYLE1">&gt;&gt;</span></div></td>
      <td><div align="left"><a href="login.jsp">退出</a></div></td>
    </tr>
  </table>

