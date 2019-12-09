<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<%@ include file="header.jsp" %>
<div style="background-color: #088A4B;height:35px;color:#fff; font-size:18px; padding:5px; text-align:center;margin-bottom:20px">
		<span>Thông tin khách hàng</span>
</div>
		<div class="container">
			<form style="margin-bottom-:20px;margin-left:20px;margin-right:20px;" action="/GreenProduct/thongtin" method="post">
			  <div class="form-group">
			    <label for="exampleFormControlInput1">Tên khách hàng</label>
			    <input type="text" name="tenKhachHang" value="${sessionScope.hoaDon.tenKhachHang}" class="form-control" id="exampleFormControlInput1" placeholder="Nhập họ tên" required>
			  </div><div class="form-group">
			    <label for="exampleFormControlInput1">Email</label>
			    <input type="text" name="email"value="${sessionScope.hoaDon.email}" class="form-control" id="exampleFormControlInput1" placeholder="Nhập địa chỉ email" required>
			  </div>
			  <div class="form-group">
			    <label for="exampleFormControlInput1">Số điện thoại</label>
			    <input type="text" name="soDienThoai" value="${sessionScope.hoaDon.soDienThoai}" class="form-control" id="exampleFormControlInput1" placeholder="Nhập số điện thoại" required>
			  </div>
			  <div class="form-group">
			    <label for="exampleFormControlInput1">Địa chỉ</label>
			    <input type="text" name="diaChi" value="${sessionScope.hoaDon.diaChi}" class="form-control" id="exampleFormControlInput1" placeholder="Nhập địa chỉ" required>
			  </div>
			  <div class="row">
				<div class="col-12" style="text-align:center;margin-top:20px;">
					<button type="submit" class="btn btn-primary">Đặt hàng</button>
				</div>
			  </div>
			</form>
		</div>
<%@ include file="footer.jsp" %>
