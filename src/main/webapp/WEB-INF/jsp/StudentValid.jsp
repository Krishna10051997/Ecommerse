
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<% 
	String email = request.getParameter("email");
	String pass = request.getParameter("pass");
	
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/election_admin","root","sept22");
	PreparedStatement s = con.prepareStatement("select * from user where email=? and pass=?");
	s.setString(1, email);
	s.setString(2, pass);
	ResultSet rs = s.executeQuery();
	
	boolean flag = false;
	if(rs.next()){
		flag = true;
	}
	s.close();
	con.close();
	if(flag){
		response.sendRedirect("VotingMainPage.jsp");
	}
	else{
		response.sendRedirect("StudentLogin.jsp?msg=Invalid credentials!");
	}

%>