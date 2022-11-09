<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>

<%@ page import="java.sql.*"%>

<%
String user = request.getParameter("user");

int a=0;
//conexão à base de dados
	Class.forName("com.mysql.cj.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/vidtek", "root", "EduN1305");
		Statement stat = con.createStatement();
		int i;
		i = stat.executeUpdate("update utilizador set ativo=1 where username='" + user + "'");

if (i > 0) {
	response.sendRedirect("login.jsp"); 
	} 
    else {
	response.sendRedirect("index.jsp");
}
%>
