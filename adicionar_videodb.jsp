<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*"%>
    
<%
String link = "";

float rate = 0;
String ti = "";
String de = "";
String user = request.getParameter("parametro"); 
int at = Integer.parseInt(request.getParameter("ativo"));
String vid_nome = request.getParameter("vid_nome"); 
String btn_file = request.getParameter("btn_file"); 
String btn_file2 = request.getParameter("btn_file2"); 
String descricao = request.getParameter("desc"); 
String dataAtual = new java.text.SimpleDateFormat("yyyy/MM/dd").format(new java.util.Date());
String Hora = new java.text.SimpleDateFormat("HH:mm:ss").format(new java.util.Date());
if(at==2)
{
	if(request.getParameter("rate") != null)
	{

	  rate = Float.parseFloat(request.getParameter("rate"));

	 
	}
}
int a=0;
int id=0;
String loc = "adicionar_video.jsp?parametro=" + user + "&ativo=" + at + "";
//conexão à base de dados
	Class.forName("com.mysql.cj.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/vidtek", "root", "EduN1305");
		Statement stat = con.createStatement();
		if(at == 1){
		ResultSet rset;
		rset = stat.executeQuery("select * from videopessoal where nome ='" + vid_nome +"' and username = '" + user + "'");
		if(rset.next()) {
			out.println(loc);
			%>
		<script type="text/javascript">
					alert("O nome do video já foi utilizado!");
					window.location=<%= loc%>;<% 	out.println("fuick");%>
			</script>
			<%
			response.sendRedirect(loc);
		
		} 
		else 
		{
			
			int i = stat.executeUpdate(" insert into videopessoal(username,nome,url,data,hora,urlimagem,descricao)  values ('" + user +"','" + vid_nome +"','" + btn_file +"','" + dataAtual +"','" + Hora +"','" + btn_file2 +"','" + descricao +  "')");

			if (i > 0) {
				ResultSet rs;
				rs = stat.executeQuery("select id_videopessoal from videopessoal where nome ='" + vid_nome +"' and username = '" + user + "'");
				rs.next();
				id= rs.getInt("id_videopessoal");
				response.sendRedirect("adicionar_interveniente.jsp?parametro=" + user +"&video=" + id + "&ativo=" + at + ""); }
			
			
		}
	} else if (at == 2){
		ResultSet rst;
		rst = stat.executeQuery("select * from videoadmin where nome ='" + vid_nome +"' and username_admin = '" + user + "'");
		if(rst.next()) {
			out.println(loc);
			%>
		<script type="text/javascript">
					alert("O nome do video já foi utilizado!");
					window.location=<%= loc%>;<% 	out.println("fuick");%>
			</script>
			<%
			response.sendRedirect(loc);
		
		} 
		else 
		{
			
			int i = stat.executeUpdate(" insert into videoadmin(username_admin,nome,url,data,hora,urlimagem,descricao,n_view,rate)  values ('" + user +"','" + vid_nome +"','" + btn_file +"','" + dataAtual +"','" + Hora +"','" + btn_file2 +"','" + descricao +  "',0," + rate +")");

			if (i > 0) {
				ResultSet sr;
				sr = stat.executeQuery("select id_video from videoadmin where nome ='" + vid_nome +"' and username_admin = '" + user + "'");
				sr.next();
				id= sr.getInt("id_video");
				response.sendRedirect("adicionar_interveniente.jsp?parametro=" + user +"&video=" + id + "&ativo=" + at + ""); }
		}
	}
%>