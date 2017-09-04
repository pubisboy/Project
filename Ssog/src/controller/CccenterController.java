package controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import model.CccenterDao;

@Controller
@RequestMapping("/cccenter")
public class CccenterController {
	@Autowired
	CccenterDao mdao;
	
	@RequestMapping("/faq.j")
	public ModelAndView faq() {
		ModelAndView mav = new ModelAndView("t_el3");
		mav.addObject("section", "cccenter/faq");
		List<Map> flist = mdao.faq();
		mav.addObject("flist", flist);
		return mav;
	}
}
