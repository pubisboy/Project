package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/seller/product")
public class ProductRegController {

	@RequestMapping("/productReg")
	public ModelAndView register (){
		ModelAndView mav=new ModelAndView("t_el_seller");
		mav.addObject("section", "seller/product/productReg");
		
		
		
		return mav;
	}
}
