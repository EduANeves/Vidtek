    <%@ page import="java.sql.*"%>
    <%Class.forName("com.mysql.cj.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/vidtek", "root", "EduN1305");
	Statement stat = con.createStatement();
	String user = request.getParameter("parametro");
	int id = Integer.parseInt(request.getParameter("video"));
	int tipo = Integer.parseInt(request.getParameter("tipo"));
	String desc = request.getParameter("come");
	if(tipo == 1){
	int i = stat.executeUpdate(" update videopessoal set descricao='" + desc + "' where id_videopessoal = " + id +"");

	if (i > 0) {
		ResultSet rs;
		response.sendRedirect("alterarvideo.jsp?parametro=" + user +"&video=" + id  + "&tipo=" + tipo + ""); }
	
	}
	else if(tipo == 2)
	{
		int i = stat.executeUpdate(" update videoadmin set descricao='" + desc + "' where id_video = " + id +"");

		if (i > 0) {
			ResultSet rs;
			response.sendRedirect("alterarvideo.jsp?parametro=" + user +"&video=" + id  + "&tipo=" + tipo + ""); }
		
	}

	%>