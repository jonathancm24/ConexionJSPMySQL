    
<%@page import="java.sql.*"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h2 align="center">Registro de usuarios</h2>
        <form action="">
            <table border="1" width="250" align="center">
                <tr>
                    <td>Codigo: </td>
                    <td><input type="text" name="txtCod"></td>
                </tr>
                <tr>
                    <td>Nombre: </td>
                    <td><input type="text" name="txtNom"></td>
                </tr>
                <tr>
                    <td>Edad: </td>
                    <td><input type="text" name="txtEdad"></td>
                </tr>
                <tr> 
                    <td>Sexo: </td>
                    <td><input type="text" name="txtSex"></td>
                </tr>
                <tr> 
                    <td>Password: </td>
                    <td><input type="text" name="txtPas"></td>
                </tr>
                <tr>
                    <th colspan="2">
                        <input type="submit" name="btnGrabar"
                               value="Grabar Usuario">
                    </th>
                </tr>               
            </table>
        </form>
        <%
            if(request.getParameter("btnGrabar")!=null){
            String cod=request.getParameter("txtCod");
            String nom=request.getParameter("txtNom");
            int edad=Integer.parseInt(request.getParameter("txtEdad"));
            String sexo=request.getParameter("txtSex");
            String pas=request.getParameter("txtPas");
            
            Connection cnx=null;
            ResultSet rs=null;
            Statement sta=null;
            
              try{
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    cnx=DriverManager.getConnection
                    ("jdbc:mysql://localhost:3306/CursoJSP?user=root&password=123456");
                    sta=cnx.createStatement();
                    sta.executeUpdate("insert into usuarios value('"+cod+"','"+nom+"','"+edad+"','"+sexo+"','"+pas+"')");
                    request.getRequestDispatcher("Listado.jsp").forward(request, response);
                    sta.close();
                    rs.close();
                    cnx.close();
            }catch(Exception e){out.print(e+"");}
            }
            
                %>
            
        
    </body>
</html>
