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
public class SuaDanhMucController {

	ApplicationContext context = new ClassPathXmlApplicationContext("IoC.xml");
	DanhMucDAO db = (DanhMucDAO) context.getBean("dbdanhmuc");
	
	@GetMapping("suadanhmuc/{id}")
	public String trangSuaDanhMuc(@PathVariable String id, ModelMap modelMap) {
		
		DanhMuc dm = db.getDanhMucByID(id);
		modelMap.addAttribute("danhMuc",dm);
		modelMap.addAttribute("result", 0);
		return "SuaDanhMuc";
	}
	
	@PostMapping("suadanhmuc/{id}")
	public String suaDanhMuc(@RequestParam String maDanhMuc, @RequestParam String tenDanhMuc, ModelMap modelMap) {
		
		DanhMuc dm = new DanhMuc();
		dm.setMaDanhMuc(maDanhMuc);
		dm.setTenDanhMuc(tenDanhMuc);
		int kq = db.suaDanhMuc(dm);	
		modelMap.addAttribute("danhMuc",dm);
		modelMap.addAttribute("result", kq);
		return "SuaDanhMuc";
	}
}
