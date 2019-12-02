package com.ptpmcn.controllers;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ptpmcn.dao.SanPhamDAO;
import com.ptpmcn.entity.GioHang;
import com.ptpmcn.entity.SanPham;

import service.GioHangService;





@Controller
public class ChiTietSanPhamController {
	ApplicationContext context = new ClassPathXmlApplicationContext("IoC.xml");
	SanPhamDAO db = (SanPhamDAO) context.getBean("dbsanpham");
	@RequestMapping("/chitietsanpham")
	public String chiTietSanPham(ModelMap model, @RequestParam("masp") int id, HttpSession session) {
		HashMap<Integer, GioHang> gioHang = (HashMap<Integer, GioHang>) session.getAttribute("GioHang");
		if (gioHang == null) {
            gioHang = new HashMap<Integer,GioHang>();
        }
		GioHang gh = GioHangService.getGioHang(gioHang, id);
		if(db != null) {
			if(gioHang.containsKey(id)) {
				gh = gioHang.get(id);
			}
		}
		SanPham sanPham = db.getSanPhamById(id);
		model.addAttribute("SanPham", sanPham);
		model.addAttribute("SessionCart", gh);
		return "ChiTietSanPham";
	}
	
	@PostMapping("/addchitietsanpham")
	public String themVaoGioHang(HttpSession session, @RequestParam("masp") int id, @RequestParam int soLuong, ModelMap model) {
		HashMap<Integer, GioHang> gioHang = (HashMap<Integer, GioHang>) session.getAttribute("GioHang");
		SanPham sp = db.getSanPhamById(id);
        int soLuongCon = db.getSoLuong(id);
        gioHang = GioHangService.tangGioHang(gioHang, sp, id, soLuong,soLuongCon);
        GioHang gh = GioHangService.getGioHang(gioHang, id);
        int total = GioHangService.tongGiaTriGioHang(gioHang);
		int totalSL = GioHangService.tongSoLuongGioHang(gioHang);
		session.setAttribute("TongGiaTriDonHang", total);
		session.setAttribute("GioHang", gioHang);
		session.setAttribute("TongSoLuongGioHang", totalSL);
		model.addAttribute("SanPham", sp);
		model.addAttribute("SessionCart", gh);
		return "ChiTietSanPham";
	}
}
