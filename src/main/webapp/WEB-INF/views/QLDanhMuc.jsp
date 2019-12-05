<%@page import="java.util.List"%>
<%@page import="com.ptpmcn.entity.DanhMuc"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<title>Quản Lý Danh Mục</title>
<meta charset="UTF-8"/>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<link href="<c:url value="/resources/css/bootstrap.css"/>" rel="stylesheet">
<link href="<c:url value="/resources/css/style.css"/>" rel="stylesheet">
<link href='http://fonts.googleapis.com/css?family=Lato:100,200,300,400,500,600,700,800,900' rel='stylesheet' type='text/css'>
<script src="<c:url value="/resources/js/jquery-1.11.1.min.js" />" ></script>
<link href="<c:url value="/resources/css/megamenu.css"/>" rel="stylesheet" media="all">
<script src="<c:url value="/resources/js/megamenu.js" />" ></script>
<script>$(document).ready(function(){$(".megamenu").megamenu();});</script>
</head>
<body>
<%@ include file="headerAdmin.jsp" %>
	
<div class="content_top">
	<div class="container">
	   <div class="form-sanpham">
			<form action="/GreenProduct/qldanhmuc" method="post" name="formdangki" onsubmit="return Check()">
			  <div class="form-group">
			    <input type="text" class="form-control"name="maDanhMuc" id="exampleFormControlInput1" placeholder="Nhập mã danh mục"
			    style=" margin-left: 25%; width: 50%;">
			  </div>
			  <div class="form-group">
			    <input type="text" class="form-control" name="tenDanhMuc" id="exampleFormControlInput1" placeholder="Nhập tên danh mục"
			    style=" margin-left: 25%; width: 50%;">
			  </div>
			  <div class="form-group">
				  	<button type="submit" class="btn btn-primary mb-2"
				  	style=" margin-left: 40%; width: 20%;">Thêm danh mục</button>
				  
			  </div>
			  <%
				if( (Integer) request.getAttribute("result") == 0 ){
			%>
				<div class="alert alert-danger" role="alert">
				  Mã Danh mục đã tồn tại!
				</div>
			<%
				}
			%>
			
			</form>
		</div>
		 <script>
			 	function Check(){
			 		let madanhmuc = document.forms["formdangki"]["maDanhMuc"].value;
			 		let tendanhmuc = document.forms["formdangki"]["tenDanhMuc"].value;
			 		if(madanhmuc === "" || tendanhmuc === ""  ){
			 			alert("Vui lòng nhập đầy đủ nội dung");
			 			return false;
			 		}
			 		return true;
			 	}
			</script>
			
			
		  <div class="form-sanpham">
			<table class="table table-striped">
			  <thead>
			    <tr>
			      <th scope="col" style="width: 20%">ID </th>
			      <th scope="col" style="width: 55%">Tên Danh Mục</th>
			      <th scope="col" style="width: 25%">Action</th>
			    </tr>
			  </thead>
			   <tbody>
			  	<%
			  		List<DanhMuc> listDanhMuc = (List<DanhMuc>) request.getAttribute("listDanhMuc");
			    	for(DanhMuc dm : listDanhMuc){
			  	%>
			  		<tr>
				      <th scope="row"><%= dm.getMaDanhMuc() %></th>
				      <td><%= dm.getTenDanhMuc() %></td>
				      <td>
				      	<div class="btn-group">
				      		<a href="suadanhmuc/<%= dm.getMaDanhMuc() %>" ><button type="button" class="btn2 btn-warning">Edit</button></a>
				      	</div>
				      	<div class="btn-group">
				      		<a href="/GreenProduct/qldanhmuc/<%= dm.getMaDanhMuc() %>"><button type="button" class="btn2 btn-danger">Delete</button></a>
				      	</div>
				      </td>
				    </tr>
			  	<%
			    	}
			  	%>
			  	
			  </tbody>
			</table>
		</div>
	    
		<div class="clearfix"></div>
</div>
</div>
</body>
</html>		