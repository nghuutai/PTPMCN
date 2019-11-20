<%@page import="com.ptpmcn.entity.SanPham"%>
<%@page import="java.util.List"%>
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
</head>
<body>
<%@ include file="header.jsp" %>
<div class="banner">
	<div class="container">
		<div class="banner_desc">
		</div>
	</div>
</div>
<div style="background-color: #088A4B;height:35px;color:#fff; font-size:18px; padding:5px; text-align:center;">
	<span>Sản phẩm bán chạy</span>
</div>	
<div class="container">
	<div class="content">
		<ul class="products">
		<%
				List<SanPham> listSanPhamBanChay = (List<SanPham>) request.getAttribute("ListSanPhamBanChay");
				for(SanPham sp : listSanPhamBanChay){
		%>
			<li> 
			<a class="cart" href="#"><img src="resources/images/<%=sp.getHinhAnh() %>" alt="" width="252px" height="190px">
					<h3><%= sp.getTenSanPham() %></h3>
					<c:set var="dongia" value="<%=sp.getDonGia() %>"/>
					<h4>
						Giá: <fmt:formatNumber type = "number" maxFractionDigits = "3" value ="${dongia}"/> VNĐ
					</h4>		
			</a>
			<div class="clearfix"></div>
				<%-- <span><a href="/GreenProduct/themvaogio?masp=<%=sp.getMaSanPham() %>"><input type="button" name="submit" value="Thêm vào giỏ" class="btn"></a></span> --%>
			
					<a href="/GreenProduct/themvaogio?masp=<%=sp.getMaSanPham() %>"><button class="btn">Thêm vào giỏ</button></a>
				
			</li>
			<%} %>	
		</ul>
	</div>
</div>
<div style="background-color: #088A4B;height:35px;color:#fff; font-size:18px; padding:5px; text-align:center;">
	<span>Sản phẩm mới</span>
</div>	
<div class="container">
	<div class="content">
		<ul class="products">
			<%
				List<SanPham> listSanPhamMoi = (List<SanPham>) request.getAttribute("ListSanPhamMoi");
				for(SanPham sp : listSanPhamMoi){
			%>
			<li> 
			<a class="cart" href="#"><img src="resources/images/<%=sp.getHinhAnh() %>" alt="" width="252px" height="190px">
					<h3><%= sp.getTenSanPham() %></h3>
					<c:set var="dongia" value="<%=sp.getDonGia() %>"/>
					<h4>
						Giá: <fmt:formatNumber type = "number" maxFractionDigits = "3" value ="${dongia}"/> VNĐ
					</h4>	
			</a>
			<div class="clearfix"></div>
				<a href="/GreenProduct/themvaogio?masp=<%=sp.getMaSanPham() %>"><button class="btn">Thêm vào giỏ</button></a>
			</li>
			<%} %>	
		</ul>
	</div>
</div>
<%@ include file="footer.jsp" %>
</body>
</html>		