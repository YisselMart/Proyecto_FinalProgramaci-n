<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*"  %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="jsp.css">
<title>Registro de Usuario</title>
</head>
<body>
 <form>
  
  
 <div class="contenedor">
  <div class="registrosjsp">
    <h1>¡Registro exitoso!</h1>
    <p>Los datos fueron insertados correctamente.</p>
    <a href="Pagina-1.html">Inicia tu Sesión</a>
  </div>
</div>
  </form>
   <%
   
   String nombre = request.getParameter("nombre");
   String apellido = request.getParameter("apellido");
   String edad = request.getParameter("edad");
   String clave = request.getParameter("clave");
    
   
        
        Class.forName("com.mysql.jdbc.Driver");
        Connection dbconect = DriverManager.getConnection("jdbc:mysql://localhost:3306/solociencia","root","");
        Statement dbstatement = dbconect.createStatement();
        String insertarsql = "INSERT INTO registrousuario (nombre,apellido,edad,clave) VALUES ('"+nombre+"','"+apellido+"','"+edad+"','"+clave+"')";
        dbstatement.executeUpdate(insertarsql);
        out.print("Registro realizado");
         %>
</body>
</html>