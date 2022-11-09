<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.Random"%>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="STYLESHEET" type="text/css" href="main.css">
<link rel="STYLESHEET" type="text/css" href="csstab.css">


<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
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

table {
	border-collapse: collapse;
	width: 100%;

}

th, td {
	padding: 8px;
	text-align: left;
	border-bottom: 1px solid #ddd;
}

td:hover {
	background-color: #F0E68C;
}

.div2021 {
	width: 100%;
	height: 100%;
		background-color: #191828;
}

.table2 {
	width: 100%;
	height: 100%;
}

.tr1 {
	widht: 33%;
	height: 10%;
}

.tr2 {
	width: 33%;
	height: 30%;
}
.tr3 {
	width: 33%;
	height: 5%;
}

.linha {
	width: 33%;
	height: 100%;

}
.table3
 { 

 
 }
.trtable3
{
width:100%;
 height:5%;
 }
.thtable3
{
width:33%;
 height:5%;
}
.tdtable3
{
width:33%;
 height:5%;

}
#displayed {
    display: flex;
 justify-content: center; }
</style>

<style>
body {
  font-family: "Lato", sans-serif;
}

.sidenav {
  height: 100%;
  width: 0;
  position: fixed;
  z-index: 1;
  top: 0;
  left: 0;
  background-color: #111;
  overflow-x: hidden;
  transition: 0.5s;
  padding-top: 60px;
}

.sidenav a {
  padding: 8px 8px 8px 32px;
  text-decoration: none;
  font-size: 25px;
  color: #818181;
  display: block;
  transition: 0.3s;
}

.sidenav a:hover {
  color: #f1f1f1;
}

.sidenav .closebtn {
  position: absolute;
  top: 0;
  right: 25px;
  font-size: 36px;
  margin-left: 50px;
}

@media screen and (max-height: 450px) {
  .sidenav {padding-top: 15px;}
  .sidenav a {font-size: 18px;}
}
</style>
</head>
<body>
	<% String user = request.getParameter("parametro");
int id = 0;
String stringp = "principal.jsp?parametro=" + user + "";
String string1 = "adicionar_video.jsp?parametro=" + user + "";
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
						<li><a  href="login.jsp" title="Sair"><% out.println(user); %></a></li>
					</ul>
					
				</nav>
				
			</div>
		</div>
		<div class="div1">
		  <br><br>
	    	 <!-- Sidebar -->
&ensp;&ensp;<div id="mySidenav" class="sidenav">

  <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
  <a onclick="openPage('Home', this)">VidTek Pessoal</a>
  <a  onclick="openPage('News', this)" >VidTek</a>
  <a onclick="openPage('Contact', this )" >Histórico de partilhas</a>
  <a onclick="openPage('About', this )">Partilhados</a>
  
</div>
<span style="font-size:30px; color:red; cursor:pointer" onclick="openNav()">&#9776; </span>
<script>
function openNav() {
  document.getElementById("mySidenav").style.width = "250px";
}

function closeNav() {
  document.getElementById("mySidenav").style.width = "0";
}
</script>
<div class="divcentro"><center>
<div id="Home" class="tabcontent">
  <h3>VidTek Pessoal</h3>
  <p>Desfrute dos seus vídeos!</p>
  <table class="table2">
										<tr class="tr1">
											<th class="linha"></th>
											<th class="linha"></th>
											<th class="linha" text-align = right><a href=<%= string1 %>><img src="https://icons555.com/images/icons-red/image_icon_video_add_pic_512x512.png" width=75px height=75px align=right ></a></th>
										</tr>
										<%
										int i = 0;
										int b = 0;
								
										String url = "" ;
    						Class.forName("com.mysql.cj.jdbc.Driver");
    						Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/vidtek", "root", "EduN1305");
    						Statement stat = con.createStatement();
    						String select ="SELECT COUNT(id_videopessoal) FROM videopessoal WHERE username = '" + user + "' ";
    						ResultSet rs;
    						rs = stat.executeQuery(select);
    						rs.next();
    						int j = rs.getInt(1);
    						float r=j/9;
    						j=Math.round(r);
    						ResultSet jm;
    						jm=stat.executeQuery("SELECT * FROM videopessoal WHERE username='" + user + "' ");
    						if(jm.next()){
    							
    							while(b<3)
    							{%>
    							<tr class="tr1"><%
    								
    								while(i<3)
    								{
    									jm.close();
    									ResultSet st;
    									st = stat.executeQuery("SELECT * FROM videopessoal WHERE username='" + user + "' and id_videopessoal >" + id + "");
    									if(st.next()){
    										url = st.getString("urlimagem");
    										id = st.getInt("id_videopessoal");
    										String nome = st.getString("nome");
    										String string2 = "apagar.jsp?parametro=" + user + "&video=" + id +"&tipo=1";
    										String string3 = "vervideo.jsp?parametro=" + user + "&video=" + id +"&tipo=1";
    										String string4 = "alterarvideo.jsp?parametro=" + user + "&video=" + id +"&tipo=1";
    										String string5 = "partilha.jsp?parametro=" + user + "&video=" + id +"&tipo=1";
    										String caminho = "../Trabalhos/vidtekpessoalimagem/" + url +"";
    										%>
    										<td class="linha"><font color=red align=middle><h3><%= nome %></h3></font><p align=middle><a href=<%= string3 %>><img src=<%= caminho %>   width=200px height=200px alt="Some video" align=middle ></a></p><br>
    						<div id="displayed"><a href=<%= string4 %>><img  src="https://icons555.com/images/icons-red/image_icon_edit_pic_512x512.png" width=25px height=25px align=middle ></a>
    							&ensp; <a href=<%= string2 %>><img  src="https://icons555.com/images/icons-red/image_icon_delete_pic_512x512.png" width=25px height=25px align=middle ></a>
    							&ensp; <a href=<%= string5 %>><img  src="https://icons555.com/images/icons-red/image_icon_sharethis_pic_512x512.png" width=25px height=25px align=middle ></a></div></td>
    					<%	
    									}	st.close();					
    									i+=1;
    								}
    								i=0;
    								b +=1;
    								%></tr><%
    							}
    						 	}%>
									</table>
</div>
</center>
<center>
<div id="News" class="tabcontent">
  <h3>VidTek</h3>
  <p>Desfrute na nossa gama ampla de filmes e séries à distância de um clique!</p>
   <table class="table2">
										
										<%
										int i1 = 0;
										int b1 = 0;
								int id2=0;
										String url1 = "" ;
										Statement stat1 = con.createStatement();
    						String select1 ="SELECT COUNT(id_video) FROM videoadmin";
    						ResultSet rs1;
    						rs1 = stat1.executeQuery(select1);
    						rs1.next();
    						int j1 = rs1.getInt(1);
    						float r1=j1/9;
    						j1=Math.round(r1);
    						ResultSet jm1;
    						jm1=stat1.executeQuery("SELECT * FROM videoadmin");
    						if(jm1.next()){
    							
    							while(b1<3)
    							{%>
    							<tr class="tr1"><%
    								
    								while(i1<3)
    								{ 
    									
    									jm1.close();
    									ResultSet abc;
    									abc = stat1.executeQuery("SELECT * FROM videoadmin WHERE id_video >" + id2 + "");
    									if(abc.next()){
    										url1 = abc.getString("urlimagem");
    										id2 = abc.getInt("id_video");
    										String nome = abc.getString("nome");
    										float rate = abc.getFloat("rate");
    										
    										String string3 = "vervideo.jsp?parametro=" + user + "&video=" + id2 +"&tipo=2";
    										
    										String caminho = "https://image.tmdb.org/t/p/w500" + url1 +"";
    										%>
    										<td class="linha"><font color=red align=middle><h3><%= nome %></h3></font><p align=middle><a href=<%= string3 %>><img src=<%= caminho %>   width=200px height=200px alt="Some video" align=middle ></a><br><center><%if(rate >=7){%><font color=green><%=rate%></font><%}else if(rate >=4 && rate <=6.9){%><font color=orange><%=rate%></font><%}else if(rate <4){%><font color=red><%=rate%></font><%} %></center> </p><br>
    						</td>
    					<%	
    									}	abc.close();					
    									i1+=1;
    								}
    								i1=0;
    								b1 +=1;
    								%></tr><%
    							}
    						 	}%>
									</table>
</div>
</center>
<center>
<div id="About" class="tabcontent">
  <h3>Partilhas</h3>
  <p>Aqui poderá ver as partilhas que foram realizadas com você</p>
   
   <%		
	String selectd ="SELECT COUNT(id_partilha) FROM partilha_utilizador WHERE username = '" + user + "' ";
	ResultSet rsd;
	rsd = stat.executeQuery(select);
	rsd.next();
	int jd = rsd.getInt(1);
	float rd=jd/9;
	jd=Math.round(rd);
	ResultSet jmd;
	jmd=stat.executeQuery("SELECT * FROM videopessoal Where id_videopessoal in (SELECT id_videopessoal FROM partilha where id_partilha in (SELECT id_partilha FROM partilha_utilizador WHERE username='" + user + "'))");
	if(jmd.next()){ %>
  <table class="table2">
										
										<%
										int ib = 0;
										int bd = 0;
								
										String urld = "" ;
    				
    							int id3 =0;
    							while(bd<3)
    							{%>
    							<tr class="tr1"><%
    								
    								while(ib<3)
    								{
    									jmd.close();
    									ResultSet st;
    									
    									st = stat.executeQuery("SELECT * FROM videopessoal Where id_videopessoal in (SELECT id_videopessoal FROM partilha where id_videopessoal > " + id3 + " and id_partilha in (SELECT id_partilha FROM partilha_utilizador WHERE username='" + user + "'))");
    									if(st.next()){
    										urld = st.getString("urlimagem");
    										id3 = st.getInt("id_videopessoal");
    										String nome = st.getString("nome");
    									
    										String string3 = "vervideo.jsp?parametro=" + user + "&video=" + id3 +"&tipo=3";
    										String caminho = "../Trabalhos/vidtekpessoalimagem/" + urld +"";
    										%>
    										<td class="linha"><font color=red align=middle><h3><%= nome %></h3></font><p align=middle><a href=<%= string3 %>><img src=<%= caminho %>   width=200px height=200px alt="Some video" align=middle ></a></p><br></td>
    					<%	
    									}	st.close();					
    									ib+=1;
    								}
    								i=0;
    								bd +=1;
    								%></tr><%
    							}
    						 	%>
									</table><%} else {%><br><br><center>	<h1 >Não tem nenhum video compartilhado consigo</h1> </center> <%} %>
</div>
</center>

		<div id="Contact" class="tabcontent">
			<center>
 				<h3>Histórico de partilhas</h3>
  				<p>Aqui poderá ver o seu hístorico de partilhas ativas podendo apagar a partilha que quiser</p>
 		 	</center>
 		 	<%
			ResultSet st;
 			int ic3 =0;
			st = stat.executeQuery("SELECT videopessoal.nome,partilha_utilizador.username,videopessoal.id_videopessoal,partilha_utilizador.id_partilha FROM videopessoal,partilha_utilizador Where partilha_utilizador.id_partilha in (select id_partilha from partilha where id_videopessoal > " + ic3 + " ) and videopessoal.id_videopessoal in (SELECT id_videopessoal FROM partilha where id_videopessoal > " + ic3 + ") and videopessoal.username='" + user + "'");
			if(st.next()){ %>
 			<table class="table3">
 			<tr class="trtable3">
 			<th class="thtable3">Nome do video:</th>
 			<th class="thtable3">Nome do utilizador:</th>
 			<th class="thtable3">Opção eliminar:</th>
 			</tr>
 													<%
 													
    						
    							int ic4 =0;
    						%>
    							<tr class="tr3"><%
    										
    									ic3 = st.getInt(3);
    										ic4 = st.getInt(4);
    										String nomec = st.getString(1);
    										String username = st.getString(2);
    										String string2 = "apagarpartilha.jsp?parametro=" + user + "&video=" + ic3 +"&tipo=1&username=" + username + "&id_p=" + ic4 +  "";
    										%>
    										<td class="linha2"><font color=red ><h3><%= nomec %></h3></font></td><td class="linha2"><font color=red ><h3><%= username %></h3></font></td>	<td class="linha2"><a href=<%= string2 %>><img  src="https://icons555.com/images/icons-red/image_icon_delete_pic_512x512.png" width=25px height=25px align=middle ></a><br> </td>
    					<%	
    													
    								
    								%></tr><%
    							
    						 	%>
</table>
<%}	
else
{
%><br><br><center>	<h1 >Não tem partilhas efetuadas</h1> </center><% }st.close();	%>
		</div>	
	</div>
</div>
</body>
</html>