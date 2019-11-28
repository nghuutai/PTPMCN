package com.ptpmcn.controllers;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ptpmcn.dao.SanPhamDAO;
import com.ptpmcn.entity.GioHang;
import com.ptpmcn.entity.SanPham;

import service.GioHangService;




@Controller
public class GioHangController {

	ApplicationContext context = new ClassPathXmlApplicationContext("IoC.xml");
	SanPhamDAO db = (SanPhamDAO) context.getBean("dbsanpham");
	
	@RequestMapping("/giohang")
	public String gioHang(HttpSession session) {
		session.setAttribute("SoLuongCon", 1);
		return "GioHang";
	}
	
	@RequestMapping("/giohang/them/{id}")
	public String themGioHang(HttpSession session, @PathVariable int id, ModelMap modelMap) {
		HashMap<Integer, GioHang> gioHang = (HashMap<Integer, GioHang>) session.getAttribute("GioHang");
        SanPham sp = db.getSanPhamById(id);
        int soLuongCon = db.getSoLuong(id);
        gioHang = GioHangService.tangGioHang(gioHang, sp, id, 1,soLuongCon);
        int total = GioHangService.tongGiaTriGioHang(gioHang);
		int totalSL = GioHangService.tongSoLuongGioHang(gioHang);
		session.setAttribute("TongGiaTriDonHang", total);
		session.setAttribute("GioHang", gioHang);
		session.setAttribute("TongSoLuongGioHang", totalSL);
		return "GioHang";
	}
	
	@RequestMapping("/giohang/giam/{id}")
	public String giamSoLuong(HttpSession session, @PathVariable int id, ModelMap modelMap) {
		HashMap<Integer, GioHang> gioHang = (HashMap<Integer, GioHang>) session.getAttribute("GioHang");
        SanPham sp = db.getSanPhamById(id);
        int soLuongCon = db.getSoLuong(id);
        gioHang = GioHangService.giamGioHang(gioHang, sp, id, 1, soLuongCon);
        int total = GioHangService.tongGiaTriGioHang(gioHang);
		int totalSL = GioHangService.tongSoLuongGioHang(gioHang);
		session.setAttribute("TongGiaTriDonHang", total);
		session.setAttribute("GioHang", gioHang);
		session.setAttribute("TongSoLuongGioHang", totalSL);
		
		return "GioHang";
	}
	
	@RequestMapping("/giohang/xoa/{id}")
	public String xoaSanPham(HttpSession session, @PathVariable int id, ModelMap modelMap){
		HashMap<Integer, GioHang> gioHang = (HashMap<Integer, GioHang>) session.getAttribute("GioHang");
        gioHang = GioHangService.xoaGioHang(gioHang, id);
        int total = GioHangService.tongGiaTriGioHang(gioHang);
		int totalSL = GioHangService.tongSoLuongGioHang(gioHang);
		session.setAttribute("TongGiaTriDonHang", total);
		session.setAttribute("GioHang", gioHang);
		session.setAttribute("TongSoLuongGioHang", totalSL);
        return "GioHang";
	}
}
