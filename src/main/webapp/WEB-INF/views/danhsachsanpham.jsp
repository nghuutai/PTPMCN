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
<div style="background-color: #088A4B;height:35px;color:#fff; font-size:18px; padding:5px; text-align:center;">
	<span>Danh sách sản phẩm</span>
</div>	
<div class="container">
	<div class="content">
		<ul class="products">
		<%
				List<SanPham> listSanPham = (List<SanPham>) request.getAttribute("ListSanPham");
				String ma = (String) request.getAttribute("madm");
				for(SanPham sp : listSanPham){
		%>
			<li> 
			<c:set var="hinhanh" value="<%=sp.getHinhAnh() %>"/>
			<a class="cart" href="#"><img src="<c:url value='resources/images/${hinhanh}' />" alt="" width="252px" height="190px">
					<h3><%= sp.getTenSanPham() %></h3>
					<c:set var="dongia" value="<%=sp.getDonGia() %>"/>
					<h4>
						Giá: <fmt:formatNumber type = "number" maxFractionDigits = "3" value ="${dongia}"/> đ
					</h4>	
				
			</a>
			<div class="clearfix"></div>
				<a href="/GreenProduct/themvaogiodssp?madm=<%=ma %>&masp=<%=sp.getMaSanPham() %>"><button class="btn">Thêm vào giỏ</button></a>
			</li>
			<%} %>	
		</ul>
		
	</div>
</div>
<%@ include file="footer.jsp" %>
</body>
</html>		