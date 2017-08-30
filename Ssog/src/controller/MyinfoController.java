package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/member")
public class MyinfoController {
	
	@RequestMapping("/myinfo/info.j")
	public ModelAndView info() {
		ModelAndView mav = new ModelAndView("t_el2");
		mav.addObject("section", "member/myinfo/info");
		return mav;
	}
}
