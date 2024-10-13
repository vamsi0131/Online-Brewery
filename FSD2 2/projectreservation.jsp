<%@page import="java.sql.*"%>
<%
	String name=request.getParameter("name");
	String number=request.getParameter("number");
	String email=request.getParameter("email");
	String pwd=request.getParameter("pwd");
	Connection con=null;
	try
	{
		    Class.forName("oracle.jdbc.driver.OracleDriver");
		 con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","admin");
			PreparedStatement pst=con.prepareStatement("insert into vsignup values(?,?,?,?)");
			pst.setString(1,name);
			pst.setString(2,number);
			pst.setString(3,email);
			pst.setString(4,pwd);
			pst.executeUpdate();
			if(pst!=null)
			{
				out.print("<h1> one record inserted sucessfully</h1>");
				response.sendRedirect("projectlogin.html");
			}
			con.close();
		}
		catch(Exception e)
		{
%>
	<%=e%>
<%		}
%>

