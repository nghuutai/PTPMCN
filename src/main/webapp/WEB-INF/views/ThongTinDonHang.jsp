<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<title>Green Product</title>
<meta charset="UTF-8"/>
<link href="<c:url value="/resources/css/bootstrap.css"/>" rel="stylesheet">
<link href="<c:url value="/resources/css/style.css"/>" rel="stylesheet">
</head>
<body>
	<%@ include file="header.jsp" %>
<div style="background-color: #088A4B;height:35px;color:#fff; font-size:18px; padding:5px; text-align:center;margin-bottom:20px">
		<span>Thông tin đơn hàng</span>
</div>
<div class="container">
	<div class="row" style="margin-left:20px;margin-right:20px;">
		<div class="col-xs-6">
			<div class="row">
				<div class="col-6">
					<span style="font-size:20px; color:red; font-weight:bold;margin-bottom:50px;">Địa chỉ giao hàng</span>
				</div>
			</div>
			<div class="dropdown-divider"></div>
			<div style="margin-bottom:20px;">Họ tên: ${sessionScope.hoaDon.tenKhachHang}</div>
			<div style="margin-bottom:20px;">Email: ${sessionScope.hoaDon.email}</div>
			<div style="margin-bottom:20px;">Số điện thoại: ${sessionScope.hoaDon.soDienThoai}</div>
			<div style="margin-bottom:20px;">Địa chỉ: ${sessionScope.hoaDon.diaChi}</div>
		</div>
		<div class="col-xs-6">
			<div class="row">
				<div class="col-6">
					<span style="font-size:20px; color:red; font-weight:bold; margin-bottom:40px;">Đơn hàng</span>
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
				  		<td><fmt:formatNumber type = "number" maxFractionDigits = "3" value ="${item.value.tongTien()}"/>VNĐ</td>
			  		</tr>
			  	</c:forEach>
			  	<tr>
			  		<td colspan="3" style="text-align:right; padding-right:50px;">Tổng tiền:  <fmt:formatNumber type = "number" maxFractionDigits = "3" value ="${sessionScope.TongGiaTriDonHang}"/>VNĐ</td>
			  	</tr>
			  </tbody>
			</table>
		</div>
	</div>
	<div class="row">
		<div class="col-12" style="text-align:center;margin-top:20px;">
			<a href="/GreenProduct/dathang"><button type="submit" class="btn">Xác nhận mua hàng</button></a>
		</div>
	</div>
	</div>
	<%@ include file="footer.jsp" %>
</body>
</html>