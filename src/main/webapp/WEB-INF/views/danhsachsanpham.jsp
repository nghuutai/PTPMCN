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
			<c:set var="listSP" value="${ListSanPham}"></c:set>	
			<c:forEach items="${listSP}" var="sp">
				<li> 
					<a class="cart" href="/GreenProduct/chitietsanpham?masp=${sp.getMaSanPham()}"><img src="resources/images/${sp.getHinhAnh()}" alt="" width="252px" height="190px">
							<h3>${sp.getTenSanPham()}</h3>
							<h4>
								Giá: <fmt:formatNumber type = "number" maxFractionDigits = "3" value ="${sp.getDonGia()}"/>đ/${sp.getDonViTinh()}
							</h4>	
					</a>
					<div class="clearfix"></div>
						<a href="/GreenProduct/themvaogiodssp?madm=${madm}&masp=${sp.getMaSanPham()}&page=${TrangHienTai}"><button class="btn">Thêm vào giỏ</button></a>
				</li>
			</c:forEach>
		</ul>
		<c:if test ="${SoTrang != 1}">
			<div class="col-md-12 pagination-0">
				<nav aria-label="Page navigation example">
				  <ul class="pagination">
				    <li class="page-item">
				    <c:choose>
    					<c:when test="${TrangHienTai <= 1}">
      						<a class="page-link" href="/GreenProduct/dssanpham?madm=${madm}&page=1" aria-label="Previous">
				        		<span aria-hidden="true">&laquo;</span>
				        		<span class="sr-only">Previous</span>
				      		</a>
    					</c:when>    
    					<c:otherwise>
    						<a class="page-link" href="/GreenProduct/dssanpham?madm=${madm}&page=${TrangHienTai-1}" aria-label="Previous">
				        		<span aria-hidden="true">&laquo;</span>
				        		<span class="sr-only">Previous</span>
				      		</a>
    					</c:otherwise>
					</c:choose>
				    </li>
				    <c:forEach var="i" begin = "1" end = "${SoTrang}" step="1">
				    	<c:if test ="${TrangHienTai==i}">
				    	<li class="page-item"><a class="page-link" href="/GreenProduct/dssanpham?madm=${madm}&page=${i}" ><span class="tranghientai">${i}</span></a></li>
				    	</c:if>
				    	<c:if test ="${TrangHienTai!=i}">
				    	<li class="page-item"><a class="page-link" href="/GreenProduct/dssanpham?madm=${madm}&page=${i}" >${i}</a></li>
				    	</c:if>
				    </c:forEach>
				    <li class="page-item">
				    <c:choose>
	    				<c:when test="${TrangHienTai >= SoTrang}">
	      					<a class="page-link" href="/GreenProduct/dssanpham?madm=${madm}&page=${SoTrang}" aria-label="Next">
					        	<span aria-hidden="true">&raquo;</span>
					        	<span class="sr-only">Next</span>
					      	</a>
	    				</c:when>    
	    				<c:otherwise>
	    					<a class="page-link" href="/GreenProduct/dssanpham?madm=${madm}&page=${TrangHienTai+1}" aria-label="Next">
					        	<span aria-hidden="true">&raquo;</span>
					        	<span class="sr-only">Next</span>
					      	</a>
	    				</c:otherwise>
					</c:choose>
				    </li>
				  </ul>
				</nav>
			</div>
		</c:if>
	</div>
</div>
<%@ include file="footer.jsp" %>