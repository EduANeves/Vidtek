<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*"%>
    
<%
String user = request.getParameter("parametro"); 
int tipo = Integer.parseInt(request.getParameter("tipo"));
int id = Integer.parseInt(request.getParameter("video"));
String usern = request.getParameter("usern"); 
String dataAtual = new java.text.SimpleDateFormat("yyyy/MM/dd").format(new java.util.Date());
String Hora = new java.text.SimpleDateFormat("HH:mm:ss").format(new java.util.Date());
String loc = "partilha.jsp?parametro=" + user + "&video=" + id + "&tipo=" + tipo + "";
//conexão à base de dados
	Class.forName("com.mysql.cj.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/vidtek", "root", "EduN1305");
		Statement stat = con.createStatement();

		ResultSet rset;
		rset = stat.executeQuery("select * from utilizador where username ='" + usern + "'");
		if(rset.next()) {
			ResultSet rs1;
			rs1= stat.executeQuery("select * from partilha where  id_videopessoal ='" + id + "'");
			if(rs1.next()) {
				int id_p = rs1.getInt(1);
				int u = stat.executeUpdate(" insert into partilha_utilizador(username,id_partilha,data,hora) values ('" + usern +"'," + id_p + ",'" + dataAtual + "','" + Hora + "')");
				if (u > 0) {
					
				response.sendRedirect("partilha.jsp?parametro=" + user +"&video=" + id + "&tipo=" + tipo + ""); 
				}
			}
			else{
			int i = stat.executeUpdate(" insert into partilha(id_videopessoal) values (" + id +")");

			if (i > 0) {
				ResultSet rs2;
				rs2 = stat.executeQuery("select * from partilha where id_videopessoal ='" + id + "'");
				if(rs2.next()) {
					int id_p = rs2.getInt(1);
				int u = stat.executeUpdate(" insert into partilha_utilizador(username,id_partilha,data,hora) values ('" + usern +"'," + id_p + ",'" + dataAtual + "','" + Hora + "')");
				if (u > 0) {
					
				response.sendRedirect("partilha.jsp?parametro=" + user +"&video=" + id + "&tipo=" + tipo + ""); 
				}
				}
			}
			}
		}
		
		else 
		{

			%>
		<script type="text/javascript">
					alert("O nome do video já foi utilizado!");
					window.location=<%= loc%>;<% 	out.println("fuick");%>
			</script>
			<%
			response.sendRedirect(loc);
			
		}

	
	
%>