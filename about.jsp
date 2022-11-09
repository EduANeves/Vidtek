<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.Random"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="STYLESHEET" type="text/css" href="main.css">
<link rel="STYLESHEET" type="text/css" href="csstab.css">
<title>VidTek | Your personal video library </title>
<script type="text/javascript">
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
}

#displayed {
	display: flex;
	justify-content: center;
}
</style>
</head>
<body>
	<div class="principal">
		<div class="div2">
<div class="logo"><%
Random random = new Random();
int a = random.nextInt(4);

if(a == 0){%>
<a href="index.jsp"><img src="../Trabalhos/logo/Vid1.PNG" width=100% height=100%></a><% } else if(a==1){ %>
<a href="index.jsp"><img src="../Trabalhos/logo/vid2.PNG" width=100% height=100%></a><%} else if(a==2){ %>
<a href="index.jsp"><img src="../Trabalhos/logo/vid3.PNG" width=100% height=100%></a><%} else if(a==3){%>
<a href="index.jsp"><img src="../Trabalhos/logo/vid4.PNG" width=100% height=100%></a><%} %>

</div>
<div class="button">
<nav class="drown" float=righ>
<ul>
<li><a href="login.jsp">Login</a></li>
</ul>
</nav>
</div>
</div>
	<div class="div1">
		<br> <br> <br>
		<center>
			<font color=white size=40>Who and Why</font>
		</center>
		<br> <br>
		<center>
			<font color=white size=5> In this Page you will be able to
				learn more about the creators of Vidtek and what motivated us to
				create this project</font>
		</center>
		<br> <br> <br> <br>
		<center>
			<center>
				<button class="tablink" onclick="openPage('Home', this, 'red')">Quem
					Somos</button>
				<button class="tablink" onclick="openPage('News', this, 'green')"
					id="defaultOpen">Projeto VidTek</button>
			</center>

			<div id="Home" class="tabcontent">
				<h3>Desenvolvedores</h3>
				<p>Quem Somos</p>
				<br> <br> <br>

				<div>
					<p class="pMain">
						<img src="../Trabalhos/logo/logo.png"
							style="float: left; margin-right: 15px; width: 20%; height: 20%; border-radius: 50%;">
						<br>
						<br>
						<br> O Eduardo Neves é um aluno da Universidade Lusófona do
						Porto.<br> Pertencen ao curso de Engenharia de Informática e
						tem como sonho ser programador profissional. <br>
						<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
					</p>

				</div>
				<br><br><br>
				<div>
					<p class="pMain">
						<img
							src="https://e7.pngegg.com/pngimages/109/994/png-clipart-teacher-student-college-school-education-avatars-child-face-thumbnail.png"
							style="float: left; margin-right: 15px; width: 20%; height: 20%; border-radius: 50%;">
						<br>
						<br>
						<br> O João Moreira é um aluno da Universidade Lusófona do
						Porto.<br> Pertencen ao curso de Engenharia de Informática e
						tem como sonho ser programador profissional. <br>
						<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
					</p>

				</div>
				<br><br><br>
				<div>
					<p class="pMain">
						<img
							src="https://cdn.pixabay.com/photo/2016/11/18/23/38/child-1837375_960_720.png"
							style="float: left; margin-right: 15px; width: 20%; height: 20%;">
						<br>
						<br>
						<br> O Ricardo Neves é um aluno da Universidade Lusófona do
						Porto.<br> Pertencen ao curso de Engenharia de Informática e
						tem como sonho ser programador profissional.
					</p>
				</div>

			</div>

			<div id="News" class="tabcontent">
				<h3>Projeto Vidtek</h3>
				<p>O seu Sistema de Videoteca Pessoal!</p>
				<br>
				<br>
				<br>

				<div>

					<p>Com o andar dos tempos e a evolução das tecnologias, vários
						negócios e empresas que eram fundadas sobre o alugamento de
						filmes, séries ou outro tipo de vídeos perderam a sua popularidade
						e acabaram por perder para a concorrência que se adaptou há
						evolução das tecnologias.</p>
					<br>
					<p>A empresa RetroV não foi excessão e encontrou-se facilmente
						numa situação pouco desejada. Dado que esta não tinha nenhuma
						maneira de disponibilizar a sua vasta gama de vídeos para os seus
						clientes que agora não os alugavam na loja, esta facilmente perdeu
						a popularidade ao ponto que mais ninguem usufruia dos seus
						serviços.</p>
					<br>
					<p>Esta, para resolver o problema que lhes surgiu, decidiu
						contratar uma equipa para desenvolver um sistema que lhes desse a
						oportunidade de disponiblizar para os seus futuros utilizadores
						toda a game de videos que possuia e ainda, para melhorarem os seus
						serviços, proporcionar a oportunidade de cada utilizador podr
						criar a sua videoteca pessoal e fazer a gestão desta como estes
						bem queiram.</p>
					<br>
					<p>Quando nos deparamos sobre este problema e o pedido de ajuda
						da empresa RetroV, concordamos em desenvolver para esta um sistma
						que cumprisse todos os seus requisitos de forma a não só ajudar
						esta a combater o problema que tinha, mas também para proporcionar
						um desafio nas nossas carreiras de programadores.</p>
					<br>

					<div>
						<img src="../Trabalhos/logo/logo.png" width=10% height=10%
							style="border-radius: 50%;"> <img
							src="https://e7.pngegg.com/pngimages/109/994/png-clipart-teacher-student-college-school-education-avatars-child-face-thumbnail.png"
							width=10% height=10% style="border-radius: 50%;"> <img
							src="https://cdn.pixabay.com/photo/2016/11/18/23/38/child-1837375_960_720.png"
							width=10% height=10% style="border-radius: 50%;">

					</div>
					<p>Sendo assim, junto com a RetroV, nós os três demos inicio ao
						projeto VidTek.</p>
					<p>O objetivo principal do projeto é construir um sistema,
						denominado de sistema VidTek, que permitirá que o utilizador crie
						uma videoteca pessoal, proporcionando funcionalidades de forma a o
						ajudar a fazer a gestão desta, de uma forma livre e que respeite a
						privacidade do mesmo. Tendo em consideração este objetivo, para
						além da capacidade de todos os utilizadores poderem criar a sua
						videoteca pessoal, estes podem mudar informações dos vídeos que
						contêm nesta, tais como a edição do título, tipo, género ou outra
						informação relativa ao vídeo. O sistema também dará ao utilizador
						a liberdade de aceder há videoteca VidTek, disponível a todos os
						utilizadores de forma a proporcionar uma melhor experiência a
						todos.</p>
					<p>O que se encontra disponivel a você que está a ler esta
						página é a versão final do projeto VidTek que foi criado e
						desenvolvido com o objetivo de proporcionar ao utilizador a melhor
						experiência possivel na gestão e visualização de qualquer video
						que deseje.</p>
					<p>Se tiver alguma pergunta sobre o projeto VidTek pode-nos
						contactar pelo e-mail que se apresenta em baixo.</p>
					<p>Obrigado por fazer parte da nossa comunidade.</p>

					<div class="border">
						<p>
							<img
								src="http://stagewp.sharethis.com/wp-content/uploads/2017/05/Email.png"
								width=10% height=10% style="border-radius: 50%;">
							vidtek@gmail.com
						</p>
					</div>
				</div>

			</div>
	</div>
	</div>
</body>
</html>