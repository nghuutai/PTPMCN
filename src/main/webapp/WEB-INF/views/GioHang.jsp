<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE HTML>
<html>
<head>
<title>Green Product</title>
<meta charset="UTF-8"/>
<link href="<c:url value="/resources/css/bootstrap.css"/>" rel="stylesheet">
<link href="<c:url value="/resources/css/style.css"/>" rel="stylesheet">
<link href='http://fonts.googleapis.com/css?family=Lato:100,200,300,400,500,600,700,800,900' rel='stylesheet' type='text/css'>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
</head>
<body>
<%@ include file="header.jsp" %>
	<div class="container">
		<div class="content">
		
		<c:if test="${sessionScope.TongSoLuongGioHang==0}">
			<div class="row" style="margin:20px;">
				<div class="col-12">
					GIỎ HÀNG TRỐNG
				</div>
				<div class="col-12">
					<a href="/GreenProduct">Bắt đầu mua hàng</a>
				</div>
			</div>
		</c:if>
		<c:if test="${sessionScope.TongSoLuongGioHang>0}">
			<div class="row" style="margin:20px;">
				<div class="col">
					<div style="background-color: #088A4B;height:35px;color:#fff; font-size:18px; padding:5px; text-align:center;">
						<span>GIỎ HÀNG</span>
					</div>	
				</div>
			</div>
			
			<!-- Modal -->
		<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
		  <div class="modal-dialog modal-dialog-centered" role="document">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title" id="exampleModalLongTitle">Thông báo</h5>
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		          <span aria-hidden="true">&times;</span>
		        </button>
		      </div>
		      <div class="modal-body">
		        Số lượng sản phẩm không còn đủ!!!
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-primary" data-dismiss="modal">Close</button>
		      </div>
		    </div>
		  </div>
		</div>
			
			<table class="table" style="margin:20px;width:1000px" >
			  <thead>
			    <tr>
			      <th scope="col">Sản phẩm</th>
			      <th scope="col">Giá</th>
			      <th scope="col">Số lượng</th>
			      <th scope="col">Tổng tiền</th>
			    </tr>
			  </thead>
			  <tbody>
			  	<c:forEach var="item" items="${sessionScope.GioHang}">
				    <tr>
				      <td>
				      	<div class="row">
				      		<div class="col-3">
				      			<img style="width: 70px; height:70px;" src="<c:url value='/resources/images/${item.value.sanPham.hinhAnh}' />" alt="..." class="img-thumbnail">
				      		</div>
				      		<div class="col-9">
				      			<div style="margin-bottom:20px;">Ten san pham: ${item.value.sanPham.tenSanPham}</div>
				      			<a href="/GreenProduct/giohang/xoa/${item.value.sanPham.maSanPham}"><span>Remove</span></a>
				      		</div>
				      	</div>
				      </td>
				      <td>${item.value.sanPham.donGia}</td>
				      <td> 
						      <c:if test="${item.value.soLuong==1}">
						      	<button id="sub" type="button" class="btn btn-secondary" disabled>-</button>
						      </c:if>
						      <c:if test="${item.value.soLuong>1}">
						      	<a href="/GreenProduct/giohang/giam/${item.value.sanPham.maSanPham}"><button id="sub" type="button" class="btn btn-secondary" >-</button></a>
						      </c:if>
						    <input id="${item.value.sanPham.maSanPham}" type="text" style="max-width:50px;" value="${item.value.soLuong}" readonly class="form-control" aria-label="Input group example" aria-describedby="btnGroupAddon">
					    	  <a href="/GreenProduct/giohang/them/${item.value.sanPham.maSanPham}" onclick="handleClick(event,${item.value.soLuongCon},${item.value.sanPham.maSanPham})"><button type="button" class="btn btn-secondary">+</button></a>
				      </td>
				      <td>10000đ</td>
				    </tr>
				    
				 </c:forEach>
				 <script>
		   		function handleClick(event, sl, id){
		   			var soLuong = document.getElementById(id).value;
		   			console.log(sl);
		   			if(soLuong == sl){
		   				console.log("false");
		   				$("#exampleModalCenter").modal('show');
		   				event.preventDefault();
		   			}else{
		   				console.log("true");
		   			}
		   		} 
		   		
		   	</script>
			  </tbody>
			</table>
			<div class="row">
				<div class="col-12" style="text-align:right;">
					<span style="margin-right:90px;font-size:20px;">Tổng tiền: ${sessionScope.TongGiaTriDonHang}đ</span>
				</div>
			</div>
			<div class="row">
				<div class="col-12" style="text-align:center;margin-top:20px;">
					<a href="/GreenProduct/thongtin"><button type="button" class="btn btn-danger">Tiến hành đặt hàng</button></a>
				</div>
			</div>
			</c:if>	
		</div>
	</div>
<!-- <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script> -->
<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script> -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<%@ include file="footer.jsp" %>
</body>
</html>