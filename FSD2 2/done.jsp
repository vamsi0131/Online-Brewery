<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Order Details</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #000000;
            margin: 0;
            padding: 20px;
        }

        .container {
            max-width: 600px;
            margin: 0 auto;
            background-color: #ffffff;
            padding: 20px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        h2 {
            color: #333;
            text-align: center;
        }

        section {
            margin-bottom: 20px;
        }

        p {
            margin: 10px 0;
        }

        h3 {
            color: #777;
            text-align: center;
        }

        .total-price {
            text-align: center;
            font-size: 20px;
            margin-top: 40px;
            color: #555;
        }
        body {
            font-family: Arial, sans-serif;
            background-color: #f5f5f5;
            margin: 0;
            padding: 20px;
        }

        .container1{
            max-width: 600px;
            margin: 0 auto;
            background-color: #ffffff;
            padding: 20px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        h2 {
            color: #333;
            text-align: center;
        }

        .payment-options {
            display: flex;
            justify-content: space-between;
            margin-top: 30px;
        }

        .payment-option {
            flex-basis: calc(33.33% - 10px);
            background-color: #f2f2f2;
            padding: 20px;
            text-align: center;
            border-radius: 4px;
        }

        .payment-option:hover {
            background-color: #eaeaea;
            cursor: pointer;
        }

        .payment-option img {
            max-width: 100px;
            height: auto;
            margin-bottom: 10px;
        }

        .payment-option p {
            font-size: 14px;
            color: #666;
        }
        .box1
{ 
  color: balck;
  position: absolute;
  right: 90px;
  top: 10px;
  text-decoration: none;
}
.box1 ul li
{
	text-align:left;
	font-size:25px;
	font-weight: bold;
	font-family: serif;
}
.box1 ul li a
{
	text-decoration: none;
	color: black;
}
.box1 ul li:hover
{
	background-color:transparent;
}
.box1 ul li a:hover
{
  color: darkred;
}
    </style>
</head>
<body>
    <div class="box1">
		<ul type="none">
			<li><a href="project.html">Home</a></li>
		</ul>
	</div>
    <div class="container">
        <section>
            <h2>Order Details</h2>
        </section>

        <%-- Retrieve the stored data from the database --%>
        <%
            float totalPrice = Float.parseFloat(request.getParameter("totalPrice"));

            Connection con = null;
            try {
                Class.forName("oracle.jdbc.driver.OracleDriver");
		 con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","admin");
                PreparedStatement pst = con.prepareStatement("SELECT * FROM vcart WHERE uname = ?");
                pst.setString(1, (String) session.getAttribute("user"));
                ResultSet rs = pst.executeQuery();
               
                while (rs.next()) {
                    String item = rs.getString("item");
                    float price = rs.getFloat("price");
                   
                    // Display the stored data
                    out.println("<p>" + item + " - &#8377;" + price + "</p>");
                }
               
                con.close();
            } catch (Exception e) {
                out.println(e);
            }
        %>

        <section class="total-price">
            <h3>Total Price: &#8377;<%= totalPrice %></h3>
        </section>
        <body>
            <div class="container1">
                <h2>Payment Options</h2>
                <div class="payment-options">
                    <div class="payment-option">
                        <img src="creditcard.png" alt="Credit Card">
                        <p>Credit Card</p>
                    </div>
                    <div class="payment-option">
                        <img src="phonepe.png" alt="Phonepe">
                        <p>Phonepe</p>
                    </div>
                    <div class="payment-option">
                        <img src="cash.png" alt="COD">
                        <p>Cash on delivery</p>
                    </div>
                </div>
            </div>
        </body>
        
    </div>
</body>
</html>
