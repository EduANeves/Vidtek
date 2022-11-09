<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*"%>
    
<%
    String user = request.getParameter("parametro");
    int id = Integer.parseInt(request.getParameter("video"));
    int tipo = Integer.parseInt(request.getParameter("tipo"));
    int id_p = 0;
    //conexão à base de dados
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/vidtek", "root", "EduN1305");
    Statement stat = con.createStatement();
    if (tipo == 1) {
    	ResultSet rs1;
    	rs1 = stat.executeQuery("select * from partilha where  id_videopessoal ='" + id + "'");
    	if (rs1.next()) {
    		id_p = rs1.getInt(1);
    	}
    	int z = stat.executeUpdate("delete from comentario_videopessoal where  Id_videopessoal=" + id_p + "");
    	if (z > 0) {
    	}
    	int x = stat.executeUpdate("delete from partilha_utilizador where id_partilha=" + id_p + "");
    	if (x > 0) {

    		int p = stat.executeUpdate("delete from partilha where id_videopessoal=" + id + "");
    		if (p > 0) {
    	int u = stat.executeUpdate("delete from videopessoal_genero where id_videopessoal=" + id + "");
    	if (u > 0) {

    		int i = stat.executeUpdate("delete from videopessoal_interveniente where id_videopessoal=" + id + "");
    		if (i > 0) {

    			int t = stat.executeUpdate("delete from videopessoal where id_videopessoal=" + id + "");
    			if (t > 0) {

    				response.sendRedirect("principal.jsp?parametro=" + user + "");
    			}

    		} else {
    			int t = stat.executeUpdate("delete from videopessoal where id_videopessoal=" + id + "");
    			if (t > 0) {

    				response.sendRedirect("principal.jsp?parametro=" + user + "");
    			}
    		}
    	}
    		} else {
    	int u = stat.executeUpdate("delete from videopessoal_genero where id_videopessoal=" + id + "");
    	if (u > 0) {

    		int i = stat.executeUpdate("delete from videopessoal_interveniente where id_videopessoal=" + id + "");
    		if (i > 0) {

    			int t = stat.executeUpdate("delete from videopessoal where id_videopessoal=" + id + "");
    			if (t > 0) {

    				response.sendRedirect("principal.jsp?parametro=" + user + "");
    			}

    		} else {
    			int t = stat.executeUpdate("delete from videopessoal where id_videopessoal=" + id + "");
    			if (t > 0) {

    				response.sendRedirect("principal.jsp?parametro=" + user + "");
    			}
    		}
    	} else {

    		int i = stat.executeUpdate("delete from videopessoal_interveniente where id_videopessoal=" + id + "");
    		if (i > 0) {

    			int t = stat.executeUpdate("delete from videopessoal where id_videopessoal=" + id + "");
    			if (t > 0) {

    				response.sendRedirect("principal.jsp?parametro=" + user + "");
    			}

    		} else {
    			int t = stat.executeUpdate("delete from videopessoal where id_videopessoal=" + id + "");
    			if (t > 0) {

    				response.sendRedirect("principal.jsp?parametro=" + user + "");
    			}
    		}
    	}
    		}

    	} else {

    		int p = stat.executeUpdate("delete from partilha where id_videopessoal=" + id + "");
    		if (p > 0) {
    	int u = stat.executeUpdate("delete from videopessoal_genero where id_videopessoal=" + id + "");
    	if (u > 0) {

    		int i = stat.executeUpdate("delete from videopessoal_interveniente where id_videopessoal=" + id + "");
    		if (i > 0) {

    			int t = stat.executeUpdate("delete from videopessoal where id_videopessoal=" + id + "");
    			if (t > 0) {

    				response.sendRedirect("principal.jsp?parametro=" + user + "");
    			}

    		} else {
    			int t = stat.executeUpdate("delete from videopessoal where id_videopessoal=" + id + "");
    			if (t > 0) {

    				response.sendRedirect("principal.jsp?parametro=" + user + "");
    			}
    		}
    	}
    		} else {
    	int u = stat.executeUpdate("delete from videopessoal_genero where id_videopessoal=" + id + "");
    	if (u > 0) {

    		int i = stat.executeUpdate("delete from videopessoal_interveniente where id_videopessoal=" + id + "");
    		if (i > 0) {

    			int t = stat.executeUpdate("delete from videopessoal where id_videopessoal=" + id + "");
    			if (t > 0) {

    				response.sendRedirect("principal.jsp?parametro=" + user + "");
    			}

    		} else {
    			int t = stat.executeUpdate("delete from videopessoal where id_videopessoal=" + id + "");
    			if (t > 0) {

    				response.sendRedirect("principal.jsp?parametro=" + user + "");
    			}
    		}
    	} else {

    		int i = stat.executeUpdate("delete from videopessoal_interveniente where id_videopessoal=" + id + "");
    		if (i > 0) {

    			int t = stat.executeUpdate("delete from videopessoal where id_videopessoal=" + id + "");
    			if (t > 0) {

    				response.sendRedirect("principal.jsp?parametro=" + user + "");
    			}

    		} else {
    			int t = stat.executeUpdate("delete from videopessoal where id_videopessoal=" + id + "");
    			if (t > 0) {

    				response.sendRedirect("principal.jsp?parametro=" + user + "");
    			}
    		}
    	}
    		}
    	}
    } else if (tipo == 2) {
    	int d = stat.executeUpdate("delete from comentario_videoadmin where Id_video = " + id + "");
    	if(d>0){
    	
    		int u = stat.executeUpdate("delete from videoadmin_genero where id_video=" + id + "");
        	if (u > 0) {

        		int i = stat.executeUpdate("delete from videoadmin_interveniente where id_video=" + id + "");
        		if (i > 0) {

        	int t = stat.executeUpdate("delete from videoadmin where id_video=" + id + "");
        	if (t > 0) {

        		response.sendRedirect("principaladmin.jsp?parametro=" + user + "");
        	}

        		} else {
        	int t = stat.executeUpdate("delete from videoadmin where id_video=" + id + "");
        	if (t > 0) {

        		response.sendRedirect("principaladmin.jsp?parametro=" + user + "");
        	}
        		}
        	} else {

        		int i = stat.executeUpdate("delete from videoadmin_interveniente where id_video=" + id + "");
        		if (i > 0) {

        	int t = stat.executeUpdate("delete from videoadmin where id_video=" + id + "");
        	if (t > 0) {

        		response.sendRedirect("principaladmin.jsp?parametro=" + user + "");
        	}

        		} else {
        	int t = stat.executeUpdate("delete from videoadmin where id_video=" + id + "");
        	if (t > 0) {

        		response.sendRedirect("principaladmin.jsp?parametro=" + user + "");
        		}
        	}	
    	}
    }else{
		int u = stat.executeUpdate("delete from videoadmin_genero where id_video=" + id + "");
    	if (u > 0) {

    		int i = stat.executeUpdate("delete from videoadmin_interveniente where id_video=" + id + "");
    		if (i > 0) {

    	int t = stat.executeUpdate("delete from videoadmin where id_video=" + id + "");
    	if (t > 0) {

    		response.sendRedirect("principaladmin.jsp?parametro=" + user + "");
    	}

    		} else {
    	int t = stat.executeUpdate("delete from videoadmin where id_video=" + id + "");
    	if (t > 0) {

    		response.sendRedirect("principaladmin.jsp?parametro=" + user + "");
    	}
    		}
    	} else {

    		int i = stat.executeUpdate("delete from videoadmin_interveniente where id_video=" + id + "");
    		if (i > 0) {

    	int t = stat.executeUpdate("delete from videoadmin where id_video=" + id + "");
    	if (t > 0) {

    		response.sendRedirect("principaladmin.jsp?parametro=" + user + "");
    	}

    		} else {
    	int t = stat.executeUpdate("delete from videoadmin where id_video=" + id + "");
    	if (t > 0) {

    		response.sendRedirect("principaladmin.jsp?parametro=" + user + "");
    		}
    	}	
	}}
    }
    %>