<%@ page contentType="text/html; charset=UTF-8" import="java.util.*,java.sql.*" %>
<%@ page import="util.*"%>
<%
    String sort=new String(request.getParameter("sort").getBytes("ISO-8859-1"),"GB2312");
    List cities = new ArrayList();

    DbConn dc=new DbConn();
       ResultSet rs=dc.select(sort);
        while (rs.next())
        {
            cities.add(rs.getString(1));
        } 
    response.setContentType("text/xml; charset=UTF-8");
    response.setHeader("Cache-Control", "no-cache");
    out.println("<response>");
    for(int i=0;i<cities.size();i++)
    {
        out.println("<res>" + cities.get(i).toString() + "</res>");
    }
    out.println("</response>");
    //out.close();
%>