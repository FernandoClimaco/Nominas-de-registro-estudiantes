<%-- 
    Document   : eliminar
    Created on : 10-19-2020, 02:38:44 PM
    Author     : ferna
--%>

<%@page import="java.sql.* "%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
         // obteniendo el valor del parametro
            int id = Integer.parseInt(request.getParameter("id"));
            try{
        // 1.cadena de conexion
        Connection myCon = DriverManager.getConnection("jdbc:mysql://localhost:3306/crudpromedio","root","");
        // 2. consulta preparada
        PreparedStatement myStmt = myCon.prepareStatement("delete from promedio where id = ? ");
        // 3. valor al parametro
        myStmt.setInt(1,id);
        // 4. ejecutar consulta
        myStmt.executeUpdate();
        out.println("datos eliminados");
        request.getRequestDispatcher("index.jsp").forward(request, response);
            }catch(Exception exc){
            exc.printStackTrace();
            }
        
        %>
    </body>
</html>
