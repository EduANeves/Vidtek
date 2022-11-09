<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*"%>
    
<%
String user = request.getParameter("parametro"); 
int vid_id =Integer.parseInt( request.getParameter("video")); 
int at =Integer.parseInt( request.getParameter("ativo")); 
int genero = Integer.parseInt(request.getParameter("genero")); 
String string1 = "adicionar_generodb.jsp?parametro=" + user + "&video=" + vid_id + "&ativo=" + at + "";

int a=0;
int id=0;
//conexão à base de dados
	Class.forName("com.mysql.cj.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/vidtek", "root", "EduN1305");
		Statement stat = con.createStatement();
		if(at == 1){
		ResultSet rset;
		rset = stat.executeQuery("select * from videopessoal_genero where id_genero =" + genero +" and id_videopessoal = " + vid_id + "");
		if(rset.next()) {
			%><script type="text/javascript">
			alert("O género já foi inserido");
		
			</script><%
			response.sendRedirect(string1);
		} 
		else 
		{
			
			int i = stat.executeUpdate(" insert into videopessoal_genero(id_genero,id_videopessoal) values (" + genero + "," + vid_id + ")");

			if (i > 0) {
				ResultSet rs;
				response.sendRedirect("adicionar_genero.jsp?parametro=" + user +"&video=" + vid_id + "&ativo=" + at + ""); }
			
			
		}
		}else if (at == 2){
			ResultSet rset;
			rset = stat.executeQuery("select * from videoadmin_genero where id_genero =" + genero +" and id_video = " + vid_id + "");
			if(rset.next()) {
				%><script type="text/javascript">
				alert("O género já foi inserido");
			
				</script><%
				response.sendRedirect(string1);
			} 
			else 
			{
				
				int i = stat.executeUpdate(" insert into videoadmin_genero(id_genero,id_video) values (" + genero + "," + vid_id + ")");

				if (i > 0) {
					ResultSet rs;
					response.sendRedirect("adicionar_genero.jsp?parametro=" + user +"&video=" + vid_id + "&ativo=" + at + ""); }
				
				
			}
		}
%>