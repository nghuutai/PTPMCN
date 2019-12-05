package com.ptpmcn.controllers;

import java.util.List;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ptpmcn.dao.TaiKhoanDAO;
import com.ptpmcn.entity.TaiKhoan;

@Controller
public class AdminController {
	
	@RequestMapping("/admin")
	public String trangLoginAdmin() {
		
		return "LoginAdmin";
	}
	 
	@PostMapping("/admin")
	public String dangNhap(@RequestParam String tenDangNhap, String matKhau, ModelMap modelMap) {
		
		ApplicationContext context = new ClassPathXmlApplicationContext("IoC.xml");
		TaiKhoanDAO db = (TaiKhoanDAO) context.getBean("dbtaikhoan");
		TaiKhoan tk = new TaiKhoan();
		tk.setTaiKhoan(tenDangNhap);
		tk.setMatKhau(matKhau);
		boolean test = db.kiemtraLogin(tk);
		if(test) {
			modelMap.addAttribute("result", 1);
			return "LoginAdmin";
		}
		else {
			return "QLDanhMuc";
		}
	}
}

