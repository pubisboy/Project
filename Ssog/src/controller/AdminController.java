package controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import model.AdminDao;

@Controller
@RequestMapping("/admin")
public class AdminController {

	@Autowired
	AdminDao ad;

	@RequestMapping("/login.ja")
	public String login() {
		return "/admin/login/login";
	}

	@RequestMapping("/loginExec.ja")
	public String loginExec(HttpSession session, @RequestParam Map<String, Object> params) {
		boolean b = ad.login(params);
		System.out.println("b : "+b);
		if (b) {
			session.setAttribute("admin", (String)params.get("id"));
			System.out.println("session의 admin : "+session.getAttribute("admin"));
			return "redirect:/admin/index.ja";
		} else {
			return "/admin/login/login";
		}
	}

	@RequestMapping({"/","/index.ja"})
	public String main(Map map) {
		// doc = daily order count
		map.put("doc", ad.doc());
		map.put("dpc", ad.dpc());
		map.put("duc", ad.duc());
		map.put("auc", ad.auc());
		map.put("luc", ad.luc());
		System.out.println("main 입장");
		return "ad_main";
	}
	
	@RequestMapping("/management.ja")
	public String management(Map map){
		map.put("section", "/section/main");
		return "ad_management";
	}
	
	@RequestMapping("/notice/notice_list.ja")
	public String notice_list(Map map){
		// List<Map> rst = ad.getValues("getValues_All", "notice");
		List<Map> rst = ad.getValues("getList_notice");
		map.put("list", rst);
		map.put("section", "/notice/notice_list");
		return "ad_management";
	}
	
	@RequestMapping("/notice/notice_detail.ja")
	public String notice_detail(@RequestParam(name="num") Integer num, Map map){
		Map rst = ad.getValues("getDetail_notice", num);
		map.put("list", rst);
		map.put("section", "/notice/notice_detail");
		return "ad_management";
	}
	
	@RequestMapping("/notice/notice_write.ja")
	public String notice_write(Map map){
		List<Map> rst = ad.getValues("getValues_All", "target");
		map.put("list", rst);
		map.put("section", "/notice/notice_write");
		return "ad_management";
	}
	
	@RequestMapping("/notice/notice_writeExec.ja")
	@ResponseBody
	public Map notice_writeExec(@RequestParam Map params){
		Map map = new HashMap<>();
		boolean b = ad.putValues("put_notice", params);
		map.put("text", b);
		if(b){
			System.out.println(params.get("content"));
			String con = (String)params.get("content");
			if(con.contains("src")){
				String[] cons = con.split("\"");
				List list = new ArrayList<>(); 
				for(String c : cons){
					// System.out.println(c);
					if(c.startsWith("/admin/resources")){
						list.add(c);
					}
				}
				boolean bb = ad.putImages(list);
				map.put("img", bb);
			}
		}
		return map;
	}
	
	@Autowired
	ServletContext application;
	
	@RequestMapping("/notice/upload.j")
	public ModelAndView upload(@RequestParam(name="upload") MultipartFile f, @RequestParam Map param) throws IllegalStateException, IOException{
		ModelAndView mav = new ModelAndView("/admin/notice/notice_img_result");
		System.out.println(param);
		System.out.println(f.getContentType());
		System.out.println(f.getName());
		System.out.println(f.getOriginalFilename());
		System.out.println(f.isEmpty());
		
		String ofn = f.getOriginalFilename();
		
		// 저장경로 필요
		if(!f.isEmpty() && f.getContentType().startsWith("image")){
			File dir = new File(application.getRealPath("/admin/resources"));
			System.out.println(dir.getPath());
			if(!dir.exists()){
				dir.mkdirs();
			}
			String uuid = UUID.randomUUID().toString();
			String fileName = uuid+"."+(ofn.substring(ofn.lastIndexOf(".")+1));
			
			File file = new File(dir, fileName);
			f.transferTo(file);
			mav.addObject("result", true);
			mav.addObject("imageUrl", "/admin/resources/"+fileName);
			mav.addObject("funcNum", param.get("CKEditorFuncNum")); // 반드시 필요하다. 정해진 규칙이다.
		}else{
			mav.addObject("result", false);
		}
		return mav;
	}
	
	@RequestMapping("/information/company.ja")
	public String infomation_company(Map map){
		map.put("list", ad.getInfo_company());
 		map.put("section", "/management/information/company");
		return "ad_management";
	}
	
	@RequestMapping("/information/companyModify.ja")
	public String information_companyModify(Map map){
		map.put("list", ad.getInfo_company());
		map.put("section", "/management/information/company_modify");
		return "ad_management";
	}
	
	@RequestMapping("/information/companyModifyExec.ja")
	public String information_companyModifyExec(@RequestParam Map params, Map map, @RequestParam(name="names", required=false) String[] names,
			@RequestParam(name="nums", required=false) Integer[] nums){
		System.out.println("params : "+params.toString());
		System.out.println(Arrays.toString(names));
		List list = new ArrayList<>();
		for(int i = 0; i < names.length; i ++){
			Map m = new HashMap<>();
			m.put("num", 1+i);
			m.put("name", names[i]);
			m.put("val", params.get(names[i]));
			System.out.println("num : "+m.get("num"));
			System.out.println("name : "+names[i]);
			System.out.println("val : "+params.get(names[i]));
			list.add(m);
		}
		boolean b = ad.updateValues(list);
		return "redirect:/admin/information/company.ja";
	}
	
	@RequestMapping("/information/getInfoCompany.ja")
	@ResponseBody
	public List getInfoCompany(){
		List list = ad.getInfo_company();
		return list;
	}
	
	@RequestMapping("/information/delInfoCompany.ja")
	@ResponseBody
	public boolean delInfoCompany(@RequestParam(name="del") String name){
		boolean b = ad.delInfo_company(name);
		return b;
	}
	
	@RequestMapping("/information/plusInfoCompany.ja")
	@ResponseBody
	public boolean plusInfoCompany(@RequestParam(name="plus") String name){
		boolean b = ad.plusInfo_company(name);
		return b;
	}
}