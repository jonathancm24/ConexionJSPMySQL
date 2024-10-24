<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1 align="center" >Listado de Usuarios</h1>
        <table border="1" width="600" align="center">
            <tr bgcolor="skyblue">
                <th colspan="5">Mantenimiento de Usuarios</th>
                <th>
                    <a href="nuevo.jsp">
                    <img src="Iconos/Nuevo.png" width="50" height="50"></a></th>
            </tr>
            <tr bgcolor="skyblue">
                <th>Codigo</th>
                <th>Nombre</th>
                <th>Edad</th>
                <th>Sexo</th>
                <th>Password</th>
                <th>Accion</th>
            </tr>
            <%
                
                Connection cnx=null;
                Statement sta=null;
                ResultSet rs=null;
                
                try{
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    cnx=DriverManager.getConnection
                    ("jdbc:mysql://localhost:3306/CursoJSP?user=root&password=123456");
                    
                    
                sta=cnx.createStatement();
                rs=sta.executeQuery("SELECT * FROM usuarios");
                while(rs.next()){
                %>
                <tr>
                    <th><%=rs.getString(1)%></th>
                    <th><%=rs.getString(2)%></th>
                    <th><%=rs.getString(3)%></th>
                    <th><%=rs.getString(4)%></th>
                    <th><%=rs.getString(5)%></th>
                    <th>
                        <a href="editar.jsp?cod=<%=rs.getString(1)%>">
                        <img src="Iconos/editar.PNG" width="30" height="30"> 
                        </a>
                        ||
                        <a href="eliminar.jsp?cod=<%=rs.getString(1)%>">
                        <img src="Iconos/eliminar.png" width="30" height="30">
                        </a>
                    </th>
                </tr>
                 <%
                }
                sta.close();
                rs.close();
                cnx.close();
                }catch(Exception e){}
                %>
        </table>
    </body>
</html>
