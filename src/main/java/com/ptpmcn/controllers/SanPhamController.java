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
	public String hienThiDanhSachSanPham(@RequestParam("madm") String id,@RequestParam("page") int page,ModelMap modelMap) {
		List<SanPham> listSanPham;
		int soSPTrenTrang = 8;
		int soTrang=1;
		int soLuongSP = 0;
		int trangHienTai = page > 1 ? page : 1;
		if(id.equals("0"))
		{
			soLuongSP = sp.demSoSanPham("0");
			soTrang = (int) Math.ceil(soLuongSP /(float)soSPTrenTrang );
			trangHienTai = trangHienTai > soTrang ? soTrang : trangHienTai;
			int viTriBatDau = (trangHienTai-1)*soSPTrenTrang;
			listSanPham = sp.layDSSanPhamTrenTrang("0",viTriBatDau,soSPTrenTrang);
		}
		else
			{
				soLuongSP = sp.demSoSanPham(id);
				soTrang = (int) Math.ceil(soLuongSP /(float)soSPTrenTrang );
				trangHienTai = trangHienTai > soTrang ? soTrang : trangHienTai;
				int viTriBatDau = (trangHienTai-1)*soSPTrenTrang;
				listSanPham = sp.layDSSanPhamTrenTrang(id,viTriBatDau,soSPTrenTrang);
			}
		modelMap.addAttribute("madm", id);
		modelMap.addAttribute("SoTrang", soTrang);
		modelMap.addAttribute("TrangHienTai", page);
		modelMap.addAttribute("ListSanPham", listSanPham);
		return "danhsachsanpham";
	}
	
	@RequestMapping("/themvaogiodssp")
	public String themVaoGio(HttpSession session, @RequestParam("madm") String id, @RequestParam("masp") int idsp, @RequestParam("page") int page,ModelMap modelMap) {
		HashMap<Integer, GioHang> arrGioHang = (HashMap<Integer, GioHang>)session.getAttribute("GioHang");
		SanPham sanPham = sp.getSanPhamById(idsp);	
		int soLuongCon = sp.getSoLuong(idsp);
		arrGioHang = GioHangService.tangGioHang(arrGioHang, sanPham, idsp, 1, soLuongCon);
		int total = GioHangService.tongGiaTriGioHang(arrGioHang);
		int totalSL = GioHangService.tongSoLuongGioHang(arrGioHang);
		List<SanPham> listSanPham;
		int soSPTrenTrang = 8;
		int soTrang=1;
		int soLuongSP = 0;
		int trangHienTai = page > 1 ? page : 1;
		if(id.equals("0"))
		{
			soLuongSP = sp.demSoSanPham("0");
			soTrang = (int) Math.ceil(soLuongSP /(float)soSPTrenTrang );
			trangHienTai = trangHienTai > soTrang ? soTrang : trangHienTai;
			int viTriBatDau = (trangHienTai-1)*soSPTrenTrang;
			listSanPham = sp.layDSSanPhamTrenTrang("0",viTriBatDau,soSPTrenTrang);
		}
		else
			{
				soLuongSP = sp.demSoSanPham(id);
				soTrang = (int) Math.ceil(soLuongSP /(float)soSPTrenTrang );
				trangHienTai = trangHienTai > soTrang ? soTrang : trangHienTai;
				int viTriBatDau = (trangHienTai-1)*soSPTrenTrang;
				listSanPham = sp.layDSSanPhamTrenTrang(id,viTriBatDau,soSPTrenTrang);
			}
		session.setAttribute("TongGiaTriDonHang", total);
		session.setAttribute("GioHang", arrGioHang);
		session.setAttribute("TongSoLuongGioHang", totalSL);
		modelMap.addAttribute("madm", id);
		modelMap.addAttribute("SoTrang", soTrang);
		modelMap.addAttribute("TrangHienTai", page);
		modelMap.addAttribute("ListSanPham", listSanPham);
		return "danhsachsanpham";
	}
	
}
