<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*"%>
    
<%
String user = request.getParameter("parametro"); 
int id = Integer.parseInt(request.getParameter("video"));
int tipo = Integer.parseInt(request.getParameter("tipo"));
String comentario = request.getParameter("come"); 
String dataAtual = new java.text.SimpleDateFormat("yyyy/MM/dd").format(new java.util.Date());
String Hora = new java.text.SimpleDateFormat("HH:mm:ss").format(new java.util.Date());
//conexão à base de dados
	Class.forName("com.mysql.cj.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/vidtek", "root", "EduN1305");
		Statement stat = con.createStatement();	
			int i = stat.executeUpdate(" insert into comentario_videoadmin(username,Id_video,comentario,data,hora)  values ('" + user +"'," + id +",'" + comentario + "','" + dataAtual +"', '" + Hora + "')");

			if (i > 0) {
				response.sendRedirect("vervideo.jsp?parametro=" + user+"&video=" + id + "&tipo=" + tipo +""); 
				}
			else {
				response.sendRedirect("vervideo.jsp?parametro=" + user+"&video=" + id + "&tipo=" + tipo +""); 
			}
			
			
		
		
%>