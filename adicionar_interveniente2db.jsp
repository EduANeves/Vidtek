<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*"%>
    
<%
 String user = request.getParameter("parametro"); 
int vid_id =Integer.parseInt( request.getParameter("video")); 
int inter = Integer.parseInt(request.getParameter("inter")); 
int tipo = Integer.parseInt(request.getParameter("tipo")); 
String string1 = "adicionar_intervenientedb.jsp?parametro=" + user + "&video=" + vid_id +  "&tipo=" + tipo + "";

int a=0;
int id=0;
//conexão à base de dados
	Class.forName("com.mysql.cj.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/vidtek", "root", "EduN1305");
		Statement stat = con.createStatement();
		if(tipo==1)
		{
		ResultSet rset;
		rset = stat.executeQuery("select * from videopessoal_interveniente where id_interveniente =" + inter +" and id_videopessoal = " + vid_id + "");
		if(rset.next()) {
			%><script type="text/javascript">
			alert("O interveniente já foi inserido");
			window.location=string1;
			</script><%
			response.sendRedirect(string1);
		} 
		else 
		{
			
			int i = stat.executeUpdate(" insert into videopessoal_interveniente(id_interveniente,id_videopessoal) values (" + inter + "," + vid_id + ")");

			if (i > 0) {
				ResultSet rs;
				response.sendRedirect("adicionar_interveniente2.jsp?parametro=" + user +"&video=" + vid_id  + "&tipo=" + tipo + ""); }
			
			
		}
		}
		else if(tipo==2)
		{
			ResultSet rset;
			rset = stat.executeQuery("select * from videoadmin_interveniente where id_interveniente =" + inter +" and id_video = " + vid_id + "");
			if(rset.next()) {
				%><script type="text/javascript">
				alert("O interveniente já foi inserido");
				window.location=string1;
				</script><%
				response.sendRedirect(string1);
			} 
			else 
			{
				
				int i = stat.executeUpdate(" insert into videoadmin_interveniente(id_interveniente,id_video) values (" + inter + "," + vid_id + ")");

				if (i > 0) {
					ResultSet rs;
					response.sendRedirect("adicionar_interveniente2.jsp?parametro=" + user +"&video=" + vid_id  + "&tipo=" + tipo + ""); }
				
				
			}
		}
%>