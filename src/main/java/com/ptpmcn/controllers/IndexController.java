package com.ptpmcn.controllers;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ptpmcn.dao.SanPhamDAO;
import com.ptpmcn.entity.GioHang;
import com.ptpmcn.entity.SanPham;

import service.GioHangService;

@Controller
public class IndexController {

	ApplicationContext context = new ClassPathXmlApplicationContext("IoC.xml");
	SanPhamDAO sp = (SanPhamDAO) context.getBean("dbsanpham");
	
	@RequestMapping("/")
	public String loadIndex(HttpSession session, ModelMap modelMap) {
		List<SanPham> listSanPhamMoi = sp.getListSanPhamMoi();
		modelMap.addAttribute("ListSanPhamMoi", listSanPhamMoi);
		List<SanPham> listSanPhamBanChay = sp.getListSanPhamBanChay();
		modelMap.addAttribute("ListSanPhamBanChay", listSanPhamBanChay);
		return "Index";
	}
	
	@RequestMapping("/themvaogio")
	public String themVaoGio(HttpSession session, @RequestParam("masp") int id, ModelMap modelMap) {
		HashMap<Integer, GioHang> arrGioHang = (HashMap<Integer, GioHang>)session.getAttribute("GioHang");
		SanPham sanPham = sp.getSanPhamById(id);
		int soLuongCon = sp.getSoLuong(id);
		arrGioHang = GioHangService.tangGioHang(arrGioHang, sanPham, id, 1, soLuongCon);
		int total = GioHangService.tongGiaTriGioHang(arrGioHang);
		int totalSL = GioHangService.tongSoLuongGioHang(arrGioHang);
		List<SanPham> listSanPhamMoi = sp.getListSanPhamMoi();
		modelMap.addAttribute("ListSanPhamMoi", listSanPhamMoi);
		List<SanPham> listSanPhamBanChay = sp.getListSanPhamBanChay();
		modelMap.addAttribute("ListSanPhamBanChay", listSanPhamBanChay);
		session.setAttribute("TongGiaTriDonHang", total);
		session.setAttribute("GioHang", arrGioHang);
		session.setAttribute("TongSoLuongGioHang", totalSL);
		return "Index";
	}
	
	
}
