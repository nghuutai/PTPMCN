package com.ptpmcn.controllers;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ptpmcn.dao.TaiKhoanDAO;
import com.ptpmcn.entity.TaiKhoan;

@Controller
public class AdminController {
	ApplicationContext context = new ClassPathXmlApplicationContext("IoC.xml");
	TaiKhoanDAO db = (TaiKhoanDAO) context.getBean("dbtaikhoan");
	TaiKhoan tk = new TaiKhoan();

	@RequestMapping("/admin")
	public String trangLoginAdmin(ModelMap modelMap) {
		modelMap.addAttribute("LoginFail", true);
		return "LoginAdmin";
	}
	
	@PostMapping("/admin")
	public String dangNhap(@RequestParam String tenDangNhap, String matKhau,
			 ModelMap modelMap) throws ServletException, IOException {
		
		tk.setTaiKhoan(tenDangNhap);
		tk.setMatKhau(matKhau);
		boolean test = db.kiemtraLogin(tk); // true dang nhap sai
		if(test) {
			modelMap.addAttribute("LoginFail", false);
			return "LoginAdmin";
		}
		else {
			return "IndexAdmin";
		}
	}
}

