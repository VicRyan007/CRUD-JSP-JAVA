<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Editar Usuário</title>
</head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">

<body>
	
	<%@ page import="com.crudjspjava.beans.Usuario, com.crudjspjava.dao.UsuarioDao" %>
	
	<%
		String id = request.getParameter("id");
		Usuario usuario = UsuarioDao.getRegistroById(Integer.parseInt(id));
	%>
	<form action="editusuario.jsp" method="post" class="m-5">
		<div class="form-group">
    		<label for="formGroupExampleInput">Id</label>
    		<input type="hidden" class="form-control" name="id" value="<%=usuario.getId()%>"/>
  		</div>
  		<br>
  		<div class="form-group">
    		<label for="formGroupExampleInput">Nome</label>
    		<input type="text" class="form-control" name="nome" value="<%=usuario.getNome()%>"/>
  		</div>
  		<br>
  		<div class="form-group">
    		<label for="formGroupExampleInput">Sobrenome</label>
    		<input type="text" class="form-control" name="sobrenome" value="<%=usuario.getSobrenome()%>"/>
  		</div>
  		<br>
  		<div class="form-group">
    		<label for="formGroupExampleInput">Email</label>
    		<input type="email" class="form-control" name="email" value="<%=usuario.getEmail()%>"/>
  		</div>
  		<br>
  		<div class="form-group">
    		<label for="formGroupExampleInput">Sexo</label>
    		<div class="custom-control custom-radio">
  				<input type="radio" id="customRadio1" value="masculino" name="sexo" class="custom-control-input">
  				<label class="custom-control-label" for="customRadio1">Masculino</label>
			</div>
			<div class="custom-control custom-radio">
  				<input type="radio" id="customRadio2" name="sexo" value="feminino" class="custom-control-input">
  				<label class="custom-control-label" for="customRadio2">Feminino</label>
			</div>
  		</div>
  		<br>
  		<div class="form-group">
    		<label for="formGroupExampleInput">País</label>
    		<select class="custom-select" name="pais">
			  <option selected>Opções</option>
			  <option >Brasil</option>
			  <option >Argentina</option>
			  <option >Portugal</option>
			  <option >EUA</option>
			  <option >Outro</option>
			</select>
  		</div>
  		
	  		<div class="d-flex justify-content-center">
		  		<input type="submit" class="btn btn-primary" value="Editar Usuário"
		  		style=
						"width: 200px;
					    padding: 15px 20px;
					    border: 1px solid #eee;
					    border-radius: 6px;
					    font-size: 14px;"						/>
				
			</div>
  		
  	</form>
	
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>

</html>