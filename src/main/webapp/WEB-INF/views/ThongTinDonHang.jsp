<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<title>Green Product</title>
<meta charset="UTF-8"/>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
</head>
<body>
	<%@ include file="header.jsp" %>
	<div class="container">
		<div style="margin:20px;">
		<h2>THÔNG TIN ĐƠN HÀNG</h2>
	</div>
	<div class="row" style="margin-left:20px;margin-right:20px;">
		<div class="col-6">
			<div class="row">
				<div class="col-6">
					<h3>Địa chỉ giao hàng</h3>
				</div>
			</div>
			<div class="dropdown-divider"></div>
			<div style="margin-bottom:20px;">Họ tên: ${sessionScope.hoaDon.tenKhachHang}</div>
			<div style="margin-bottom:20px;">Email: ${sessionScope.hoaDon.email}</div>
			<div style="margin-bottom:20px;">Số điện thoại: ${sessionScope.hoaDon.soDienThoai}</div>
			<div style="margin-bottom:20px;">Địa chỉ: ${sessionScope.hoaDon.diaChi}</div>
		</div>
		<div class="col-6">
			<div class="row">
				<div class="col-6">
					<h3>Đơn hàng</h3>
				</div>
			</div>
			<div class="dropdown-divider"></div>
			<table class="table" >
			  <thead>
			    <tr>
			      <th scope="col">Sản phẩm</th>
			      <th scope="col">Số lượng</th>
			      <th scope="col">Thành tiền</th>
			    </tr>
			  </thead>
			  <tbody>
			  	<c:forEach var="item" items="${sessionScope.GioHang}">
			  		<tr>
				  		<td>${item.value.sanPham.tenSanPham}</td>
				  		<td>${item.value.soLuong}</td>
				  		<td>${item.value.tongTien()}đ</td>
			  		</tr>
			  	</c:forEach>
			  	<tr>
			  		<td colspan="3" style="text-align:right;">Tổng tiền: ${sessionScope.TongGiaTriDonHang}đ</td>
			  	</tr>
			  </tbody>
			</table>
		</div>
	</div>
	<div class="row">
		<div class="col-12" style="text-align:center;margin-top:20px;">
			<a href="/GreenProduct/dathang"><button type="submit" class="btn btn-danger">Đặt mua</button></a>
		</div>
	</div>
	</div>
	<%@ include file="footer.jsp" %>
</body>
</html>