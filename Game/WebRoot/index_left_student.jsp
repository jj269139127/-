<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
 <table width="200" height="569" border="1" cellspacing="0" bordercolor="#ffffff" bgcolor="#6699CC">
 <tr>
      <td><div align="right" class="STYLE1">&gt;&gt;</div></td>
      <th><div align="left"><a href="<%=path %>/index_student.jsp">首页</a></div></th>
    </tr>
    <tr>
      <th width="43" scope="col"><img src="image/bbb.png" width="35" height="34"></th>
      <th width="153" scope="col"><div align="left">基本信息管理</div></th>
    </tr>
    <tr>
      <td><div align="right" class="STYLE1">&gt;&gt;</div></td>
      <td><div align="left"><a href="<%=path %>/personal_information.jsp">完善个人信息</a></div></td>
    </tr>
    <tr>
      <th><img src="image/bbb.png" width="34" height="33"></th>
      <th><div align="left">报名</div></th>
    </tr>
    <tr>
      <td><div align="right"><span class="STYLE1">&gt;&gt;</span></div></td>
      <td><div align="left"><a href="<%=path %>/compete_schedule.jsp">查询赛程安排</a></div></td>
    </tr>
    <tr>
      <td><div align="right"><span class="STYLE1">&gt;&gt;</span></div></td>
      <td><div align="left"><a href="signup.jsp">填报项目</a></div></td>
    </tr>
    <tr>
      <td><div align="right"><span class="STYLE1">&gt;&gt;</span></div></td>
      <td><div align="left"><a href="<%=path %>/searchSignup.jsp">查询报名信息</a></div></td>
    </tr>
    
    <tr>
      <th><img src="image/bbb.png" width="35" height="34"></th>
      <th><div align="left">查看比赛</div></th>
    </tr>
    <tr>
      <td><div align="right"><span class="STYLE1">&gt;&gt;</span></div></td>
      <td><div align="left"><a href="<%=path %>/record.jsp">查看成绩</a></div></td>
    </tr>
    <tr>
      <td><div align="right"><span class="STYLE1">&gt;&gt;</span></div></td>
      <td><div align="left"><a href="http://pe.dhu.edu.cn/">宣传</a></div></td>
    </tr>
    <tr>
      <td><div align="right"><span class="STYLE1">&gt;&gt;</span></div></td>
      <td><div align="left"><a href="<%=path %>/login.jsp">退出</a></div></td>
    </tr>
  </table>

