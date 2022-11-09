<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@ page import = "java.io.*,java.util.*,javax.mail.*"%>
<%@ page import = "javax.mail.internet.*,javax.activation.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>

<%
String user = request.getParameter("username");
String pass = request.getParameter("password");
String nome = request.getParameter("nome");
String email = request.getParameter("email");
int a=0;
//conexão à base de dados
	Class.forName("com.mysql.cj.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/vidtek", "root", "EduN1305");
		Statement stat = con.createStatement();
		ResultSet rset;
		rset = stat.executeQuery("select * from utilizador where username ='" + user + "' or email='" + email +"'");

		if(rset.next()) {
			%>
<script type="text/javascript">
					alert("Username ou email já utilizado!");
					window.location="registo.jsp";
			</script>
<%
} else {
int i = stat.executeUpdate("insert into utilizador (username, password, nome, email, ativo) values('" + user + "','"
		+ pass + "','" + nome + "','" + email + "',0)");

if (i > 0) {
	String result;
	// code of sending email
	String host = "smtp.gmail.com";
	String from = "vidtekejr@gmail.com";
	//Sender's email ID needs to be mentioned
	String password ="ejrvidtek";
	// Recipient's email ID needs to be mentioned.
	String to = email;



	// Get system properties
	Properties properties = System.getProperties();
	// Setup mail server
	properties.put("mail.smtp.starttls.enable", "true");
	properties.put("mail.smtp.host", host);
	properties.put("mail.smtp.user", from);
	properties.put("mail.smtp.password", password);
	properties.put("mail.smtp.port", "587");
	properties.put("mail.smtp.auth", "true");

	// Get the default Session object.
	Session sess = Session.getDefaultInstance(properties);

	try{
	 // Create a default MimeMessage object.
	 MimeMessage message = new MimeMessage(sess);

	 // Set From: header field of the header.
	 message.setFrom(new InternetAddress(from));

	 // Set To: header field of the header.
	 message.addRecipient(Message.RecipientType.TO,
	                          new InternetAddress(to));

	 // Set Subject: header field
	 message.setSubject("Email de Confirmação | VidTek");

	 // Now set the actual message
	 message.setContent("<html><h1>Bem vindo à equipa VidTek,</h1><br> <h4>O link abaixo vai redirecioná-lo de volta para o nosso website onde poderá fazer o login e começar a desfrutar da sua videoteca pessoal e da nossa ampla videoteca com uma vasta gama de vídeos sempre ao seu dispor. :)</h4> <br><br><a href='http://localhost:8080/Trabalhos/ativardb.jsp?user=" + user + "'>Clique neste link para confirmar o seu registo</a></html>", "text/html");

	 // Send message
	 Transport transport = sess.getTransport("smtp");
	 transport.connect(host, from, password);
	 transport.sendMessage(message, message.getAllRecipients());
	 transport.close();
	 result = "Sent message successfully....";
	 } catch (MessagingException mex) {
	    mex.printStackTrace();
	    result = "Error: unable to send message...." + mex;
	 }
	// ends here code to send email
	response.sendRedirect("ativo.jsp"); 
	} 
    else {
	response.sendRedirect("registo.jsp");
}
}
%>
