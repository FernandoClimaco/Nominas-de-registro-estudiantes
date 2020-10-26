<%-- 
    Document   : index
    Created on : 10-18-2020, 07:00:39 PM
    Author     : ferna
--%>

<%@page import="java.sql.* "%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        
       
        <h1 align="center">Nominas de registro estudiantes</h1>
        <hr>
         <a href="insertar.jsp" class="btn btn-success btn-sm" style="width:200px">Registrar estudiante</a>
         <br>
         <br>
         <form>
             <table>
                 <tr>
                     <td> <input type="submit" value="Buscar por nombre"/> </td>
                 </tr> 
             </table> 
             
         </form>
         
         
         <br><br>
          <center> 
            <table class="tab table-bordered" style="width:1100px; height:250px ">
                
                <tr> 
                        <td class="text-center"> ID: </td>   
                        <td class="text-center"> Nombre: </td>   
                        <td class="text-center"> Apellidos: </td>  
                        <td class="text-center"> Unidad: </td>  
                        <td class="text-center"> Nota 1:  </td> 
                        <td class="text-center"> Nota 2:  </td>
                        <td class="text-center"> Promedio: </td>
                        <td class="text-center"> Acciones: </td> 
                </tr>  
                  <%
                   try{
                   // ref. al driver de conexion:
                   Class.forName("com.mysql.jdbc.Driver");
                   // 1. cadena de conexion
                  Connection myCon  = DriverManager.getConnection("jdbc:mysql://localhost:3306/crudpromedio","root","");
                  // 2. consulta preparada
                  PreparedStatement myStmt = myCon.prepareStatement("select*from promedio");
                  // 3. valor a los parametros
                  // 4 ejecutar consulta y recorrerla:
                  ResultSet myRs = myStmt.executeQuery();
                  while(myRs.next())
                  {
                  %>
                  <tr>
                     <td class="text-center"> <%=myRs.getInt(1)%> </td> 
                     <td class="text-center"> <%=myRs.getString(2)%> </td> 
                     <td class="text-center" > <%=myRs.getString(3)%> </td> 
                     <td class="text-center"> <%=myRs.getInt(4)%> </td> 
                     <td class="text-center" > <%=myRs.getDouble(5)%> </td>
                     <td class="text-center"> <%=myRs.getDouble(6)%> </td>
                     <td class="text-center" > <%=myRs.getDouble(7)%> </td>
                     
                      <td class="text-center" > 
                          <a href="editar.jsp?id=<%=myRs.getInt(1)%>" class="btn btn-danger"> Editar </a> 
                        //
                        <a href="eliminar.jsp?id=<%=myRs.getInt(1)%>" class="btn btn-warning"> Eliminar </a>
                      </td>
                  </tr>
                  <%
                  }
                  }catch(Exception exc){
                     exc.printStackTrace();
                   }
                  
                  %>
                  
               
           </table>
            
        </form>
        </center>
    </body>
</html>
