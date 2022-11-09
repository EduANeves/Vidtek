<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*"%>
       <%@ page import="java.util.Random"%>
<!DOCTYPE html>
<html>

<head>

<meta http-equiv=”Content-Type” content=”text/html; charset=utf-8″>

<link rel="STYLESHEET" type="text/css" href="main.css">
<link rel="STYLESHEET" type="text/css" href="csstab.css">
<title>Alterar vídeo</title> <script type="text/javascript">
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
input[type=submit]{
  background-color: red;
  border: none;
  color: white;
  padding: 16px 32px;
  text-decoration: none;
  margin: 4px 2px;
  cursor: pointer;
}
</style>
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
	  margin-left:20%;

	  justify-content: center;
	
}
img, p {
    display: inline-block;
}
.tr1 {
	widht:100%;
	height: 10%;
}

.tr2 {
	width: 100%;
	height: 40%;
	text-align: left;
}

.linha {
	width: 33%;
	height: 100%;
}
#displayed {
    display: flex; 
    }
 #displayed2{
     display: flex;
      aling-items: center;
      justify-content: space-between;
      }
</style>

</head>
<body>
<% String user = request.getParameter("parametro");
	int id = Integer.parseInt(request.getParameter("video"));
	int tipo = Integer.parseInt(request.getParameter("tipo"));
	String stringp="";
	if(tipo ==1)
	{
		 stringp = "principal.jsp?parametro=" + user + "";
	}
	else if(tipo==2)
	{
		 stringp = "principaladmin.jsp?parametro=" + user + "";
	}
		 String nome = "";
		 String desc = "";
		 String string1 = "update.jsp?parametro=" + user + "&video=" + id +"&tipo=" + tipo +"";
		 String string8 ="adicionar_interveniente2.jsp?parametro=" + user + "&video=" + id +"&tipo=" + tipo +"";
		 String string9 ="adicionar_genero2.jsp?parametro=" + user + "&video=" + id +"&tipo=" + tipo +"";
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
				<form method="post" action =<%= string1 %>>
				
							<table class="table2">
							<tr class="tr1"><td>
								<%		
    						Class.forName("com.mysql.cj.jdbc.Driver");
    						Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/vidtek", "root", "EduN1305");
    						Statement stat = con.createStatement();
    						if(tipo == 1)
    						{
    						ResultSet jm;
    						jm=stat.executeQuery("SELECT * FROM videopessoal WHERE username='" + user + "'  and id_videopessoal="+ id + "");
    						if(jm.next()){
    									
    										
    										 nome = jm.getString("nome");
    										 desc = jm.getString("descricao");
    						 } 
    						 jm.close();
    						 }
    						 else if (tipo==2)
    						 {
    								ResultSet jm1;
    	    						jm1=stat.executeQuery("SELECT * FROM videoadmin WHERE id_video="+ id + "");
    	    						if(jm1.next()){
    	    									
    	    										
    	    										 nome = jm1.getString("nome");
    	    										 desc = jm1.getString("descricao");
    	    						 } 
    	    						 jm1.close();
    						 }%>
    						 <div id="displayed">	
    						<p><font color=red><h5>Nome: </h5></font>&ensp;<font color=white>&ensp;<input type="Text" id="displayed2"  value=<%=nome%> readonly></input></font></td>
							</p></div>
							</tr>
							<tr><td>
						
							<p>
							
								<font color=red><h5>G&eacute;nero(s): </h5></font>
							
							<% 
							if(tipo ==1)
							{
							ResultSet st = stat.executeQuery("select * from genero where id_genero in (select id_genero from  videopessoal_genero where id_videopessoal= '" + id +"')");
							while(st.next()){
								String genero = st.getString("nome"); 
								int id_g = st.getInt("id_genero");
								String string2 = "apagargenerodb.jsp?parametro=" + user + "&video=" + id +"&genero="+ id_g +"&tipo=1"; 
								%>  <div id="displayed">	<p><font color=white><h6><%= genero %></h6></font> <a href=<%= string2 %>><img  src="https://icons555.com/images/icons-red/image_icon_delete_pic_512x512.png" width=25px height=25px align=middle title="Apagar g&eacute;nero"></a>
							</p></div><%	
							
							}
							st.close();
							}
							else if(tipo ==2)
							{
								ResultSet st1 = stat.executeQuery("select * from genero where id_genero in (select id_genero from  videoadmin_genero where id_video= '" + id +"')");
								while(st1.next()){
									String genero = st1.getString("nome"); 
									int id_g = st1.getInt("id_genero");
									String string2 = "apagargenerodb.jsp?parametro=" + user + "&video=" + id +"&genero="+ id_g +"&tipo=2"; 
									%>  <div id="displayed">	<p><font color=white><h6><%= genero %></h6></font> <a href=<%= string2 %>><img  src="https://icons555.com/images/icons-red/image_icon_delete_pic_512x512.png" width=25px height=25px align=middle title="Apagar g&eacute;nero" ></a>
								</p></div><%	
								
								}
								st1.close();
							}
							%></p>
							</td>
								<td>
							 <center>
     							 <a href=<%= string9 %>><img src="https://icons555.com/images/icons-red/image_icon_add_pic_512x512.png" width=50px height=50px align=right title="Adcionar g&eacute;neros"  ></a>
    						 </center>
							</td>
							</tr>
							<tr><td>
							
							<p>
								<font color=red><h5>Interveniente(s): </h5></font>
							
							<% 
							if(tipo == 1)
							{
							ResultSet rn1 = stat.executeQuery("select * from interveniente where id_interveniente in (select id_interveniente from  videopessoal_interveniente where id_videopessoal= '" + id +"')");
							while(rn1.next()){
								String interveniente = rn1.getString("nome"); 
								int id_i = rn1.getInt("id_interveniente");
								String string2 = "apagarintervenientedb.jsp?parametro=" + user + "&video=" + id +"&interveniente=" + id_i +"&tipo=1";  
								%>  <div id="displayed"><p>	<font color=white><h6><%= interveniente %></h6></font> <a href=<%= string2 %>><img  src="https://icons555.com/images/icons-red/image_icon_delete_pic_512x512.png" width=25px height=25px align=middle title="Apagar interveniente"></a>
							</p></div><%	
							}
							}
							else if(tipo ==2)
							{
								ResultSet rn = stat.executeQuery("select * from interveniente where id_interveniente in (select id_interveniente from  videoadmin_interveniente where id_video= '" + id +"')");
								while(rn.next()){
									String interveniente = rn.getString("nome"); 
									int id_i = rn.getInt("id_interveniente");
									String string2 = "apagarintervenientedb.jsp?parametro=" + user + "&video=" + id +"&interveniente=" + id_i +"&tipo=2"; 
									%>  <div id="displayed"><p>	<font color=white><h6><%= interveniente %></h6></font> <a href=<%= string2 %>><img  src="https://icons555.com/images/icons-red/image_icon_delete_pic_512x512.png" width=25px height=25px align=middle title="Apagar interveniente" ></a>
								</p></div><%	
								}
							}
							%></p>
							</td>
							<td>
							 <center>
     							<a href=<%= string8 %>><img src="https://icons555.com/images/icons-red/image_icon_add_user_pic_512x512.png" width=50px height=50px align=right title="Adcionar intervenientes" ></a>
    						 </center>
							</td>
							</tr>
							<tr><td>
							<font color=red><h5>Descri&ccedil;&atilde;o: </h5></font>
								<div id="display"><font color=white><textarea id="come" name="come" rows="5" cols="100" > <%= desc %></textarea></font> <input type="submit" value="Atualizar"/></div>
    						 </td>
							</tr>

							</table>
				</form>
						</div>
		</div>
	</div>

</body>
</html>