<%-- 
    Document   : editar
    Created on : 10-19-2020, 03:20:34 PM
    Author     : ferna
--%>

<%@page import="java.sql.* "%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Editar</title>
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
         
        <%
            try{
            // trayendo el ID del formulario
            int id = Integer.parseInt(request.getParameter("id")); 
         // ref. al driver de conexion
         Class.forName("com.mysql.jdbc.Driver");
         // cadena de conexion
         Connection myCon = DriverManager.getConnection("jdbc:mysql://localhost:3306/crudpromedio","root","");
         // 2. consulta preparada
         PreparedStatement myStmt = myCon.prepareStatement("select * from promedio where id = ? ");
         // 3. valorea a los parametros
         myStmt.setInt(1,id);
         // 4. ejecutar consulta y recorrerla
         ResultSet myRs = myStmt.executeQuery();
         while(myRs.next()){ 
        %>
        <br><br>
         <center>
        <form class="form-control" style="height:620px; width:500px; background:#06F5F9">
           
        <h1 align="center" style="color:white">Registro de estudiantes</h1>
            <br>
            <table>
                <tr > 
                    ID:
                <input type="text" name="txtid" readonly="readonly" value="<%=myRs.getInt(1)%>" class="form-control" />
                    <br>
                    NOMBRE:
                     <input type="text" name="txtnombre"  value="<%=myRs.getString(2)%>" class="form-control" />
                     <br>
                     APELLIDOS:
                    <input type="text" name="txtapellidos" placeholder="Ingresar apellidos"  class="form-control" value="<%=myRs.getString(3)%>" />
                    <br>
                    UNIDAD:
                    <input type="number" name="txtunidad" placeholder="Ingresar unidad" class="form-control" value="<%=myRs.getInt(4)%>"/>
                    <br> 
                    NOTA 1 :
                    <input type="text" name="txtnota1" placeholder="Ingresar unidad 1" class="form-control" value="<%=myRs.getDouble(5)%>"/>
                    <br>
                    NOTA 2:
                    <input type="text" name="txtnota2" placeholder="Ingresar unidad 2" class="form-control" value="<%=myRs.getDouble(6)%>" />
                    <br> 
                    <input type="submit" name="btneditar" value="Editar datos" class="btn btn-danger btn-sm">
                    <br><br>
                    <a href="index.jsp">Regresar</a>
                </tr>
            </table>    
        </center>
        </form> 
                    <%
                    }
                      }catch(Exception exc){
                         exc.printStackTrace();
                        } 
                    %> 
    </body>
</html>

<%
    if(request.getParameter("btneditar") != null){
        try{
        // valores desde el formulario
        int id = Integer.parseInt(request.getParameter("txtid"));
        String nombre = request.getParameter("txtnombre");
        String apellidos = request.getParameter("txtapellidos");
        int unidad = Integer.parseInt(request.getParameter("txtunidad"));
        double nota1 = Double.parseDouble(request.getParameter("txtnota1"));
        double nota2 = Double.parseDouble(request.getParameter("txtnota2"));
        double promedio = (nota1 + nota2) / 2;
     // ref. al driver
     Class.forName("com.mysql.jdbc.Driver");
     // 1. cadena de conexion
     Connection myCon = DriverManager.getConnection("jdbc:mysql://localhost:3306/crudpromedio","root","");
     // 2.
     PreparedStatement myStmt = myCon.prepareStatement(" update promedio set nombre = ?, apellidos = ?, unidad = ?, nota1 = ?, nota2 = ? , promedio = ? where id = ? ");
     // 3. valor a los parametros
     myStmt.setString(1,nombre);
     myStmt.setString(2,apellidos);
     myStmt.setInt(3,unidad);
     myStmt.setDouble(4,nota1);
     myStmt.setDouble(5,nota2);
     myStmt.setDouble(6,promedio);
     myStmt.setInt(7,id);
     // 4. ejecutar consulta
     myStmt.executeUpdate();
     out.println("Datos editados");
     request.getRequestDispatcher("index.jsp").forward(request, response);
        }
     catch(Exception exc){
        exc.printStackTrace();
        }   
    }
%>