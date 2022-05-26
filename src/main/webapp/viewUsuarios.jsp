<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Visualização de Usuários</title>
</head>
	<!-- CSS only -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.2/font/bootstrap-icons.css">	
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
<body class="bg-success .bg-gradient">
	<%@ page import="com.crudjspjava.dao.UsuarioDao, com.crudjspjava.beans.Usuario, java.util.*" %>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	
	<div class="mt-4 ms-5 me-5 border border-2 rounded-pill bg-white ">
		<h1 class="text-center m-2">Listagem de usuários</h1>
	</div>
	
	<%
		List<Usuario> list = UsuarioDao.getAllusuarios();
		request.setAttribute("list", list);
	%>
	
	<div class="container mt-5 ">
	<table class="table table-striped table-bordered border border-3 ">
		<tr class="table-dark ">
			<th>ID</th>
			<th>Nome</th>
			<th>Sobrenome</th>
			<th>Email</th>
			<th>Sexo</th>
			<th>País</th>
			<th>Editar</th>
			<th>Excluir</th>
		</tr>
		<c:forEach items="${list}" var="usuario">
			<tr class="bg-light"> 
				<td>${usuario.getId()}</td>
				<td>${usuario.getNome()}</td>
				<td>${usuario.getSobrenome()}</td>
				<td>${usuario.getEmail()}</td>
				<td>${usuario.getSexo()}</td>
				<td>${usuario.getPais()}</td>
				<td><a href="editform.jsp?id=${usuario.getId()}"><button class="btn btn-warning"><i class="bi bi-pencil-square"></i></button></a></td>
				<td><a href="deleteUsuario.jsp?id=${usuario.getId()}"><button class="btn btn-danger"><i class="bi bi-trash-fill"></i></button></a></td>
			</tr>
		</c:forEach>
	</table>
	</div>
	<br>
	<div class="d-flex justify-content-center">
		<a href="addUsuarioform.jsp">
		<button class="btn btn-primary" 
		style=
		"width: 200px;
	    padding: 15px 20px;
	    border: 1px solid #eee;
	    border-radius: 6px;
	    font-size: 14px;"
			>Adicionar novo usuário</button>
		</a>
	</div>
	
	
</body>
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
</html>