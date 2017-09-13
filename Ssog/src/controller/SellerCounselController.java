package controller;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import model.SellerCounselDao;
import model.SellerInfoDao;
import paging.Paging;

@Controller
@RequestMapping("/seller/counsel")
public class SellerCounselController {
	@Autowired
	SellerCounselDao sdao;
	
	@Autowired
	SellerInfoDao sidao;
	
	@Autowired
	Paging page;
	
	@Autowired
	ServletContext application;
	
	@RequestMapping("/write.j")
	public ModelAndView addNew(HttpSession session){
		ModelAndView mav = new ModelAndView("t_el_seller");
		String id = (String)session.getAttribute("seller_id");
		
		List<Map<String, Object>> cate = sdao.category();
		Map<String,Object> map = sidao.overlapChk(id, "id");
			mav.addObject("map", map);
			mav.addObject("cate", cate);
			mav.addObject("section", "seller/counsel/write"); 
		return mav;
	}
	
	@RequestMapping("/write_ok.j")
	public String insert(@RequestParam Map map, HttpSession session, 
			@RequestParam(name="f") MultipartFile f) throws IllegalStateException, IOException {
		ModelAndView mav = new ModelAndView("t_el_seller");
		
		String id = (String)session.getAttribute("seller_id");
		map.put("id", id);
		
		if(!f.isEmpty() && f.getContentType().startsWith("image")) {
			String path = application.getRealPath("/resource/img_counsel_seller");
			File dir = new File(path);
			if (!dir.exists()) {
				dir.mkdirs();
			}
			
			String file_uuid = UUID.randomUUID().toString();
			File target = new File(dir, file_uuid);
			
			map.put("file_uuid", file_uuid);
			f.transferTo(target);
			
			boolean rst = sdao.counselInsert(map);
			if(rst) {
				mav.addObject("imageUrl", "/resource/img_counsel_seller/"+file_uuid);
				mav.addObject("result", true);
			} else {
				System.out.println("counsel_seller insert 실패");
			}
		} else {
			mav.addObject("result", false);
		}
		return "redirect:/seller/counsel/list.j";
	}
	
	@RequestMapping("/list.j")
	public ModelAndView productList(@RequestParam Map map, HttpSession session, 
			@RequestParam(name="p", defaultValue="1") int p) {
		ModelAndView mav = new ModelAndView("t_el_seller");
		String id = (String)session.getAttribute("seller_id");
		map.put("id", id);
		
		int total = sdao.totalList(map);
		page.setDefaultSetting(2, 4); //줄 개수, 페이지 개수
		page.setNumberOfRecords(total);
		Map op = page.calcBetween(p);
		Map rst = page.calcPaging(p, total); //현재페이지, 총개수
			map.put("start", op.get("start"));
			map.put("end", op.get("end"));
//		System.out.println("op:" + op);
//		System.out.println("rst:" + rst);
//		System.out.println("map:" + map);
		
		List list = sdao.counselList(map);
		System.out.println(map);
		mav.addObject("section", "seller/counsel/list");
		mav.addObject("list", list);
		mav.addObject("p", p);
		mav.addObject("page", rst);
		mav.addObject("total", total);
		return mav;
	}
}
