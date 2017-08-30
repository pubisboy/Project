package controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import model.AdminDao;

@Controller
@RequestMapping("/admin")
public class AdminController {
	
	@Autowired
	AdminDao ad;

	@RequestMapping("/login.ja")
	public String login(){
		return "/admin/login/login";
	}
	
	@RequestMapping("/loginExec.ja")
	public String loginExec(@RequestParam Map<String, Object> params){
		boolean b = ad.login(params);
		if(b){
			return "ad_base";
		}else{
			return "/admin/login/login";
		}
	}
}