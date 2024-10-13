
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<% 
    String[] values = request.getParameterValues("hard");
%>
<%
    String uname= (String)session.getAttribute("user");
	Connection con=null;
	try
	{
		Class.forName("oracle.jdbc.driver.OracleDriver");
		 con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","admin");
		float totalPrice=0f;
        for(String department : values) {
           // out.println("<P>"+department+"</p>");
            StringTokenizer stt = new StringTokenizer(department,"-");
            String item="";
            float price=0f;
            int c=0;
            while(stt.hasMoreTokens()){
                if(c==0)
                    item=stt.nextToken();
                else
                    price=Float.parseFloat(stt.nextToken());
                c++;
            }
			PreparedStatement pst=con.prepareStatement("insert into vcart values(?,?,?)");
			pst.setString(1,uname);
			pst.setString(2,item);
			pst.setFloat(3,price);
			pst.executeUpdate();
			totalPrice+=price;
			if(pst!=null)
			{
				%>
				<script>alert("Are you confirmed to order");</script>
				<% 
				
				
			}
        }
			con.close();
			response.sendRedirect("done.jsp?totalPrice=" +totalPrice);
		}
		catch(Exception e)
		{
%>
	<%=e%>
<%		}
%>
</body>
</html>