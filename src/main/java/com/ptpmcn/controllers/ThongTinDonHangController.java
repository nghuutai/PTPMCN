package com.ptpmcn.controllers;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ptpmcn.dao.ChiTietHoaDonDAO;
import com.ptpmcn.dao.HoaDonDAO;
import com.ptpmcn.dao.SanPhamDAO;
import com.ptpmcn.entity.*;

@Controller
public class ThongTinDonHangController {
	
	@RequestMapping("/donhang")
	public String thongTinDonHang() {
		return "ThongTinDonHang";
	}

	@RequestMapping("/dathang")
	public String datHang(ModelMap model, HttpSession session){
		HashMap<Integer, GioHang> gioHang = (HashMap<Integer, GioHang>) session.getAttribute("GioHang");
        if (gioHang == null) {
            gioHang = new HashMap<Integer, GioHang>();
        }
        HoaDon hoaDon = (HoaDon)session.getAttribute("hoaDon");
        ApplicationContext context = new ClassPathXmlApplicationContext("IoC.xml");
		HoaDonDAO db = (HoaDonDAO) context.getBean("databasehoadon");
		ChiTietHoaDonDAO db1 = (ChiTietHoaDonDAO) context.getBean("databasechitiethoadon");
		SanPhamDAO db2 = (SanPhamDAO) context.getBean("dbsanpham");
		int kq = db.addHoaDon(hoaDon);
		if(kq == 1) {
			hoaDon.setMaHoaDon(db.getMaHoaDon());
			for(GioHang cart:gioHang.values()) {
				ChiTietHoaDon chiTietHoaDon = new ChiTietHoaDon();
				chiTietHoaDon.setHoaDon(hoaDon);
				chiTietHoaDon.setSanPham(cart.getSanPham());
				chiTietHoaDon.setSoLuongMua(cart.getSoLuong());
				db1.addChiTietHoaDon(chiTietHoaDon);
				db2.suaSoLuong(cart.getSoLuong(),cart.getSanPham().getMaSanPham());
			}
		}

		

		gioHang = new HashMap<Integer, GioHang>();
		hoaDon = new HoaDon();
		session.setAttribute("TongGiaTriDonHang",0);
		session.setAttribute("GioHang", gioHang);
		session.setAttribute("TongSoLuongGioHang", 0);
		session.setAttribute("hoaDon", hoaDon);
		
		
		return "ThongBao";
	}
}
