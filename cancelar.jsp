<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*"%>
    
<%
String user = request.getParameter("parametro");
int id = Integer.parseInt(request.getParameter("video"));
int at = Integer.parseInt(request.getParameter("ativo"));
//conexão à base de dados
	Class.forName("com.mysql.cj.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/vidtek", "root", "EduN1305");
		Statement stat = con.createStatement();
		if(at==1)
		{
		int u = stat.executeUpdate("delete from videopessoal_genero where id_videopessoal="+ id +"");
		if (u > 0) {
			
			int i = stat.executeUpdate("delete from videopessoal_interveniente where id_videopessoal="+ id +"");
			if (i > 0) {
				
				int t = stat.executeUpdate("delete from videopessoal where id_videopessoal="+ id +"");
			if (t > 0) {
			
				response.sendRedirect("adicionar_video.jsp?parametro=" + user +"&ativo=" + at + "");
				}

			}
		}
		else{
			
			int i = stat.executeUpdate("delete from videopessoal_interveniente where id_videopessoal="+ id +"");
			if (i > 0) {
				
				int t = stat.executeUpdate("delete from videopessoal where id_videopessoal="+ id +"");
			if (t > 0) {
			
				response.sendRedirect("adicionar_video.jsp?parametro=" + user +"&ativo=" + at + "");
				}

			}
			else
			{
				int t = stat.executeUpdate("delete from videopessoal where id_videopessoal="+ id +"");
				if (t > 0) {
				
					response.sendRedirect("adicionar_video.jsp?parametro=" + user +"&ativo=" + at + "");
					}
			}
		}
		}
		else if(at==2)
		{
			int u = stat.executeUpdate("delete from videoadmin_genero where id_video="+ id +"");
			if (u > 0) {
				
				int i = stat.executeUpdate("delete from videoadmin_interveniente where id_video="+ id +"");
				if (i > 0) {
					
					int t = stat.executeUpdate("delete from videoadmin where id_video="+ id +"");
				if (t > 0) {
				
					response.sendRedirect("adicionar_video.jsp?parametro=" + user +"&ativo=" + at + "");
					}

				}
			}
			else{
				
				int i = stat.executeUpdate("delete from videoadmin_interveniente where id_video="+ id +"");
				if (i > 0) {
					
					int t = stat.executeUpdate("delete from videoadmin where id_video="+ id +"");
				if (t > 0) {
				
					response.sendRedirect("adicionar_video.jsp?parametro=" + user +"&ativo=" + at + "");
					}

				}
				else
				{
					int t = stat.executeUpdate("delete from videoadmin where id_video="+ id +"");
					if (t > 0) {
					
						response.sendRedirect("adicionar_video.jsp?parametro=" + user +"&ativo=" + at + "");
						}
				}
			}
		}
%>