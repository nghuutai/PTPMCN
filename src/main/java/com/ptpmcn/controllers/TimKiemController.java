package com.ptpmcn.controllers;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ptpmcn.dao.SanPhamDAO;
import com.ptpmcn.entity.GioHang;
import com.ptpmcn.entity.SanPham;

import service.GioHangService;

@Controller
public class TimKiemController {
	
	ApplicationContext context = new ClassPathXmlApplicationContext("IoC.xml");
	SanPhamDAO sp = (SanPhamDAO) context.getBean("dbsanpham");
	
	@PostMapping("/timkiem")
	public String hienThiTimKiem(@RequestParam("tim") String key, ModelMap modelMap) {
		List<SanPham> listSanPhamTimKiem = sp.timKiemSanPham(key);
		modelMap.addAttribute("Tim",key);
		modelMap.addAttribute("ListSanPhamTimKiem", listSanPhamTimKiem);
		return "timkiem";
	}
	@RequestMapping("/themspvaogio")
	public String themVaoGio(HttpSession session, @RequestParam("masp") int id,  @RequestParam("tim") String key,ModelMap modelMap) {
		HashMap<Integer, GioHang> arrGioHang = (HashMap<Integer, GioHang>)session.getAttribute("GioHang");
		SanPham sanPham = sp.getSanPhamById(id);
		int soLuongCon = sp.getSoLuong(id);
		arrGioHang = GioHangService.tangGioHang(arrGioHang, sanPham, id, 1, soLuongCon);
		int total = GioHangService.tongGiaTriGioHang(arrGioHang);
		int totalSL = GioHangService.tongSoLuongGioHang(arrGioHang);
		List<SanPham> listSanPhamTimKiem = sp.timKiemSanPham(key);
		modelMap.addAttribute("ListSanPhamTimKiem", listSanPhamTimKiem);
		modelMap.addAttribute("Tim",key);
		session.setAttribute("TongGiaTriDonHang", total);
		session.setAttribute("GioHang", arrGioHang);
		session.setAttribute("TongSoLuongGioHang", totalSL);
		return "timkiem";
	}

}
