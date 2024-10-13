<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>

<%
	String mail=request.getParameter("email");
	String pwd=request.getParameter("pwd");
	try
	{
		Connection con = null;
		Class.forName("oracle.jdbc.driver.OracleDriver");
		 con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","admin");
			PreparedStatement stmt = con.prepareStatement("SELECT * FROM vsignup WHERE email=? AND password=?");
			stmt.setString(1, mail);
			stmt.setString(2, pwd);
			ResultSet rs = stmt.executeQuery();
			// If a matching record is found, redirect the user to the home page
			int x=0;
			if(rs.next()) {
				x++;
				StringTokenizer st=new StringTokenizer(mail,"@");
				String mai;
				if(st.hasMoreTokens())
				{
				session.setAttribute("user",st.nextElement());
				}
					response.sendRedirect("project.html");
			} else{
					// If no matching record is found, display an error message
				//System.out.println("invalid user details");
				out.println("<p style='color:red;'><h1>Invalid username or password. Please try again.</h1></p>");
				//request.setAttribute("errorMessage","invalid user or password");
				//RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");
                //dispatcher.include(request,response);
				//response.sendRedirect("project.html");
				
			}
			rs.close();
			stmt.close();
			con.close();
	}
		catch(Exception e)
		{
			out.println(e);
	}
%>