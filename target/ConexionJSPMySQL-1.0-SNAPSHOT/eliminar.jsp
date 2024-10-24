
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <% 
            String cod=request.getParameter("cod");
            
            Connection cnx=null;
            ResultSet rs=null;
            Statement sta=null;
            
              try{
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    cnx=DriverManager.getConnection
                    ("jdbc:mysql://localhost:3306/CursoJSP?user=root&password=123456");
                     sta=cnx.createStatement();
                     sta.executeUpdate("delete from usuarios where codUsu='"+cod +"'");
                     request.getRequestDispatcher("Listado.jsp").forward(request, response);
                     sta.close();
                     rs.close();
                     cnx.close();
            }catch(Exception e){out.print(e+"");}
          
                %>
    </body>
</html>
