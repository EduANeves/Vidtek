<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.util.Random"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="STYLESHEET" type="text/css" href="main.css">
<title>VidTek | Your personal video library</title>
 
</head>
<body >
<div class="principal">
<div class="div2">
		<div class="logo"><%
			Random random = new Random();
			int a = random.nextInt(4);
			
			if(a == 0){%>
				<a href="principal.jsp"><img src="../Trabalhos/logo/Vid1.PNG" width=100% height=100%></a><% } else if(a==1){ %>
				<a href="principal.jsp"><img src="../Trabalhos/logo/vid2.PNG" width=100% height=100%></a><%} else if(a==2){ %>
				<a href="principal.jsp"><img src="../Trabalhos/logo/vid3.PNG" width=100% height=100%></a><%} else if(a==3){%>
				<a href="principal.jsp"><img src="../Trabalhos/logo/vid4.PNG" width=100% height=100%></a><%} %>
					
			</div>
	<div class="button">
        <nav class="drown" float=righ>
            <ul>
                <li><a href="about.jsp">About</a></li>
                <li><a href="login.jsp">Login</a></li>
            </ul>
        </nav>
   </div>
</div>
<div class="div1">
<br> <br> <br>
<center><font color=white size=40>Bem-vindo à VidTek</font></center>
<br> <br>
<center><font color=white size=5> Cria a tua videoteca e junta-te a nós, explora e partilha vídeos com a comunidade VidTek!</font></center>
<br> <br> <br> <br>
<center>
<div class = "centro">
<!--Começo do slider de imagem-->
    <div class="slider">
      <div class="slides">
        <!--Começo radio buttons-->
        <input type="radio" name="radio-btn" id="radio1">
        <input type="radio" name="radio-btn" id="radio2">
        <input type="radio" name="radio-btn" id="radio3">
        <input type="radio" name="radio-btn" id="radio4">
        <!--Fim radio buttons-->
        <!--Começo slider images-->
        <div class="slide first">
          <img src="https://i.pinimg.com/originals/9b/88/b5/9b88b56b4c9c116eb26f3607f229f766.jpg" alt="">
        </div>
        <div class="slide">
          <img src="https://images6.alphacoders.com/110/1100296.jpg" alt="">
        </div>
        <div class="slide">
          <img src="https://www.wallpapertip.com/wmimgs/42-426811_thing-movie-poster.jpg" alt="">
        </div>
        <div class="slide">
          <img src="https://wallpaper.dog/large/10825235.jpg" alt="">
        </div>
        <!--Fim slide images-->
        <!--Começo navegação automática-->
        <div class="navigation-auto">
          <div class="auto-btn1"></div>
          <div class="auto-btn2"></div>
          <div class="auto-btn3"></div>
          <div class="auto-btn4"></div>
        </div>
        <!--Fim navegação automática-->
      </div>
      <!--Começo navegação manual manual-->
      <div class="navigation-manual">
        <label for="radio1" class="manual-btn"></label>
        <label for="radio2" class="manual-btn"></label>
        <label for="radio3" class="manual-btn"></label>
        <label for="radio4" class="manual-btn"></label>
      </div>
      <!--Fim navegação manual-->
    </div>
    <!--Fim slider imagens-->

    <script type="text/javascript">
    var counter = 1;
    setInterval(function(){
      document.getElementById('radio' + counter).checked = true;
      counter++;
      if(counter > 4){
        counter = 1;
      }
    }, 5000);
    </script>
    
    
</div>
</center>
    <hr width = 90% size = 3px color = #808080></hr>
    <div class = "Juaom"> 
    <div class = "Esq">
    <center>
    <font size = 3 color = #fff class = "centro">Cria a tua primeira videoteca</font>
    </center>
     </div>
      <div class ="Dir">
      <center>
      <img src = "https://i.redd.it/hc9o873rh8d31.png" width = 30% height =30%>
      </center>
      </div>
    </div>
    <hr width = 90% size = 3px color = #808080></hr>
    <div class = "Juaom">
    <div class ="Esq">
      <center>
      <img src = "https://i.pinimg.com/originals/7e/bf/e0/7ebfe012ac98b6edc1bddbc1c7daff5e.jpg" width = 30% height =30%>
      </center>
      </div> 
    <div class = "Dir">
    <center>
    <font size = 3 color = #fff class = "centro"> Partilha com a tua família e amigos</font>
    </center>
     </div> 
    </div>
    <hr width = 90% size = 3px color = #808080></hr>
    <div class = "Juaom"> 
    <div class = "Esq">
    <center>
    <font size = 3 color = #fff class = "centro"> Assiste aos filmes e séries que quiseres</font>
    </center>
     </div>
      <div class ="Dir">
      <center>
      <img src = "https://i.ytimg.com/vi/StSn6_Jzn0A/hqdefault.jpg" width = 30% height =30%>
      </center>
      </div>
    </div>
    <hr width = 90% size = 3px color = #808080></hr>
    <center>
   <div class ="centro">
    <nav class="drown" float = center>
            <ul>
                <li><a href="registo.jsp">Sign Up</a></li>
            </ul>
        </nav>
      </div>  
    </center>
</div>
</div>
</body>
</html>