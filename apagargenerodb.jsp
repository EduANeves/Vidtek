<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*"%>
    
<%
String user = request.getParameter("parametro");
int id = Integer.parseInt(request.getParameter("video"));
int id_g = Integer.parseInt(request.getParameter("genero"));
int tipo = Integer.parseInt(request.getParameter("tipo"));
//conexão à base de dados
	Class.forName("com.mysql.cj.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/vidtek", "root", "EduN1305");
		Statement stat = con.createStatement();
		if(tipo == 1)
		{
		int u = stat.executeUpdate("delete from videopessoal_genero where id_videopessoal="+ id +" and id_genero=" + id_g + "");
		if (u > 0) {
				response.sendRedirect("alterarvideo.jsp?parametro=" + user +"&video=" + id +"&tipo=1"); 
				

			
		}
		else{	
					response.sendRedirect("alterarvideo.jsp?parametro=" + user +"&video=" + id +"&tipo=1"); 

			
		}
		}
		else if(tipo==2)
		{
			int u = stat.executeUpdate("delete from videoadmin_genero where id_video="+ id +" and id_genero=" + id_g + "");
			if (u > 0) {
					response.sendRedirect("alterarvideo.jsp?parametro=" + user +"&video=" + id +"&tipo=2"); 
					

				
			}
			else{	
						response.sendRedirect("alterarvideo.jsp?parametro=" + user +"&video=" + id +"&tipo=2"); 

				
			}
		}
%>