<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*"%>
    
<%String user = request.getParameter("parametro");
    int id = Integer.parseInt(request.getParameter("video"));
    int id_p = Integer.parseInt(request.getParameter("id_p"));
    String username = request.getParameter("username");
    //conexão à base de dados
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/vidtek", "root", "EduN1305");
    Statement stat = con.createStatement();
	int t = stat.executeUpdate("delete from partilha_utilizador where id_partilha=" + id_p + " and username='" + username + "'");
	if (t > 0) {
		int a = stat.executeUpdate("delete from partilha where id_partilha=" + id_p + " and id_videopessoal='" + id + "'");
		if (a > 0) {

			response.sendRedirect("principal.jsp?parametro=" + user + "");
		}
		else
		{
			response.sendRedirect("principal.jsp?parametro=" + user + "");
		}
	}
	else{
		int a = stat.executeUpdate("delete from partilha where id_partilha=" + id_p + " and id_videopessoal='" + id + "'");
		if (a > 0) {

			response.sendRedirect("principal.jsp?parametro=" + user + "");
		}
		else
		{
			response.sendRedirect("principal.jsp?parametro=" + user + "");
		}
	}
    %>