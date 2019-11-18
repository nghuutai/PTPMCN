package com.ptpmcn.controllers;

import java.util.List;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ptpmcn.dao.SanPhamDAO;
import com.ptpmcn.entity.SanPham;


@Controller
public class IndexController {

	@RequestMapping("/")
	public String loadIndex(ModelMap modelMap) {
		ApplicationContext context = new ClassPathXmlApplicationContext("IoC.xml");
		SanPhamDAO sp = (SanPhamDAO) context.getBean("dbsanpham");
		List<SanPham> listSanPhamMoi = sp.getListSanPhamMoi();
		modelMap.addAttribute("ListSanPhamMoi", listSanPhamMoi);
		List<SanPham> listSanPhamBanChay = sp.getListSanPhamBanChay();
		modelMap.addAttribute("ListSanPhamBanChay", listSanPhamBanChay);
		return "index";
	}
	
}
