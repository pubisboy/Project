package controller;

import java.util.Map;

import org.apache.tiles.autotag.core.runtime.annotation.Parameter;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/product")
public class ProductController {

	@RequestMapping("/list.j")
	public ModelAndView pro_list(@Parameter Map param) {
		String category=(String) param.get("category");
		ModelAndView mav=new ModelAndView("t_base");
		mav.addObject("section","product/list");
		
		
		return mav;
	}
}
