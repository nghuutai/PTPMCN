<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<%@ include file="header.jsp" %>
<div style="background-color: #088A4B;height:35px;color:#fff; font-size:18px; padding:5px; text-align:center;">
	<span>Danh sách sản phẩm</span>
</div>	
<div class="container">
	<div class="content">
		<ul class="products">
			<c:if test ="${ListSanPham != null}">
				<c:set var="listSP" value="${ListSanPham}"></c:set>	
			</c:if>
			<c:if test ="${ListSanPhamTimKiem != null}">
				<c:set var="listSP" value="${ListSanPhamTimKiem}"></c:set>	
			</c:if>
			<c:set var="maDM" value="${madm}"></c:set>	
			<c:forEach items="${listSP}" var="sp">
				<li> 
					<a class="cart" href="/GreenProduct/chitietsanpham?masp=${sp.getMaSanPham()}"><img src="resources/images/${sp.getHinhAnh()}" alt="" width="252px" height="190px">
							<h3>${sp.getTenSanPham()}</h3>
							<h4>
								Giá: <fmt:formatNumber type = "number" maxFractionDigits = "3" value ="${sp.getDonGia()}"/> Đ
							</h4>	
					</a>
					<div class="clearfix"></div>
						<a href="/GreenProduct/themvaogiodssp?madm=${maDM}&masp=${sp.getMaSanPham()}"><button class="btn">Thêm vào giỏ</button></a>
				</li>
			</c:forEach>
			<c:if test ="${ListSanPhamTimKiem.size()==0}">
			 		<span class="title-tim">Không tìm thấy kết quả!</span>
			</c:if>	
		</ul>
		
	</div>
</div>
<%@ include file="footer.jsp" %>
	