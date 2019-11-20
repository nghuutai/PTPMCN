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




@Controller
public class IndexController {

	ApplicationContext context = new ClassPathXmlApplicationContext("IoC.xml");
	SanPhamDAO sp = (SanPhamDAO) context.getBean("dbsanpham");
	
	@RequestMapping("/")
	public String loadIndex(ModelMap modelMap) {
		List<SanPham> listSanPhamMoi = sp.getListSanPhamMoi();
		modelMap.addAttribute("ListSanPhamMoi", listSanPhamMoi);
		List<SanPham> listSanPhamBanChay = sp.getListSanPhamBanChay();
		modelMap.addAttribute("ListSanPhamBanChay", listSanPhamBanChay);
		return "Index";
	}
	
	@RequestMapping("/themvaogio")
	public String themVaoGio(HttpSession session, @RequestParam("masp") int id, ModelMap modelMap) {
		HashMap<Integer, GioHang> arrGioHang = (HashMap<Integer, GioHang>)session.getAttribute("GioHang");
		if (arrGioHang == null) {
            arrGioHang = new HashMap<Integer,GioHang>();
        }
		SanPham sanPham = sp.getSanPhamById(id);
		
		GioHang gioHang = new GioHang();
		if(sanPham != null) {
			if(arrGioHang.containsKey(id)) {
				gioHang = arrGioHang.get(id);
				gioHang.setSanPham(sanPham);
				gioHang.setSoLuong(gioHang.getSoLuong() + 1);
				arrGioHang.put(id, gioHang);
			}else {
				gioHang.setSanPham(sanPham);
				gioHang.setSoLuong(1);
				arrGioHang.put(id, gioHang);
			}
		}
		int total = 0;
		int totalSL = 0;
		for(GioHang gh:arrGioHang.values()) {
			int dg = gh.getSanPham().getDonGia();
			int sl = gh.getSoLuong();
			int tt = dg * sl;
			total = total + tt;
			totalSL = totalSL + sl;
		}
		
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
