<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ page  import="java.sql.*"%> 
<%
String user = request.getParameter("username");
String pass = request.getParameter("password");


//conexão à base de dados
	Class.forName("com.mysql.cj.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/vidtek", "root", "EduN1305");
		Statement stat = con.createStatement();
		ResultSet rset;
		
		//verificar o utilizador
		rset = stat.executeQuery("select * from utilizador where username ='" + user + "' and password ='" + pass + "' and ativo =1");
		
		if(rset.next()) {
			response.sendRedirect("principal.jsp?parametro=" + user);
		} else {
			rset.close();
			ResultSet rs;
			rs = stat.executeQuery("select * from utilizador where username ='" + user + "' and password ='" + pass + "' and ativo =2");
			if (rs.next()){
				response.sendRedirect("principaladmin.jsp?parametro=" + user);
			} else {
				response.sendRedirect("login.jsp");
			}
		}
		
%>