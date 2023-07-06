<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title></title>
</head>
<body>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.SQLException" %>
 <%@ page import="java.sql.ResultSet" %>

<%
   String url = "jdbc:mysql://localhost:3306/solociencia";
   String user = "root";
   String password = "";
   Class.forName("com.mysql.jdbc.Driver");
   Connection conn = DriverManager.getConnection(url, user, password);
%>

<%  
try {
String nombreUsuario = request.getParameter("name");
String contrasena = request.getParameter("password");

String consulta = "SELECT * FROM registrousuario WHERE nombre=?";
PreparedStatement declaracion = conn.prepareStatement(consulta);
declaracion.setString(1, nombreUsuario);
ResultSet resultado = declaracion.executeQuery();

if (resultado.next()) {
   String contrasenaDB = resultado.getString("clave");
   // Verificar si la contraseña ingresada coincide con la almacenada en la base de datos
   if (contrasena.equals(contrasenaDB)) {
      // Credenciales correctas, iniciar sesi n
      // Aqu  puedes establecer una variable de sesion para mantener al usuario autenticado
      session.setAttribute("name", nombreUsuario);
      // Redirigir al usuario a la pagina de inicio o a otra p gina protegida
      response.sendRedirect("Home.html");
   } else {
      // Contraseña incorrecta, mostrar mensaje de error
      out.println("La contraseña ingresada no es valida. Intentalo nuevamente.");
   }
} else {
   // Usuario no encontrado, mostrar mensaje de error
   out.println("El usuario ingresado no existe. Intentalo nuevamente.");
}
	
}catch (Exception e) {
    out.print("Error en la conexion: " + e.getMessage());
}
%>
</body>
</html>