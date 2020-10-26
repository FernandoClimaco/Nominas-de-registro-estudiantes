<%-- 
    Document   : insertar
    Created on : 10-19-2020, 01:41:49 PM
    Author     : ferna
--%>

<%@page import="java.sql.* "%>
<%@page import="java.sql.DriverManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Insertar datos</title>
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <center> 
            <br><br>
        <form class="form-control" style="height:600px; width:500px; background:#B533FF">
            <br><br>
            
        <h1 align="center" style="color:white">Registro de estudiantes</h1>
            <br>
            <table>
                <tr > 
                    <input type="text" name="txtnombre" placeholder="Ingresar nombre" class="form-control" />
                     <br>
                    <input type="text" name="txtapellidos" placeholder="Ingresar apellidos" class="form-control"/>
                    <br>
                    <input type="number" name="txtunidad" placeholder="Ingresar unidad" class="form-control"/>
                    <br> 
                    <input type="text" name="txtnota1" placeholder="Ingresar unidad 1" class="form-control"/>
                    <br>
                    <input type="text" name="txtnota2" placeholder="Ingresar unidad 2" class="form-control"/>
                    <br>
                     
                    <input type="submit" name="btnGuardar" value="Guardar datos" class="btn btn-danger btn-sm">
                    <br><br>
                    <a href="index.jsp">Regresar</a>
                </tr>
            </table>    
        </center>
        </form>
    </body>
</html>

<%
    if(request.getParameter("btnGuardar")!=null){
  //  try{
        // variables del formulario insertar
        int id = 0;
        String nombre = request.getParameter("txtnombre");
        String apellido = request.getParameter("txtapellidos");
        int unidad = Integer.parseInt(request.getParameter("txtunidad"));
        double nota1 = Double.parseDouble(request.getParameter("txtnota1"));
        double nota2 = Double.parseDouble(request.getParameter("txtnota2"));
        double promedio = (nota1+nota2) /2 ;
        
    // ref. al driver de conexion
    Class.forName("com.mysql.jdbc.Driver");
    // 1. cadena de conexion
    Connection myCon = DriverManager.getConnection("jdbc:mysql://localhost:3306/crudpromedio","root","");
    // 2. consulta preparada
    PreparedStatement myStmt = myCon.prepareStatement("insert into promedio values(?,?,?,?,?,?,?)");
    // 3. valor a los parametros
    myStmt.setInt(1,id);
    myStmt.setString(2,nombre);
    myStmt.setString(3,apellido);
    myStmt.setInt(4,unidad);
    myStmt.setDouble(5,nota1);
    myStmt.setDouble(6,nota2);
    myStmt.setDouble(7,promedio);
    // 4. ejecutar consulta
    myStmt.executeUpdate();
    out.println("los datos han sido insertados");
    request.getRequestDispatcher("index.jsp").forward(request, response);

    /* }catch(Exception exc){
     exc.printStackTrace();
    } */
    }
%>