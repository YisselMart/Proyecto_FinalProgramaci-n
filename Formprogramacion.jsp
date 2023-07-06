<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*"  %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="jsp.css">
<title>Registro en el Curso de Programación</title>
</head>
<body>
 <form>
  
  
  <div class="contenedor">
  <div class="registrosjsp">
    <h1>¡Registro exitoso!</h1>
    <p>Los datos fueron insertados correctamente.</p>
    <a href="Home.html">Página de Inicio</a>
  </div>
</div>
  </form>
   <%
   
   String nombreP = request.getParameter("nombreP");
   String cedulaP = request.getParameter("cedulaP");
   String fechainicioP = request.getParameter("fechainicioP");
    
   
        
        Class.forName("com.mysql.jdbc.Driver");
        Connection dbconect = DriverManager.getConnection("jdbc:mysql://localhost:3306/solociencia","root","");
        Statement dbstatement = dbconect.createStatement();
        String insertarsql = "INSERT INTO registroprogramacion (nombreP,cedulaP,fechainicioP) VALUES ('"+nombreP+"','"+cedulaP+"','"+fechainicioP+"')";
        dbstatement.executeUpdate(insertarsql);
        
         %>
</body>
</html>
