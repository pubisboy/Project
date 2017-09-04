package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/cccenter")
public class CccenterController {
	
	@RequestMapping("/faq.j")
	public ModelAndView faq() {
		ModelAndView mav = new ModelAndView("t_el3");
		mav.addObject("section", "cccenter/faq");
		return mav;
	}
}
