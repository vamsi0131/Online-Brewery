<%@page import="java.sql.*"%>
<%
	String name=request.getParameter("name");
	String email=request.getParameter("email");
	String note=request.getParameter("note");
	Connection con=null;
	try
	{
		Class.forName("oracle.jdbc.driver.OracleDriver");
		 con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","admin");
			PreparedStatement pst=con.prepareStatement("insert into contactus values(?,?,?)");
			pst.setString(1,name);
			pst.setString(2,email);
			pst.setString(3,note);
			pst.executeUpdate();
			if(pst!=null)
			{
				out.print("<h1>Records recieved sucessfully</h1>");
				response.sendRedirect("index.html");
			}
			con.close();
		}
		catch(Exception e)
		{
%>
	<%=e%>
<%		}
%>
