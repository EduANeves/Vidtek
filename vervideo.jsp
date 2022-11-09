<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
       <%@ page import="java.util.Random"%>
<!DOCTYPE html>
<%@ page import="java.sql.*"%>
<html>
<head>
<meta http-equiv=”Content-Type” content=”text/html; charset=utf-8″>

<link rel="STYLESHEET" type="text/css" href="main.css">
<link rel="STYLESHEET" type="text/css" href="csstab.css">
<title>VidTek | Your personal video library </title> <script type="text/javascript">
function openPage(pageName, elmnt, color) {
	// Hide all elements with class="tabcontent" by default */
	var i, tabcontent, tablinks;
	  tabcontent = document.getElementsByClassName("tabcontent");
	 for (i = 0; i < tabcontent.length; i++) {
	 tabcontent[i].style.display = "none";
	  }

	 // Remove the background color of all tablinks/buttons
	 tablinks = document.getElementsByClassName("tablink");
	 for (i = 0; i < tablinks.length; i++) {
	 tablinks[i].style.backgroundColor = "";
	  }

	 // Show the specific tab content
	  document.getElementById(pageName).style.display = "block";

	 // Add the specific color to the button used to open the tab content
	  elmnt.style.backgroundColor = color;
	}

	// Get the element with id="defaultOpen" and click on it
	document.getElementById("defaultOpen").click();
</script>
<style>
body {
     width: 100%;
  height: 10%;
  margin: 0;
  padding: 0;
    background:  #191828;
}
th, td {
	text-align: left;
}

.div2021 {
	width: 100%;
	height: 100%;
}

.table2 {
	width: 60%;
	height: 10%;
	  margin-left: 32%;

	  justify-content: center;

}

.tr1 {
	widht:100%;
	height: 10%;
}

.tr2 {
	width: 100%;
	height: 40%;
	text-align:left;
}
font{
text-align:left;}
.linha {
	width: 33%;
	height: 100%;
}
#displayed {
    display: flex;
 justify-content: left; }
</style>
<script>
function openPage(pageName, elmnt, color) {
	// Hide all elements with class="tabcontent" by default */
	var i, tabcontent, tablinks;
	  tabcontent = document.getElementsByClassName("tabcontent");
	 for (i = 0; i < tabcontent.length; i++) {
	 tabcontent[i].style.display = "none";
	  }

	 // Remove the background color of all tablinks/buttons
	 tablinks = document.getElementsByClassName("tablink");
	 for (i = 0; i < tablinks.length; i++) {
	 tablinks[i].style.backgroundColor = "";
	  }

	 // Show the specific tab content
	  document.getElementById(pageName).style.display = "block";

	 // Add the specific color to the button used to open the tab content
	  elmnt.style.backgroundColor = color;
	}

	// Get the element with id="defaultOpen" and click on it
	document.getElementById("defaultOpen").click();
</script>
</head>
<body>
	<% 
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/vidtek", "root", "EduN1305");
	Statement stat = con.createStatement();
	String user = request.getParameter("parametro");
	int id = Integer.parseInt(request.getParameter("video"));
	int tipo = Integer.parseInt(request.getParameter("tipo"));
	String String30 = "adicionar_comentariodb.jsp?parametro=" + user+"&video=" + id + "&tipo=" + tipo +"";
	String caminho = "";
	String nome ="";
	String desc ="";
	String stringp="";
	int nview=0;
	int ativo=0;
	ResultSet jm3;
	jm3=stat.executeQuery("SELECT ativo FROM utilizador WHERE username='" + user +"'");
	if(jm3.next()){
		
		ativo = jm3.getInt(1);
		

	}
	jm3.close();
	 String string1 = "adicionar_video.jsp?parametro=" + user + "";
	 if(ativo == 1)
	 {
		stringp = "principal.jsp?parametro=" + user + "";
	 }
	 else if (ativo ==2)
	 {
		stringp = "principaladmin.jsp?parametro=" + user + ""; 
	 }

	  %>
	<div class="principal">
		<div class="div2">
		<div class="logo"><%
			Random random = new Random();
			int a = random.nextInt(4);
			
			if(a == 0){%>
				<a href=<%= stringp %>><img src="../Trabalhos/logo/Vid1.PNG" width=100% height=100%></a><% } else if(a==1){ %>
				<a href=<%= stringp %>><img src="../Trabalhos/logo/vid2.PNG" width=100% height=100%></a><%} else if(a==2){ %>
				<a href=<%= stringp %>><img src="../Trabalhos/logo/vid3.PNG" width=100% height=100%></a><%} else if(a==3){%>
				<a href=<%= stringp %>><img src="../Trabalhos/logo/vid4.PNG" width=100% height=100%></a><%} %>
					
			</div>
			<div class="button">
				<nav class="drown" float=right>
					<ul float=right>
						<li><a href="login.jsp" ><% out.println(user); %></a></li>
					</ul>
					
				</nav>
				
			</div>
		</div>
		<div class="div32">
		  
		
				<div class="divcentro">
			
							<table class="table2">
							<tr class="tr1"><td>
								<%
										
    					
    						ResultSet jm;
    						if (tipo==1)
    						{
    						jm=stat.executeQuery("SELECT * FROM videopessoal WHERE username='" + user + "'  and id_videopessoal="+ id + "");
    						if(jm.next()){
    									
    										String url = jm.getString("url");
    										 nome = jm.getString("nome");
    										 caminho = "../Trabalhos/vidtekpessoalvideo/" + url +"";
    								desc = jm.getString("descricao");
    						 } 
    						 jm.close();
    						}
    						else if(tipo==2)
    						{
    							jm=stat.executeQuery("SELECT * FROM videoadmin WHERE id_video="+ id + "");
        						if(jm.next()){
        									nview= jm.getInt("n_view");
        										String url = jm.getString("url");
        										 nome = jm.getString("nome");
        										 caminho = "../Trabalhos/vidtekpessoalvideo/" + url +"";
        								desc = jm.getString("descricao");
        						 } 
        						 jm.close();
    						}
    						else if(tipo==3)
    						{
    							jm=stat.executeQuery("SELECT * FROM videopessoal WHERE  id_videopessoal="+ id + "");
        						if(jm.next()){
									
									String url = jm.getString("url");
									 nome = jm.getString("nome");
									 caminho = "../Trabalhos/vidtekpessoalvideo/" + url +"";
							desc = jm.getString("descricao");
								 } 
								 jm.close();
    						}
    						%>
    						<font color=red><h2><%= nome %></h2></font></td>
							</tr>
							<tr class="tr2"><td>
							 <center>
							 <video width=450px height=250px controls>
 								 <source src=<%= caminho %> type="video/mp4" onclick="openPage('News', this)">
							</video></center></td>
							</tr>
							<%if(tipo == 2){%>
							<tr>
							<td>	<div id="displayed"><p><font color=red><h5>Número de visualizações:</h5></font><font color=white><h6><%= nview %></h6></font></div></p></td>
							</tr>
							<%} %>
							<tr>
							<td>
							<div id="displayed">	
							<p>
								<font color=red><h5>Género(s): </h5></font>
							
							<% 
							if(tipo == 1)
							{
								ResultSet rs = stat.executeQuery("select nome, count(id_genero) from genero where id_genero in (select id_genero from  videopessoal_genero where id_videopessoal= '" + id +"')"); 
							int i = 0;
							int b = 1;
							rs.next();
							i = rs.getInt(2);
							rs.close();
							ResultSet st = stat.executeQuery("select nome from genero where id_genero in (select id_genero from  videopessoal_genero where id_videopessoal= '" + id +"')");
							while(st.next()){
								String genero = st.getString("nome"); 
								%> <font color=white><h6><%= genero %></h6></font> 
							<%	
								if(b < i){%>
									<font color=white><h6>,&ensp;</h6></font> 
							<%
								b++;
								} else{%>
									<font color=white><h6>; </h6></font> <%
								}
							}
							st.close();
								}
							else if (tipo==2)
							{
								ResultSet rs = stat.executeQuery("select nome, count(id_genero) from genero where id_genero in (select id_genero from  videoadmin_genero where id_video= '" + id +"')"); 
							int i = 0;
							int b = 1;
							rs.next();
							i = rs.getInt(2);
							rs.close();
							ResultSet st = stat.executeQuery("select nome from genero where id_genero in (select id_genero from  videoadmin_genero where id_video= '" + id +"')");
							while(st.next()){
								String genero = st.getString("nome"); 
								%> <font color=white><h6><%= genero %></h6></font> 
							<%	
								if(b < i){%>
									<font color=white><h6>,&ensp;</h6></font> 
							<%
								b++;
								} else{%>
									<font color=white><h6>; </h6></font> <%
								}
							}
							st.close();
							}else if(tipo == 3)
							{
								ResultSet rs = stat.executeQuery("select nome, count(id_genero) from genero where id_genero in (select id_genero from  videopessoal_genero where id_videopessoal= '" + id +"')"); 
							int i = 0;
							int b = 1;
							rs.next();
							i = rs.getInt(2);
							rs.close();
							ResultSet st = stat.executeQuery("select nome from genero where id_genero in (select id_genero from  videopessoal_genero where id_videopessoal= '" + id +"')");
							while(st.next()){
								String genero = st.getString("nome"); 
								%> <font color=white><h6><%= genero %></h6></font> 
							<%	
								if(b < i){%>
									<font color=white><h6>,&ensp;</h6></font> 
							<%
								b++;
								} else{%>
									<font color=white><h6>; </h6></font> <%
								}
							}
							st.close();
								}
							%></p>
							</div></td>
							</tr>
							<tr><td>
							<div id="displayed">	
							<p>
								<font color=red><h5>Interveniente(s): </h5></font>
							
							<% 
							if(tipo==1)
								{
								ResultSet en = stat.executeQuery("select nome, count(id_interveniente) from interveniente where id_interveniente in (select id_interveniente from  videopessoal_interveniente where id_videopessoal= '" + id +"')"); 
								
							int ii = 0;
							int bb = 1;
							en.next();
							ii = en.getInt(2);
							en.close();
							ResultSet rn = stat.executeQuery("select nome from interveniente where id_interveniente in (select id_interveniente from  videopessoal_interveniente where id_videopessoal= '" + id +"')");
							while(rn.next()){
								String interveniente = rn.getString("nome"); 
								%> <font color=white><h6><%= interveniente %></h6></font> 
							<%	
								if(bb < ii){%>
									<font color=white><h6>,&ensp;</h6></font> 
							<%
								bb++;
								} else{%>
									<font color=white><h6>; </h6></font> <%
								}
							}
								}
							else if (tipo ==2)
							{
								ResultSet en = stat.executeQuery("select nome, count(id_interveniente) from interveniente where id_interveniente in (select id_interveniente from  videoadmin_interveniente where id_video= '" + id +"')"); 
								
								int ii = 0;
								int bb = 1;
								en.next();
								ii = en.getInt(2);
								en.close();
								ResultSet rn = stat.executeQuery("select nome from interveniente where id_interveniente in (select id_interveniente from  videoadmin_interveniente where id_video= '" + id +"')");
								while(rn.next()){
									String interveniente = rn.getString("nome"); 
									%> <font color=white><h6><%= interveniente %></h6></font> 
								<%	
									if(bb < ii){%>
										<font color=white><h6>,&ensp;</h6></font> 
								<%
									bb++;
									} else{%>
										<font color=white><h6>; </h6></font> <%
									}
								}
							}else if(tipo==3)
							{
							ResultSet en = stat.executeQuery("select nome, count(id_interveniente) from interveniente where id_interveniente in (select id_interveniente from  videopessoal_interveniente where id_videopessoal= '" + id +"')"); 
							
						int ii = 0;
						int bb = 1;
						en.next();
						ii = en.getInt(2);
						en.close();
						ResultSet rn = stat.executeQuery("select nome from interveniente where id_interveniente in (select id_interveniente from  videopessoal_interveniente where id_videopessoal= '" + id +"')");
						while(rn.next()){
							String interveniente = rn.getString("nome"); 
							%> <font color=white><h6><%= interveniente %></h6></font> 
						<%	
							if(bb < ii){%>
								<font color=white><h6>,&ensp;</h6></font> 
						<%
							bb++;
							} else{%>
								<font color=white><h6>; </h6></font> <%
							}
						}
							}
							%></p>
							</div></td>
							</tr>
							<tr><td>
							<font color=red><h5>Descrição: </h5></font>
							<font color=white><h6><%= desc %></h6></font></td>
							</tr>
							<%if(tipo!=1 && tipo != 3){ %>
							<tr><td colspan="2">
							<font color=red>Comentário(s): </h5></font>
							<font color=white><h6><table><tr>
							<%if(ativo != 2) {%>
							<form method="post" action =<%= String30 %>> 
								
								<textarea id="come" name="come" rows="5" cols="50">
								</textarea><br>
								&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;<input type="submit" value="Adicionar" name="submeter" />
							</form><%}
							ResultSet rn = stat.executeQuery("select username,comentario,data,hora from comentario_videoadmin where Id_video =  '" + id +"'");
							while(rn.next()){
								String usern = rn.getString("username"); 
								String comentario = rn.getString("comentario"); 
								String data = rn.getString("data");
								String hora = rn.getString("hora"); 
								%>
								 <tr><font color=white><h3><%= comentario %></h3></font><div id="displayed"><font color=red><h3><%= usern %></h3></font> 	&ensp;<font color=white><h4><%= data %> | <%= hora %></h4></font></div></tr>
						<%	} %> </tr></table></h6></font></td>
							</tr><% }%>
							</table>
						</div>
		</div>
	</div>
	<div id="News" class="tabcontent">
 
										
										<%
										if (tipo==2)
										 {
    										ResultSet jm1;
    										jm1=stat.executeQuery("SELECT n_view FROM videoadmin where id_video = "+ id+"");
    										if(jm1.next()){
    											int n_view = jm1.getInt(1);
    											n_view +=1;
    											int i = stat.executeUpdate("update videoadmin set n_view=" + n_view + " where id_video=" + id + "");

    												jm1.close();
    								
    									
    						 	}}%>
								
</div>
</center>
</body>
</html>