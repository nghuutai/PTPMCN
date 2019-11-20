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
		System.out.println(1);
		HashMap<Integer, GioHang> gioHang = (HashMap<Integer, GioHang>) session.getAttribute("GioHang");
		

        SanPham sp = db.getSanPhamById(id);
        int soLuongCon = db.getSoLuong(id);
        if (sp != null) {
            GioHang cart = gioHang.get(id);
            cart.setSanPham(sp);
            cart.setSoLuong(cart.getSoLuong() + 1);
            cart.setSoLuongCon(soLuongCon);
            gioHang.put(id, cart);
        }
        int total = 0;
		int totalSL = 0;
		for(GioHang cart:gioHang.values()) {
			int dg = cart.getSanPham().getDonGia();
			int sl = cart.getSoLuong();
			int tt = dg * sl;
			total = total + tt;
			totalSL = totalSL + sl;
		}
		session.setAttribute("TongGiaTriDonHang", total);
		session.setAttribute("GioHang", gioHang);
		session.setAttribute("TongSoLuongGioHang", totalSL);
		return "GioHang";
	}
	
	@RequestMapping("/giohang/giam/{id}")
	public String giamSoLuong(HttpSession session, @PathVariable int id, ModelMap modelMap) {
		HashMap<Integer, GioHang> gioHang = (HashMap<Integer, GioHang>) session.getAttribute("GioHang");
		
		
        SanPham sp = db.getSanPhamById(id);
        if (sp != null) {
        	GioHang cart = gioHang.get(id);
            cart.setSanPham(sp);
            cart.setSoLuong(cart.getSoLuong() - 1);
            gioHang.put(id, cart);
        }
        int total = 0;
		int totalSL = 0;
		for(GioHang cart:gioHang.values()) {
			int dg = cart.getSanPham().getDonGia();
			int sl = cart.getSoLuong();
			int tt = dg * sl;
			total = total + tt;
			totalSL = totalSL + sl;
		}
		session.setAttribute("TongGiaTriDonHang", total);
		session.setAttribute("GioHang", gioHang);
		session.setAttribute("TongSoLuongGioHang", totalSL);
		
		return "GioHang";
	}
	
	@RequestMapping("/giohang/xoa/{id}")
	public String xoaSanPham(HttpSession session, @PathVariable int id, ModelMap modelMap){
		HashMap<Integer, GioHang> gioHang = (HashMap<Integer, GioHang>) session.getAttribute("GioHang");
        if (gioHang == null) {
        	gioHang = new HashMap<Integer,GioHang>();
        }
        if (gioHang.containsKey(id)) {
        	gioHang.remove(id);
        }
        int total = 0;
		int totalSL = 0;
		for(GioHang cart:gioHang.values()) {
			int dg = cart.getSanPham().getDonGia();
			int sl = cart.getSoLuong();
			int tt = dg * sl;
			total = total + tt;
			totalSL = totalSL + sl;
		}
		session.setAttribute("TongGiaTriDonHang", total);
		session.setAttribute("GioHang", gioHang);
		session.setAttribute("TongSoLuongGioHang", totalSL);
        return "GioHang";
	}
}
