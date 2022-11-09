<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import ="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<link rel="STYLESHEET" type="text/css" href="main.css">
<link rel="STYLESHEET" type="text/css" href="CSS_registo.css">

<meta charset="UTF-8">
<title>Insira vídeos</title>
<script language="javascript" type="text/javascript">
	function validalogin() {
		var nome_vid = form1.vid_nome.value;
		var vid_url = form1.btnExplore.value;
		var thumbnail = form1.btnExplore2.value;
		var descricao = form1.desc.value;
		if (nome_vid == "") {
			alert('Preencha o campo');
			form1.vid_nome.focus();
			return false;}
		if (descricao == "") {
			alert('Preencha o campo');
			form1.vid_nome.focus();
			return false;}
		if (vid_url == "") {
			alert('Preencha o campo');
			form1.caminho_video.focus();
			return false;}
		if (thumbnail == "") {
			alert('Preencha o campo');
			form1.thumbnail_url.focus();
			return false;}
	}
</script>

<style>
* {box-sizing: border-box;
}
body {font-family: Verdana, sans-serif;}
.mySlides {display: none;}
img {vertical-align: middle;}



/* Slideshow container */
.slideshow-container {
max-width: 3000px;
position: fixed;
margin: auto;
}



/* Caption text */
.text {
color: green;
font-size: 15px;
padding: 8px 12px;
position: absolute;
bottom: 8px;
width: 100%;
text-align: center;
}



/* Number text (1/3 etc) */
.numbertext {
color: green;
font-size: 12px;
padding: 8px 12px;
position: absolute;
top: 0;
}





/* Animação fade in */
.fade {
-webkit-animation-name: fade;
-webkit-animation-duration: 2s;
animation-name: fade;
animation-duration: 2s;
}



@-webkit-keyframes fade {
from {opacity: .4}
to {opacity: 2}
}



@keyframes fade {
from {opacity: .4}
to {opacity: 2}
}



/* Em ecrãs mais pequenos, a fonte também fica mais pequena */
@media only screen and (max-width: 300px) {
.text {font-size: 11px}

</style>

</head>
<body scroll = "no">

	<div class="slideshow-container">
	
		<div class="mySlides fade">
			<img src="https://wallpapercave.com/wp/wp1945912.jpg" style="width: 100%; height: 100%;">
		</div>
		<div class="mySlides fade">
			<img src="https://i.pinimg.com/originals/19/a4/02/19a402329b5244dabfac565417421946.jpg" style="width: 100%; height: 100%;">
		</div>

		<div class="mySlides fade">
			<img src="https://cdn.wallpapersafari.com/46/94/AitWwC.jpg" style="width: 100%; height: 100%;">
		</div>
		<div class="mySlides fade">
			<img src="https://i.pinimg.com/originals/9b/88/b5/9b88b56b4c9c116eb26f3607f229f766.jpg" style="width: 100%; height: 100%;">
		</div>

		<div class="mySlides fade">
			<img src="https://free4kwallpapers.com/uploads/originals/2020/05/01/interstellar-wallpaper.jpg" style="width: 100%; height: 100%;"> <!-- -->
		</div>
		
		<div class="mySlides fade">
			<img src="https://i.pinimg.com/originals/16/d2/95/16d2956a307f5a561de33d8c32fa83d4.jpg" style="width: 100%; height: 100%;">
		</div>

		<div class="mySlides fade">
			<img src="https://lightbox-prod.imgix.net/images/uploads/1601859384363-birds-of-prey-2020-cc1.jpg" style="width: 100%; height: 100%;"> <!-- -->
		</div>
		<div class="mySlides fade">
			<img src="https://images6.alphacoders.com/110/1100296.jpg" style="width: 100%; height: 100%;">
		</div>
		<div class="mySlides fade">
			<img src="https://wallpaperaccess.com/full/5550736.jpg" style="width: 100%; height: 100%;">
		</div>

		<div class="mySlides fade">
			<img src="https://wallpaperaccess.com/full/304849.jpg" style="width: 100%; height: 100%;">
		</div>

		<div class="mySlides fade">
			<img src="https://vistapointe.net/images/inception-3.jpg" style="width: 100%; height: 100%;">
		</div>
		<div class="mySlides fade">
			<img src="https://www.wallpapertip.com/wmimgs/42-426811_thing-movie-poster.jpg" style="width: 100%; height: 100%;">
		</div>
		<div class="mySlides fade">
			<img src="https://i.pinimg.com/originals/ac/bc/35/acbc3566cef55e8dac3df5f13c5f9851.jpg" style="width: 100%; height: 100%;">
		</div>

		<div class="mySlides fade">
			<img src="https://cdn.wallpapersafari.com/32/87/p6Nafz.jpg" style="width: 100%; height: 100%;">
		</div>
		<div class="mySlides fade">
			<img src="https://wallpapercave.com/wp/wp1946040.jpg" style="width: 100%; height: 100%;">
		</div>
		<div class="mySlides fade">
			<img src="https://i.pinimg.com/originals/93/17/c3/9317c3fb92d45a42a911ad1a2140f8b1.jpg" style="width: 100%; height: 100%;">
		</div>
		<div class="mySlides fade">
			<img src="https://i.pinimg.com/originals/8c/a7/35/8ca735a4c707e6a2a2f480b32f5b5ef7.jpg" style="width: 100%; height: 100%;">
		</div>

		<div class="mySlides fade">
			<img src="https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/5298bac0-b8bf-4c80-af67-725c1272dbb0/de4efvt-291fdce8-7e6f-4947-96cc-8c4166d93ff2.jpg?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOiIsImlzcyI6InVybjphcHA6Iiwib2JqIjpbW3sicGF0aCI6IlwvZlwvNTI5OGJhYzAtYjhiZi00YzgwLWFmNjctNzI1YzEyNzJkYmIwXC9kZTRlZnZ0LTI5MWZkY2U4LTdlNmYtNDk0Ny05NmNjLThjNDE2NmQ5M2ZmMi5qcGcifV1dLCJhdWQiOlsidXJuOnNlcnZpY2U6ZmlsZS5kb3dubG9hZCJdfQ.CoMGFQT6e0F37pUnE5pS5ElA1iEMJICyBMuVdwX2d6U" style="width: 100%; height: 100%;">
		</div>
		<div class="mySlides fade">
			<img src="https://wallpaper.dog/large/10825235.jpg" style="width: 100%; height: 100%;">
		</div>
	</div>



	<div style="text-align: center">
		<span class="dot"></span> <span class="dot"></span> <span class="dot"></span>
		<span class="dot"></span> <span class="dot"></span> <span class="dot"></span>
		<span class="dot"></span> <span class="dot"></span> <span class="dot"></span>
		<span class="dot"></span> <span class="dot"></span> <span class="dot"></span>
		<span class="dot"></span> <span class="dot"></span> <span class="dot"></span>
		<span class="dot"></span> <span class="dot"></span> <span class="dot"></span>
	</div>



	<script>
		var slideIndex = 0;
		showSlides();

		function showSlides() {
			var i;
			var slides = document.getElementsByClassName("mySlides");
			var dots = document.getElementsByClassName("dot");
			for (i = 0; i < slides.length; i++) {
				slides[i].style.display = "none";
			}
			slideIndex++;
			if (slideIndex > slides.length) {
				slideIndex = 1
			}
			for (i = 0; i < dots.length; i++) {
				dots[i].className = dots[i].className.replace(" actives", "");
			}
			slides[slideIndex - 1].style.display = "block";
			dots[slideIndex - 1].className += " actives";
			setTimeout(showSlides, 8000); // Change image every 2 seconds
		}
	</script>

	<script language="javascript" type="text/javascript">
	function urltext() {
		var form1.caminho_video.value = form1.btn_file.value;
	}
	function urltext2() {
		var form1.caminho_video.value = form1.btn_file.value;
	}
	</script>
	<% 
	String link = "";
	int at = 0;
	float rate = 0;
	String ti = "";
	String de = "";
	String string1 = "";
	String string2 = "";
	String user = request.getParameter("parametro");
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/vidtek", "root", "EduN1305");
	Statement stat = con.createStatement();
	String select ="SELECT ativo FROM utilizador WHERE username = '" + user + "' ";
	ResultSet rs;
	rs = stat.executeQuery(select);
	if(rs.next()){
		 at = rs.getInt(1);
		if(at == 1){
		    string1 = "adicionar_videodb.jsp?parametro=" + user + "&ativo=" + at + "";
			string2 = "principal.jsp?parametro=" + user + "";
		}
		if(at == 2){
			if(request.getParameter("link") != null)
			{
			   link = request.getParameter("link");
			  rate = Float.parseFloat(request.getParameter("rate"));
			  ti = request.getParameter("titulo");
			  de = request.getParameter("descricao");
				string1 = "adicionar_videodb.jsp?parametro=" + user + "&ativo=" + at + "";
				string2 = "principaladmin.jsp?parametro=" + user + "";
			}
			string1 = "adicionar_videodb.jsp?parametro=" + user + "&ativo=" + at + "";
			string2 = "principaladmin.jsp?parametro=" + user + "";
		}
			
		
		}%>
	<div class="container"><br><br><br><br><br><br>
		<div class="content1">
			<br>
			<div id="registo">
		
				<form method="post" action =<%= string1 %>>
					<% 	if(at == 1){%>
			
				<% }
				else if (at ==2)
				{
			String cm="filmes.jsp?user=" + user + "";
		%><a href =<%=cm %>><img src="https://icons555.com/images/icons-red/image_icon_film_2_pic_512x512.png" width=50px height=50px align=right title="Página dos Filmes"></img></a>				
				<% }%>
					
					<h1>Insira o vídeo</h1>

					<p>
						
											<% 	if(at == 1){%>
							<label>Nome do vídeo</label> <input
							id="nome_vid" name="vid_nome" required="required"
							type="text" placeholder="Vídeo fixolas" />
							<% }
				else if (at ==2 && ti !="")
				{
			%>
			<label>Nome do vídeo</label> <input
							id="nome_vid" name="vid_nome" required="required"
							type="text" value=<%=ti %> readonly/>
			<% }else if(at==2)
			{%>
			<label>Nome do vídeo</label> <input
							id="nome_vid" name="vid_nome" required="required"
							type="text" placeholder="Vídeo fixolas" />
		<%	}%>
					</p>

					<p>
						
					<label>Vídeo</label><input id="btnExplore" name="btn_file" type="file" onclick="urltext()" />
			
						
					</p>
					<p>
							<% 	if(at == 1){%>
							<label>Thumbnail</label><input id="btnExplore2" name="btn_file2" type="file" onclick="urltext()2" />
							<% }
				else if (at ==2 && link !="")
				{
			%><label>Thumbnail</label><input id="btnExplore2" name="btn_file2" type="text" value=<%=link %> readonly/>
			<% }else if(at==2)
			{%>
			<label>Thumbnail</label><input id="btnExplore2" name="btn_file2" type="text" />
		<%	}%>
			
					</p>
					<p>
						<label>Breve descrição</label> 
											<% 	if(at == 1){%>
								<textarea id="desc" name="desc" rows="10" cols="51" maxlength="1000" placeholder="Este video conta uma história acerca de ...."></textarea>
						
							<% }
				else if (at ==2 && ti !="")
				{
			%>
			
								<textarea id="desc" name="desc" rows="10" cols="51" maxlength="1000" placeholder="Este video conta uma história acerca de ...." readonly><%=de %></textarea>
						
			<% }else if(at==2)
			{%>
			
								<textarea id="desc" name="desc" rows="10" cols="51" maxlength="1000" placeholder="Este video conta uma história acerca de ...." ></textarea>
						
		<%	}%>
					</p>
					<%if (at ==2 && rate !=0)
				{
			%>
			<p>
			<label>Rating:</label> 
								 <input
							id="rate" name="rate" required="required"
							type="text" value=<%=rate %> readonly/>
				</p>		
			<%} %>
					<p>
						<input type="submit" value="Inserir" name="submeter" onclick = "validalogin()"/>
					</p>	
					<p class="link">
					
						<a href=<%= string2 %>>Principal</a>  
						</a>&ensp; 
						&ensp;
						&ensp; &ensp; 
						&ensp;
						&ensp; &ensp; 
						&ensp;
						&ensp; &ensp; 
						&ensp;
						&ensp; 
					</p>	
	</form>

			</div>
		</div>
	
</body>
</html>