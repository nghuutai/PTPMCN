<%@page import="org.springframework.context.ApplicationContext"%>
<%@page import="org.springframework.context.support.ClassPathXmlApplicationContext"%>
<%@page import="com.ptpmcn.dao.DMSanPhamDAO"%>
<%@page import="com.ptpmcn.entity.DMSanPham"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML>
<html>
<head>
<title>Green Product</title>
<meta charset="UTF-8"/>
<link href="<c:url value="/resources/css/bootstrap.css"/>" rel="stylesheet">
<link href="<c:url value="/resources/css/style.css"/>" rel="stylesheet">
<link href='http://fonts.googleapis.com/css?family=Lato:100,200,300,400,500,600,700,800,900' rel='stylesheet' type='text/css'>
<script src="<c:url value="/resources/js/jquery-1.11.1.min.js" />" ></script>
<script src="<c:url value="/resources/js/megamenu.js" />" ></script>
<script>$(document).ready(function(){$(".megamenu").megamenu();});</script>
</head>
<body>
<div class="header_top">
<div class="container">
	<div class="col-xs-8 header-top-left">
		<div class="col-xs-4 logo">
			<h1><a href="/GreenProduct"><span>Green</span>Product</a></h1>
		</div>
		<div class="col-xs-4 menu">
		    <ul class="megamenu skyblue">
				<li><a class="color4" href="/GreenProduct">Trang chủ</a></li>				
				<li><a class="color5" href="#">Giới thiệu</a></li>
				<li class="grid"><a class="color2" href="/GreenProduct/dssanpham?madm=0">Sản phẩm</a>
					 <div class="megapanel">
						<div class="row">
							<div class="col1">
								<div class="h_nav">
									<h4>Danh mục sản phẩm</h4>
									<ul>
										<li><a href="/GreenProduct/dssanpham?madm=0">Tất cả sản phẩm</a></li>
										<%
											ApplicationContext context = new ClassPathXmlApplicationContext("IoC.xml");
											DMSanPhamDAO dmsp = (DMSanPhamDAO) context.getBean("dbdmsanpham");
											List<DMSanPham> listDMSanPham = dmsp.getListDMSanPham(); 
											for (DMSanPham dm : listDMSanPham){
										%>
										
										<li><a href="/GreenProduct/dssanpham?madm=<%=dm.getMaDM()%>"> <%= dm.getTenDM() %> </a></li>
										<%} %>
									</ul>	
								</div>												
							</div>
						</div>
					</div>
			    </li>
			    <li><a class="color6" href="#">Liên hệ</a></li>
			 </ul> 
		</div>
	</div>
	<div class="col-xs-4 header-top-right">
	    <div class="box_11-cart">
		     <div class="box_11">
		     	<c:if test="${sessionScope.TongSoLuongGioHang==0}">
		     		<a href="#"><h4><p>Giỏ hàng</p><img src="<c:url value="/resources/images/cart.png" />" alt=""><div class="clearfix"> </div></h4></a>
		     	</c:if>
		     	<c:if test="${sessionScope.TongSoLuongGioHang==null}">
		     		<a href="#"><h4><p>Giỏ hàng</p><img src="<c:url value="/resources/images/cart.png" />" alt=""><div class="clearfix"> </div></h4></a>
		     	</c:if>
		     	<c:if test="${sessionScope.TongSoLuongGioHang>0}">
		     		<a href="/GreenProduct/giohang"><h4><p>Giỏ hàng (${sessionScope.TongSoLuongGioHang})</p><img src="<c:url value="/resources/images/cart.png" />" alt=""><div class="clearfix"> </div></h4></a>
		     	</c:if>
		     </div>
	   	</div>
	   	<div class="search">	  
			<form name ="timkiem" action="timkiem" method="post" onsubmit="return checkTim()" >	  
					<input type="text" name="tim" class="textbox" placeholder="Tìm sản phẩm">
					<input type="submit" id="submit" name="submit">
			</form>
		</div>
	    <div class="clearfix"></div>
    </div>
    <div class="clearfix"></div>
</div>
</div>
<script type="text/javascript">
function checkTim(){
	  var value = document.forms["timkiem"]["tim"].value;
	  console.log(value);
	  if(value === "")
	  {
	        alert("Vui lòng nhập tên sản phẩm cần tìm!");
	        return false;
	  }
  }
</script>
