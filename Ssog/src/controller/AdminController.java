package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin")
public class AdminController {

	@RequestMapping("/login.ja")
	public String login(){
		System.out.println("접근 성공");
		return "/admin/login/login";
	}
}