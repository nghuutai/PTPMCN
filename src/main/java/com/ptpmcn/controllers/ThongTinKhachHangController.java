package com.ptpmcn.controllers;

import java.sql.Date;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ptpmcn.entity.GioHang;

import com.ptpmcn.entity.HoaDon;

@Controller
public class ThongTinKhachHangController {

	@RequestMapping("/thongtin")
	public String thongTinKhachHang() {
		return "ThongTinKhachHang";
	}
	
	@PostMapping("/thongtin")
	public String taoDonHang(ModelMap model, @RequestParam String tenKhachHang, @RequestParam String email, @RequestParam String soDienThoai, @RequestParam String diaChi, HttpSession session) {
		HashMap<Integer, GioHang> gioHang = (HashMap<Integer, GioHang>) session.getAttribute("GioHang");
        if (gioHang == null) {
            gioHang = new HashMap<Integer, GioHang>();
        }
        
        long millis=System.currentTimeMillis();  
        Date date=new Date(millis);  
        HoaDon hoaDon = new HoaDon();
        hoaDon.setTenKhachHang(tenKhachHang);
        hoaDon.setEmail(email);
        hoaDon.setSoDienThoai(soDienThoai);
        hoaDon.setDiaChi(diaChi);
        hoaDon.setNgayTao(date);
        hoaDon.setTinhTrangHoaDon(1);
        
		session.setAttribute("hoaDon", hoaDon);		
		session.setAttribute("TongGiaTriDonHang", session.getAttribute("TongGiaTriDonHang"));
		session.setAttribute("GioHang", gioHang);
		session.setAttribute("TongSoLuongGioHang", session.getAttribute("TongSoLuongGioHang"));
		return "ThongTinDonHang";
	}
}
