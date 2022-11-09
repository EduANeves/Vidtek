<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.Random"%>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="STYLESHEET" type="text/css" href="main.css">
<link rel="STYLESHEET" type="text/css" href="csstab.css">
<title>Estatística</title> <script type="text/javascript">
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
table {
	border-collapse: collapse;
	width: 100%;
}

th{	padding: 8px;
	text-align: left;
	border-bottom: 1px solid #ddd;}

 td {
	padding: 8px;
	text-align: left;
	border-bottom: 1px solid #ddd;
	text-align:center;
}

td:hover {
	background-color: #F0E68C;
}

.div2021 {
	width: 100%;
	height: 100%;
}

.table2 {
	width: 100%;
	height: 100%;
}

.tr1 {
	widht: 33%;
	height: 10%;
}
.td1{width: 33%;}
.td2{width: 50%;}
.tr2 {
	width: 33%;
	height: 30%;
}

.linha {
	width: 33%;
	height: 100%;
}#displayed {
    display: flex;
 justify-content: center; }
</style>

</head>
<body>
	<% String user = request.getParameter("parametro");
int id = 0;
String stringp = "principaladmin.jsp?parametro=" + user + "";
String string1 = "adicionar_video.jsp?parametro=" + user + "";
String string0 = "estatistica.jsp?parametro=" + user + "";
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
		<div class="div1">
		  
		 <center>
		
				<div class="divcentro">

							
  <font color=white><h1>Estaística VidTek</h1></font>
  
  									<table class="table2">
  									<tr>
  									<td class="td1"></td>
  									<td class="td1"><font color=red>Mais visualizado</font></td>
  									<td class="td1"><font color=red>Menos visualizado</font></td>
  									</tr>
  									<tr>
  									<th class="td1"><font color=red>Vídeo:</font></th>
									<% int i = 0;
									
							
									String url = "" ;
						Class.forName("com.mysql.cj.jdbc.Driver");
						Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/vidtek", "root", "EduN1305");
						Statement stat = con.createStatement();
						ResultSet jm;
						jm=stat.executeQuery("SELECT max(n_view),min(n_view) FROM videoadmin");
						if(jm.next()){
							int max = jm.getInt(1);
							int min = jm.getInt(2);
							ResultSet jm1;
							jm1=stat.executeQuery("SELECT id_video FROM videoadmin where n_view=" + max +"");
							if(jm1.next()){
								ResultSet jm2;
								int idmax= jm1.getInt(1);
								jm2=stat.executeQuery("SELECT nome FROM videoadmin where id_video=" + idmax + "");
								if(jm2.next()){
									String nome= jm2.getString(1);
									%>
									<td class="td1"><font color=white><%= nome %></font></td>
									<%
									
								}
							}
							ResultSet jm3;
							jm3=stat.executeQuery("SELECT id_video FROM videoadmin where n_view=" + min +"");
							if(jm3.next()){
								ResultSet jm4;
								int idmin= jm3.getInt(1);
								jm4=stat.executeQuery("SELECT nome FROM videoadmin where id_video=" + idmin + "");
								if(jm4.next()){
									String nome= jm4.getString(1);
									%>
									<td class="td1"><font color=white><%= nome %></font></td>
									<%
									
								}
							}
						}
						%></tr></table>
						<br><table class="table2"><tr>
  									<td class="td2"></td>
  									<td class="td2"><font color=red>Mais utilizado</font></td>
  									</tr>
							<th class="td2"><font color=red>Interveniente:</font></th>
									<% int c = -1;
									int b = 0;
							
									
						
						ResultSet jm8;
						int d = 0;
						int idib=0;
						int idic=0;
						int idi=0;
						jm8=stat.executeQuery("select id_interveniente,count(id_interveniente) from videoadmin_interveniente group by id_interveniente");
						while(jm8.next()){
							idi = jm8.getInt(1);
							d = jm8.getInt(2);
							if(d>b){
								b = d;
							idib=idi;
							}
							if(d<c ||d==c  ){
								c = d;
								idic=idi;
							}
							else{
							

							}}
							ResultSet jm0;
							jm0=stat.executeQuery("select nome from interveniente where id_interveniente=" + idib + "");
							if(jm0.next()){
								String nome1 = jm0.getString(1);
									%>
									<td class="td2"><font color=white><%= nome1 %></font></td>
									<%
							}
						%></tr></table><br>
						<table class="table2">
							<tr>
  									<td class="td2"></td>
  									<td class="td2"><font color=red>Mais utilizado</font></td>
  									</tr>
  							<tr>
							<th class="td2"><font color=red>Género:<font color=red></th>
									<% int g = -1;
									int h = 0;
							
									
						
						ResultSet jm11;
						int j = 0;
						int idik=0;
						int idil=0;
						int idiç=0;
						jm11=stat.executeQuery("select id_genero,count(id_genero) from videoadmin_genero group by id_genero");
						while(jm11.next()){
							idiç = jm11.getInt(1);
							j = jm11.getInt(2);
							if(j>h){
								h = j;
							idik=idiç;
							}
							if(j<g ||j==g  ){
								g = j;
								idil=idiç;
							}
							else{
							

							}}
							ResultSet jm12;
							jm12=stat.executeQuery("select nome from genero where id_genero=" + idik + "");
							if(jm12.next()){
								String nome1 = jm12.getString(1);
									%>
									<td class="td2"><font color=white><%= nome1 %></font></td>
									<%
							}
						%></tr>
						</table><br>
								<div class="div2021">	
							</div>
						</div>
			</center>
		</div>
	</div>
</body>
</html>