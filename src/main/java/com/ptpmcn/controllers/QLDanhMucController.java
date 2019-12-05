package com.ptpmcn.controllers;

import java.util.List;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ptpmcn.dao.DanhMucDAO;
import com.ptpmcn.entity.DanhMuc;

@Controller
public class QLDanhMucController {
	ApplicationContext context = new ClassPathXmlApplicationContext("IoC.xml");
	DanhMucDAO db = (DanhMucDAO) context.getBean("dbdanhmuc");

	@GetMapping("/qldanhmuc")
	public String trangQLDanhMuc(ModelMap modelMap) {
		
		List<DanhMuc> listDanhMuc = db.getListDanhMuc();
		modelMap.addAttribute("listDanhMuc", listDanhMuc);
		modelMap.addAttribute("result", 1);
		return "QLDanhMuc";
	}
	
	
	@PostMapping("/qldanhmuc")
	public String themDanhMuc(@RequestParam String maDanhMuc, String tenDanhMuc, ModelMap modelMap) {
	
		DanhMuc dm = new DanhMuc();
		dm.setMaDanhMuc(maDanhMuc);
		dm.setTenDanhMuc(tenDanhMuc);
		/*String tendm="";
		tendm = db.layTenDanhMuc(maDanhMuc);
		if(tendm.isEmpty()) {
			db.themDanhMuc(dm);
		}else {
			modelMap.addAttribute("result", 0);
		}*/
		boolean kq = db.kiemTraMaDanhMuc(maDanhMuc);
		if (kq) {
			db.themDanhMuc(dm);
			modelMap.addAttribute("result", 1); // attribute cho alert
		}
		else {
			modelMap.addAttribute("result", 0);
		}
		//db.themDanhMuc(dm);
		List<DanhMuc> listDanhMuc = db.getListDanhMuc();
		modelMap.addAttribute("listDanhMuc", listDanhMuc);
		return "QLDanhMuc";
	}
	
	@GetMapping("/qldanhmuc/{id}")
	public String xoaDanhMuc(@PathVariable String id, ModelMap modelMap) {
		
		db.xoaDanhMuc(id);
		List<DanhMuc> listDanhMuc = db.getListDanhMuc();
		modelMap.addAttribute("listDanhMuc", listDanhMuc);
		modelMap.addAttribute("result", 1); // attribute cho alert
		return "QLDanhMuc";
	}
}