package com.ptpmcn.controllers;

import java.util.List;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ptpmcn.dao.SanPhamDAO;
import com.ptpmcn.entity.SanPham;

@Controller
public class SanPhamController {
	@GetMapping("/dssanpham")
	public String layDanhSachSanPham(@RequestParam("madm") String id,ModelMap modelMap) {
		ApplicationContext context = new ClassPathXmlApplicationContext("IoC.xml");
		SanPhamDAO sp = (SanPhamDAO) context.getBean("dbsanpham");
		
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
		
		return "danhsachsanpham";
	}
}
