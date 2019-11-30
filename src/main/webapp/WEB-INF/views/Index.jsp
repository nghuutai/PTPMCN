<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

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
			<c:set var="listSPBanChay" value="${ListSanPhamBanChay}"></c:set>	
			<c:forEach items="${listSPBanChay}" var="sp">
				<li>
					<a class="cart" href="#"><img src="resources/images/${sp.getHinhAnh()}" alt="" width="252px" height="190px">
							<h3>${sp.getTenSanPham()}</h3>
							<h4>
								Giá: <fmt:formatNumber type = "number" maxFractionDigits = "3" value ="${sp.getDonGia()}"/> Đ
							</h4>	
					</a>
					<div class="clearfix"></div>
					<a href="/GreenProduct/themvaogio?masp=${sp.getMaSanPham()}"><button class="btn">Thêm vào giỏ</button></a>
				</li>
			</c:forEach>	
		</ul>
	</div>
</div>
<div style="background-color: #088A4B;height:35px;color:#fff; font-size:18px; padding:5px; text-align:center;">
	<span>Sản phẩm mới</span>
</div>	
<div class="container">
	<div class="content">
		<ul class="products">
			<c:set var="listSPMoi" value="${ListSanPhamMoi}"></c:set>	
			<c:forEach items="${listSPMoi}" var="sp">
				<li>
					<a class="cart" href="#"><img src="resources/images/${sp.getHinhAnh()}" alt="" width="252px" height="190px">
							<h3>${sp.getTenSanPham()}</h3>
							<h4>
								Giá: <fmt:formatNumber type = "number" maxFractionDigits = "3" value ="${sp.getDonGia()}"/> Đ
							</h4>	
					</a>
					<div class="clearfix"></div>
					<a href="/GreenProduct/themvaogio?masp=${sp.getMaSanPham()}"><button class="btn">Thêm vào giỏ</button></a>
				</li>
			</c:forEach>	
		</ul>
	</div>
</div>
<%@ include file="footer.jsp" %>
	