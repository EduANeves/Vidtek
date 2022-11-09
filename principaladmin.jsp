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
<title>VidTek | Your personal video library :)</title> <script type="text/javascript">
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
						<li><a href="login.jsp" title="Sair"><% out.println(user); %></a></li>
					</ul>
					
				</nav>
				
			</div>
		</div>
		<div class="div1">
		  
		 <center>
		
				<div class="divcentro">
			
  <font color=white><h1>VidTek</h1></font>
  
  <table class="table2">
										<tr class="tr1">
											<th class="linha"></th>
											<th class="linha"></th>
											<th class="linha" text-align = right><a href=<%= string0 %>><img src="https://icons555.com/images/icons-red/image_icon_bar_chart_pic_512x512.png" width=75px height=75px align=right title="Estatísticas VidTek"></a>&ensp;&ensp;<a href=<%= string1 %>><img src="https://icons555.com/images/icons-red/image_icon_video_add_pic_512x512.png" width=75px height=75px align=right ></a></th>
										</tr>
										<%
										int i = 0;
										int b = 0;
								
										String url = "" ;
    						Class.forName("com.mysql.cj.jdbc.Driver");
    						Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/vidtek", "root", "EduN1305");
    						Statement stat = con.createStatement();
    						String select ="SELECT COUNT(id_video) FROM videoadmin";
    						ResultSet rs;
    						rs = stat.executeQuery(select);
    						rs.next();
    						int j = rs.getInt(1);
    						float r=j/9;
    						j=Math.round(r);
    						ResultSet jm;
    						jm=stat.executeQuery("SELECT * FROM videoadmin");
    						if(jm.next()){
    							
    							while(b<3)
    							{%>
    							<tr class="tr1"><%
    								
    								while(i<3)
    								{
    									jm.close();
    									ResultSet st;
    									st = stat.executeQuery("SELECT * FROM videoadmin WHERE id_video >" + id + "");
    									if(st.next()){
    										url = st.getString("urlimagem");
    										id = st.getInt("id_video");
    										String nome = st.getString("nome");
    										float rate = st.getFloat("rate");
    										String string2 = "apagar.jsp?parametro=" + user + "&video=" + id +"&tipo=2";
    										String string3 = "vervideo.jsp?parametro=" + user + "&video=" + id +"&tipo=2";
    										String string4 = "alterarvideo.jsp?parametro=" + user + "&video=" + id +"&tipo=2";
    										String caminho = "https://image.tmdb.org/t/p/w500" + url +"";
    										%>
    										<td class="linha"><font color=red align=middle><h3><%= nome %></h3></font><p align=middle><a href=<%= string3 %>><img src=<%= caminho %>   width=250px height=300px alt="Some video" align=middle ></a><br><center><%if(rate >=7){%><font color=green><%=rate%></font><%}else if(rate >=4 && rate <=6.9){%><font color=orange><%=rate%></font><%}else if(rate <4){%><font color=red><%=rate%></font><%} %></center> </p><br>
    						<div id="displayed"><a href=<%= string4 %>><img  src="https://icons555.com/images/icons-red/image_icon_edit_pic_512x512.png" width=25px height=25px align=middle ></a>
    						<a href=<%= string2 %>><img  src="https://icons555.com/images/icons-red/image_icon_delete_pic_512x512.png" width=25px height=25px align=middle ></a></div></td>
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
								<div class="div2021">	
							</div>
						</div>
			</center>
		</div>
	</div>
</body>
</html>