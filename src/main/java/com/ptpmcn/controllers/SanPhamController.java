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
public class SanPhamController {
	
	ApplicationContext context = new ClassPathXmlApplicationContext("IoC.xml");
	SanPhamDAO sp = (SanPhamDAO) context.getBean("dbsanpham");
	@GetMapping("/dssanpham")
	public String layDanhSachSanPham(HttpSession session, @RequestParam("madm") String id,ModelMap modelMap) {
		
		if(id.equals("0"))
		{
			List<SanPham> listSanPham = sp.getListSanPham();
			modelMap.addAttribute("ListSanPham", listSanPham);
		}
		else
			{
				List<SanPham> listSanPham = sp.getListSanPhamTheoDanhMuc(id);
				modelMap.addAttribute("ListSanPham", listSanPham);
			}
		modelMap.addAttribute("madm", id);
		return "danhsachsanpham";
	}
	
	@RequestMapping("/themvaogiodssp")
	public String themVaoGio(HttpSession session, @RequestParam("madm") String id, @RequestParam("masp") int idsp, ModelMap modelMap) {
		HashMap<Integer, GioHang> arrGioHang = (HashMap<Integer, GioHang>)session.getAttribute("GioHang");
		SanPham sanPham = sp.getSanPhamById(idsp);	
		int soLuongCon = sp.getSoLuong(idsp);
		arrGioHang = GioHangService.tangGioHang(arrGioHang, sanPham, idsp, 1, soLuongCon);
		int total = GioHangService.tongGiaTriGioHang(arrGioHang);
		int totalSL = GioHangService.tongSoLuongGioHang(arrGioHang);
		if(id.equals("0"))
		{
			List<SanPham> listSanPham = sp.getListSanPham();
			modelMap.addAttribute("ListSanPham", listSanPham);
		}
		else
			{
				List<SanPham> listSanPham = sp.getListSanPhamTheoDanhMuc(id);
				modelMap.addAttribute("ListSanPham", listSanPham);
			}
		modelMap.addAttribute("madm", id);
		session.setAttribute("TongGiaTriDonHang", total);
		session.setAttribute("GioHang", arrGioHang);
		session.setAttribute("TongSoLuongGioHang", totalSL);
		return "danhsachsanpham";
	}
	@PostMapping("/timkiem")
	public String hienThiTimKiem(HttpSession session, @RequestParam("tim") String key,ModelMap modelMap) {
		List<SanPham> listSanPhamTimKiem = sp.timKiemSanPham(key);
		modelMap.addAttribute("ListSanPhamTimKiem", listSanPhamTimKiem);
		return "danhsachsanpham";
	}
}
