package controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import model.ProductDao;

@Controller
@RequestMapping("/seller/product")
public class ProductRegController {

	@Autowired
	ProductDao pdao;
	
	@Autowired
	ServletContext application;
	
	@RequestMapping("/productReg")
	public ModelAndView register (){
		ModelAndView mav=new ModelAndView("t_el_seller");
		mav.addObject("section", "seller/product/productReg");
		List<Map> list=new ArrayList<>();
		list=pdao.largecate();
		System.out.println("시발"+list);
		mav.addObject("large_cate", list);
		List<Map> list1=pdao.originlist();
		mav.addObject("originlist",list1);
		
		return mav;
	}
	@RequestMapping("/productRegExec")
	public ModelAndView registerExec(@RequestParam Map map,@RequestParam(name="pro_img") MultipartFile f,
			HttpSession session	) throws IllegalStateException, IOException {
		System.out.println("넘어온 파라미터는 ?? "+ map);
		String path = application.getRealPath("/img/pro_img");
		File dir=new File(path);
		if(!dir.exists()) {
			dir.mkdirs();
		}
		String uuid=UUID.randomUUID().toString().substring(0, 4);
		System.out.println(uuid);
		boolean rst= false;
		if(f.getContentType().startsWith("image")) {
			File dst = new File(dir,uuid);
			if(dst.exists())dst.delete();
			f.transferTo(dst);
			rst=true;
		}
		ModelAndView mav=new ModelAndView("t_el_seller");
		mav.addObject("rst", rst);
		mav.addObject("section", "seller/product/productRegExec");
		return mav;
	}
	
	@RequestMapping("/smallcate")
	@ResponseBody 
	public Map samllcategory(@RequestParam(name="large_cate") String num) {
		System.out.println("파라미터 ??" + num);
		Map map=new HashMap<>();
		List<Map> list=new ArrayList<>();
		list=pdao.smallcate(num);
		map.put("list", list);
		System.out.println(list);
		System.out.println("아아아 123");
		return map;
		
	}
}
