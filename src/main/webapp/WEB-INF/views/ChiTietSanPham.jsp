<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<%@ include file="header.jsp" %>
<div style="background-color: #088A4B;height:35px;color:#fff; font-size:18px; padding:5px; text-align:center;">
	<span>Chi tiết sản phẩm<span>
</div>
<div class="container">
	<div class="row col-xs-12" style="margin:20px;">
		<div class="col-xs-6">
			<img src="resources/images/${SanPham.hinhAnh}" alt="" style="width:450px;height:450px;">
		</div>
		<div class="col-xs-6">
			<form action="/GreenProduct/addchitietsanpham?masp=${SanPham.maSanPham}" method="post">	
			      <h2 style="margin-top:20px;margin-bottom:20px;color:#088A4B;">${SanPham.tenSanPham}</h2>
			      <label style="margin-top:20px;margin-bottom:20px;font-size:20px;">Giá: <fmt:formatNumber type = "number" maxFractionDigits = "3" value ="${SanPham.donGia}"/> đ/${SanPham.donViTinh}</label><br/>
			      <label style="margin-top:20px;font-size:18px;">Mô tả: </label><span style="font-size:18px;"> ${SanPham.moTa}</span><br/>
			      <div class="form-group row" style="margin-top:20px;">
			        <div class="col-xs-4" style="margin-top:10px;">
				    	<label style="font-size:18px;">Số lượng mua:</label>
				    </div>
				    <div class="col-xs-7 form-cart">
				      
					    <div class="col-xs-2">
					      	<button id="sub${SanPham.maSanPham}" type="button"  onclick="giamSoLuong(${SanPham.maSanPham})">-</button>
					    </div>
					    <div class="col-xs-3">
					    <input type="text" id="soluong${SanPham.maSanPham}" name="soLuong" style="max-width:50px;" value="1">
				    	</div>
				    	<div class="col-xs-3">
				    	  	<button id="add" type="button"  onclick="tangSoLuong(${SanPham.maSanPham},${SanPham.soLuong},${SessionCart.soLuong})">+</button>
					    </div>
				    	
				    </div>
				  </div>	
				  <c:if test="${SessionCart.soLuong >= SanPham.soLuong}">
				  	<button type="submit" class="btn btn-info" disabled style="margin-top:20px;margin-bottom:20px;margin-left:220px;">Thêm vào giỏ</button>
				  </c:if>
				  <c:if test="${SessionCart.soLuong < SanPham.soLuong}">
				  	<button type="submit" class="btn btn-info" style="margin-top:20px;margin-bottom:20px;margin-left:220px;">Thêm vào giỏ</button>
				  </c:if>		 
			  </form>
		</div>
	</div>
</div>
	<script type="text/javascript">
  		function tangSoLuong(id, sl, slCart){
  	   		var giaTri = $('#soluong' + id).val();
  	   		var soLuong = parseInt(giaTri);
  	   		if(soLuong + slCart >= sl){
  	   			$('#exampleModal').modal('show');
  	   		}else{
	  	   		soLuong = soLuong + 1;
	  	   		$('#soluong' + id).val(soLuong);
  	   		}
  	   	}
  	   	
  	   	function giamSoLuong(id){
  	   		var giaTri = $('#soluong' + id).val();
  	   		var soLuong = parseInt(giaTri);
  	   		if(soLuong === 1){
  	   			$('#soluong' + id).val(1);
  	   		}else{
  	   			soLuong = soLuong - 1;
  	   	   		$('#soluong' + id).val(soLuong);
  	   		}
  	   	}
  	   	
  	   	function soSanh(id){
  	   		$('#' + id).modal('show');
  	   	}
		</script>
<%@ include file="footer.jsp" %>