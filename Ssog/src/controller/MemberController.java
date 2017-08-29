package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MemberController {
	@RequestMapping({"/","/index.j"})
	public ModelAndView toIndex()	{
		ModelAndView mav = new ModelAndView("t_base");
		return mav;
	}
}
