package controller;

import java.io.File;
import java.io.IOException;
import java.math.BigDecimal;
import java.text.DecimalFormat;
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
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import model.AdminDao;
import paging.Paging;

@Controller
@RequestMapping("/admin/management")
public class AdminManagementController {
	
	@Autowired
	AdminDao ad;
	
	@Autowired
	ServletContext application;
	
	@Autowired
	Paging pg;

	@RequestMapping("/notice/notice_list.ja")
	public String notice_list(@RequestParam Map params, @RequestParam(name="p", defaultValue="1") Integer p, Map map){
		
		String val = null;
		if(params.get("value") != null){
			val = (String)params.get("value");
			if(val.length() > 0){
				String tmp = "%"+val+"%";
				params.put("value", tmp);
			}else{
				params.put("value", "%");
			}
		}
		
		pg.setDefaultSetting(10, 10);
		int rows = ad.getCount_notice(params);
		pg.setNumberOfRecords(rows);
		Map paging = pg.calcPaging(p, rows);
		Map bt = pg.calcBetween(p);
		params.put("start", bt.get("start"));
		params.put("end", bt.get("end"));
		
		List<Map> rst = ad.getValues("admin.getList_notice", params);
		System.out.println("params의 값은 "+params);
		List state = ad.getTarget_notice();
		
		DecimalFormat df = new DecimalFormat("#,###");
		String total = df.format(rows);
		map.put("total", total);
		map.put("list", rst);
		map.put("target", state);
		map.put("paging", paging);
		params.put("value", val);
		map.put("params", params);
		map.put("section", "/management/notice/notice_list");
		return "ad_management";
	}
	
	@RequestMapping("/notice/notice_detail.ja")
	public String notice_detail(@RequestParam(name="num") Integer num, Map map){
		Map rst = ad.getValues("admin.getDetail_notice", num);
		map.put("list", rst);
		map.put("section", "/management/notice/notice_detail");
		return "ad_management";
	}
	
	@RequestMapping("/notice/notice_write.ja")
	public String notice_write(Map map){
		List<Map> rst = ad.getValues("admin.getValues_All", "target");
		map.put("list", rst);
		map.put("section", "/management/notice/notice_write");
		return "ad_management";
	}
	
	@RequestMapping("/notice/notice_writeExec.ja")
	@ResponseBody
	public Map notice_writeExec(@RequestParam Map params){
		Map map = new HashMap<>();
		boolean b = ad.putValues("admin.put_notice", params);
		map.put("text", b);
		if(b){
			System.out.println(params.get("content"));
			String con = (String)params.get("content");
			if(con.contains("src")){
				String[] cons = con.split("\"");
				List list = new ArrayList<>(); 
				for(String c : cons){
					if(c.contains("/admin/resources")){
						System.out.println("src : "+c);
						String[] srcs = c.split("/");
						Map m = new HashMap<>();
						m.put("src", srcs[srcs.length-1]);
						list.add(m);
					}
				}
				boolean bb = ad.putImages(list);
				map.put("img", bb);
				if(bb){
					del_tempImg();
				}
			}
		}
		return map;
	}
	
	public void del_tempImg(){
		List li = ad.getUuid_notice_img();
		/*List srcs = new ArrayList<>();
		Iterator<String> it = li.iterator();
		int i = 0;
		while(it.hasNext()){
			String[] s = it.next().split("/");
			String rst = s[s.length-1];
			srcs.add(rst);
		}*/
		System.out.println(li);
		String path = application.getRealPath("/admin/resources");
		File dir = new File(path);
		if(dir.exists()){
			String[] tmp = dir.list();
			System.out.println(Arrays.toString(tmp));
			for(String s : tmp){
				if(!li.contains(s)){
					File file = new File(String.format("%s/%s", path, s));
					file.delete();
				}
			}
		}
	}
	
	@RequestMapping("/notice/notice_modify.ja")
	public String notice_modify(@RequestParam(name="num") Integer num, Map map){
		List<Map> list = ad.getDetatil_notice(num);
		List<Map> target = ad.getValues("admin.getValues_All", "target");
		map.put("list", list);
		map.put("target", target);
		map.put("section", "/management/notice/notice_modify");
		return "ad_management";
	}
	
	@RequestMapping("/notice/notice_modifyExec.ja")
	@ResponseBody
	public Map notice_modifyExec(@RequestParam Map params){
		System.out.println("notice 수정 : "+params);
		Map map = new HashMap<>();
		boolean b = ad.putValues("admin.updateNotice", params);
		map.put("text", b);
		if(b){
			int num = Integer.parseInt((String)params.get("num"));
			System.out.println("notice num : "+num);
			ad.delNotice_img(num);
			// System.out.println(params.get("content"));
			String con = (String)params.get("content");
			if(con.contains("src")){
				String[] cons = con.split("\"");
				List list = new ArrayList<>(); 
				for(String c : cons){
					if(c.contains("/admin/resources")){
						System.out.println("src : "+c);
						String[] srcs = c.split("/");
						Map m = new HashMap<>();
						m.put("src", srcs[srcs.length-1]);
						list.add(m);
					}
				}
				System.out.println("update list : "+list);
				Map m = new HashMap<>();
				m.put("list", list);
				m.put("num", num);
				boolean bb = ad.updateImage_notice(m);
				map.put("img", bb);
				if(bb){
					del_tempImg();
				}
			}
		}
		return map;
	}
	
	@RequestMapping("/notice/upload.j")
	public ModelAndView upload(@RequestParam(name="upload") MultipartFile f, @RequestParam Map param) throws IllegalStateException, IOException{
		ModelAndView mav = new ModelAndView("/admin/management/notice/notice_img_result");
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
			@RequestParam(name="nums", required=false) Integer[] nums, @RequestParam(name="names_origin", required=false) String[] names_origin){
		if(params.size() > 0){
			System.out.println("params : "+params.toString());
			System.out.println(Arrays.toString(names));
			System.out.println(Arrays.toString(names_origin));
			System.out.println(Arrays.toString(nums));
	
			List list = new ArrayList<>();
			for(int i = 0; i < names.length; i ++){
				Map m = new HashMap<>();
				m.put("num", nums[i]);
				m.put("name", names[i]);
				m.put("val", params.get(names_origin[i]));
				System.out.println("num : "+m.get("num"));
				System.out.println("name : "+names[i]);
				System.out.println("val : "+params.get(names_origin[i]));
				list.add(m);
			}
			System.out.println("list : "+list);
			boolean b = ad.updateValues_info_company(list);
		}
		return "redirect:/admin/management/information/company.ja";
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
	public int plusInfoCompany(@RequestParam(name="plus") String name){
		int rst = ad.plusInfo_company(name);
		return rst;
	}
	
	@RequestMapping("/information/terms.ja")
	public String terms(@RequestParam Map params, @RequestParam(name="p", defaultValue="1") Integer p, Map map){
		pg.setDefaultSetting(10, 5);
		
		System.out.println("params : "+params);
		
		String val = null;
		if(params.get("value") != null){
			val = (String)params.get("value");
			if(val.length() > 0){
				String tmp = "%"+val+"%";
				params.put("value", tmp);
			}else{
				params.put("value", "%");
			}
		}
		
		System.out.println("params의 value : "+params.get("value"));
		int rows = ad.getCount_terms(params);
		pg.setNumberOfRecords(rows);
		Map paging = pg.calcPaging(p, rows);
		// System.out.println("paging : "+paging);
		Map se = pg.calcBetween(p);
		params.put("start", se.get("start"));
		params.put("end", se.get("end"));
		
		List list = ad.getTerms(params);
		
		DecimalFormat df = new DecimalFormat("#,###");
		String total = df.format(rows);
		map.put("total", total);
		
		map.put("list", list);
		map.put("paging", paging);
		map.put("section", "/management/information/terms");
		params.put("value", val);
		map.put("params", params);
		
		return "ad_management";
	}
	
	@RequestMapping("/information/terms_detail.ja")
	public String terms_detail(@RequestParam(name="num") Integer num, Map map){
		System.out.println("num : "+num);
		List list = ad.getDetail_terms(num);
		map.put("list", list);
		// System.out.println(list);
		map.put("section", "/management/information/terms_detail");
		return "ad_management";
	}
	
	@RequestMapping("/information/terms_modify.ja")
	public String terms_modify(@RequestParam(name="num") Integer num, Map map){
		List list = ad.getDetail_terms(num);
		map.put("list", list);
		map.put("section", "/management/information/terms_modify");
		return "ad_management";
	}
	
	@RequestMapping("/information/terms_modifyExec.ja")
	public String terms_modifyExec(@RequestParam Map params, Map map){
		System.out.println("params : "+params);
		boolean b = ad.updateValues_terms(params);
		map.put("rst", b);
		map.put("num", params.get("num"));
		map.put("t", "/information/terms_detail.ja?num="+params.get("num"));
		map.put("f", "/information/terms_modify.ja?num="+params.get("num"));
		return "/admin/result";
	}
	
	@RequestMapping("/information/terms_plus.ja")
	public String terms_plus(Map map){
		map.put("section", "/management/information/terms_plus");
		return "ad_management";
	}
	
	@RequestMapping("/information/terms_plusExec.ja")
	public String terms_plusExec(@RequestParam Map params, Map map){
		System.out.println("params : "+params);
		boolean b = ad.plusTerms(params);
		map.put("rst", b);
		map.put("t", "/information/terms.ja");
		map.put("f", "/information/terms_plus.ja");
		return "/admin/result";
	}
	
	@RequestMapping("/information/terms_del.ja")
	public String terms_del(@RequestParam(name="num") Integer num, Map map){
		boolean b = ad.delTerms(num);
		map.put("rst", b);
		map.put("t", "/information/terms.ja");
		map.put("f", "/information/terms_detail.ja?num"+num);
		return "/admin/result";
	}
	
	@RequestMapping("/notice/notice_del.ja")
	public String notice_del(@RequestParam(name="num") Integer num, Map map){
		boolean b = ad.delNotice(num);
		// if(b){
			// b = ad.delNotice_img(num);
			if(b){
				del_tempImg();
			}
		// }
		map.put("rst", b);
		map.put("t", "/notice/notice_list.ja");
		map.put("f", "/notice/notice_detail.ja?num"+num);
		return "/admin/result";
	}
	
	@RequestMapping("/counsel/counsel_user_list.ja")
	public String counsel_user_list(@RequestParam Map params, @RequestParam(name="p", defaultValue="1") Integer p, Map map, HttpSession session){
		if(session.getAttribute("pre") != null){
			System.out.println("pre가 있다.");
			Map pa = (Map)session.getAttribute("pre");
			System.out.println("pre : "+pa);
			if(p == pa.get("p")){
				System.out.println("p : "+p+" / "+"pa.get : "+pa.get("p"));
				params = pa; 
			}
			session.removeAttribute("pre");
		}
		/*if(params.get("state") != null){
			String s = (String)params.get("state");
			if(s.equals("")){
				params.remove("type");
				params.remove("value");
			}
		}*/
		
		String val = null;
		if(params.get("value") != null){
			val = (String)params.get("value");
			if(val.length() > 0){
				String tmp = "%"+val+"%";
				params.put("value", tmp);
			}else{
				params.put("value", "%");
			}
		}
		if(params.get("reply") != null){
			if(params.get("reply") instanceof Integer){
				int i = Integer.parseInt((String)params.get("reply"));
				params.put("reply", i);
			}
		}
		
		pg.setDefaultSetting(10, 10);
		int rows = ad.getCount_counsel_user(params);
		pg.setNumberOfRecords(rows);
		Map paging = pg.calcPaging(p, rows);
		Map bt = pg.calcBetween(p);
		params.put("start", bt.get("start"));
		params.put("end", bt.get("end"));
		
		// System.out.println("params의 값은 "+params);
		List<Map> rst = ad.getList_counsel_user(params);
		// System.out.println("검색 결과는 : "+rst);
		List state = ad.getCounsel_category();
		
		String[] typesEn = "user_id,title".split(",");
		String[] typesKo = "아이디,제목".split(",");
		map.put("typesEn", typesEn);
		map.put("typesKo", typesKo);
		
		DecimalFormat df = new DecimalFormat("#,###");
		String total = df.format(rows);
		map.put("total", total);
		map.put("list", rst);
		map.put("state", state);
		map.put("paging", paging);
		params.put("value", val);
		map.put("params", params);
		map.put("section", "/management/counsel/counsel_user_list");
		
		return "ad_management";
	}
	
	@RequestMapping("/counsel/counsel_user_detail.ja")
	public String counsel_user_detail(@RequestParam Map params, @RequestParam(name="num") Integer num, Map map, HttpSession session){
		List list = ad.getCounsel_user_detail(num);
		Map li = (Map)list.get(0);
		String uuid = (String)li.get("IMAGE_UUID");
		// System.out.println("uuid : "+uuid);
		// System.out.println("params : "+params);
		session.setAttribute("pre", params);
		map.put("params", params);
		map.put("list", list);
		// System.out.println("list : "+list);
		map.put("section", "/management/counsel/counsel_user_detail");
		return "ad_management";
	}
	
	@RequestMapping("/counsel/counsel_user_modify.ja")
	public String counsel_user_modify(@RequestParam(name="num") Integer num, Map map, HttpSession session){
		List list = ad.getCounsel_user_detail(num);
		Map li = (Map)list.get(0);
		BigDecimal bd = (BigDecimal)li.get("REPLY");
		int r = bd.intValue();
		String content = null;
		if(r == 0){
			content = (String)li.get("CONTENT");
			content += "<hr style='border: dotted 2px red;'><br/>";
		}else{
			content = (String)li.get("CONTENT");
		}
		map.put("params", session.getAttribute("pre"));
		map.put("list", list);
		map.put("content", content);
		map.put("section", "/management/counsel/counsel_user_modify");
		return "ad_management";
	}
	
	@RequestMapping("/counsel/counsel_user_modifyExec.ja")
	public String counsel_user_modifyExec(@RequestParam Map params, Map map, HttpSession session){
		// System.out.println("params : "+params);
		boolean b = ad.updateCounsel_user_detail(params);
		// System.out.println("b : "+b);
		Map pa = (Map)session.getAttribute("pre");
		map.put("params", pa);
		if(b){
			return "redirect:/admin/management/counsel/counsel_user_list.ja?p="+pa.get("p");
		}else{
			return "redirect:/admin/management/counsel/counsel_user_detail.ja?num="+params.get("num");
		}
	}
	
	
	
	
	
	@RequestMapping("/counsel/counsel_seller_list.ja")
	public String counsel_seller_list(@RequestParam Map params, @RequestParam(name="p", defaultValue="1") Integer p, Map map, HttpSession session){
		if(session.getAttribute("pre") != null){
			System.out.println("pre가 있다.");
			Map pa = (Map)session.getAttribute("pre");
			System.out.println("pre : "+pa);
			if(p == pa.get("p")){
				System.out.println("p : "+p+" / "+"pa.get : "+pa.get("p"));
				params = pa; 
			}
			session.removeAttribute("pre");
		}
		/*if(params.get("state") != null){
			String s = (String)params.get("state");
			if(s.equals("")){
				params.remove("type");
				params.remove("value");
			}
		}*/
		
		String val = null;
		if(params.get("value") != null){
			val = (String)params.get("value");
			if(val.length() > 0){
				String tmp = "%"+val+"%";
				params.put("value", tmp);
			}else{
				params.put("value", "%");
			}
		}
		if(params.get("reply") != null){
			if(params.get("reply") instanceof Integer){
				int i = Integer.parseInt((String)params.get("reply"));
				params.put("reply", i);
			}
		}
		
		pg.setDefaultSetting(10, 10);
		int rows = ad.getCount_counsel_seller(params);
		pg.setNumberOfRecords(rows);
		Map paging = pg.calcPaging(p, rows);
		Map bt = pg.calcBetween(p);
		params.put("start", bt.get("start"));
		params.put("end", bt.get("end"));
		
		System.out.println("params의 값은 "+params);
		List<Map> rst = ad.getList_counsel_seller(params);
		System.out.println("검색 결과는 : "+rst);
		List state = ad.getCounsel_seller_category();
		
		String[] typesEn = "user_id,title".split(",");
		String[] typesKo = "아이디,제목".split(",");
		map.put("typesEn", typesEn);
		map.put("typesKo", typesKo);
		
		DecimalFormat df = new DecimalFormat("#,###");
		String total = df.format(rows);
		map.put("total", total);
		map.put("list", rst);
		map.put("state", state);
		map.put("paging", paging);
		params.put("value", val);
		map.put("params", params);
		map.put("section", "/management/counsel/counsel_seller_list");
		
		return "ad_management";
	}
	
	@RequestMapping("/counsel/counsel_seller_detail.ja")
	public String counsel_seller_detail(@RequestParam Map params, @RequestParam(name="num") Integer num, Map map, HttpSession session){
		List list = ad.getCounsel_seller_detail(num);
		Map li = (Map)list.get(0);
		String uuid = (String)li.get("IMAGE_UUID");
		System.out.println("uuid : "+uuid);
		System.out.println("params : "+params);
		session.setAttribute("pre", params);
		
		map.put("list", list);
		map.put("params", params);
		
		System.out.println("list : "+list);
		map.put("section", "/management/counsel/counsel_seller_detail");
		return "ad_management";
	}
	
	@RequestMapping("/counsel/counsel_seller_modify.ja")
	public String counsel_seller_modify(@RequestParam(name="num") Integer num, Map map, HttpSession session){
		List list = ad.getCounsel_seller_detail(num);
		Map li = (Map)list.get(0);
		BigDecimal bd = (BigDecimal)li.get("REPLY");
		int r = bd.intValue();
		String content = null;
		if(r == 0){
			content = (String)li.get("CONTENT");
			content += "<hr style='border: dotted 2px red;'><br/>";
		}else{
			content = (String)li.get("CONTENT");
		}
		map.put("params", session.getAttribute("pre"));
		map.put("list", list);
		map.put("content", content);
		map.put("section", "/management/counsel/counsel_seller_modify");
		return "ad_management";
	}
	
	@RequestMapping("/counsel/counsel_seller_modifyExec.ja")
	public String counsel_seller_modifyExec(@RequestParam Map params, Map map, HttpSession session){
		System.out.println("params : "+params);
		boolean b = ad.updateCounsel_seller_detail(params);
		System.out.println("b : "+b);
		Map pa = (Map)session.getAttribute("pre");
		map.put("params", pa);
		if(b){
			return "redirect:/admin/management/counsel/counsel_seller_list.ja?p="+pa.get("p");
		}else{
			return "redirect:/admin/management/counsel/counsel_seller_detail.ja?num="+params.get("num");
		}
	}
	
	@RequestMapping("/popup/popup_list.ja")
	public String popup_list(@RequestParam Map params, @RequestParam(name="p", defaultValue="1") Integer p, Map map){
		String val = null;
		if(params.get("value") != null){
			val = (String)params.get("value");
			if(val.length() > 0){
				String tmp = "%"+val+"%";
				params.put("value", tmp);
			}else{
				params.put("value", "%");
			}
		}
		
		pg.setDefaultSetting(10, 10);
		int rows = ad.getPopup_list_Count(params);
		pg.setNumberOfRecords(rows);
		Map paging = pg.calcPaging(p, rows);
		Map bt = pg.calcBetween(p);
		params.put("start", bt.get("start"));
		params.put("end", bt.get("end"));
		
		List<Map> rst = ad.getPopup_list(params);
		
		DecimalFormat df = new DecimalFormat("#,###");
		String total = df.format(rows);
		map.put("total", total);
		map.put("list", rst);
		map.put("paging", paging);
		params.put("value", val);
		
		map.put("params", params);
		map.put("section", "/management/popup/popup_list");
		return "ad_management";
	}
	
	@RequestMapping("/popup/popup_switch.ja")
	public ModelAndView popup_switch(@RequestParam Map params){
		
		if(!(params.get("p") instanceof Integer)){
			params.put("p", 1);
		}
		ad.updatePopup_onoff(params);
		ModelAndView mv= new ModelAndView("redirect:/admin/management/popup/popup_list.ja");
		mv.addAllObjects(params);
		return mv;
	}
	
	@RequestMapping("/popup/popup_write.ja")
	public String popup_write(@RequestParam Map params, Map map){
		List clist = ad.getCupon_list();
		map.put("cupon", clist);
		map.put("section", "/management/popup/popup_write");
		return "ad_management";
	}
	
	@RequestMapping("/popup/popup_writeExec.ja")
	public ModelAndView popup_writeExec(@RequestParam Map params){
		System.out.println("params : "+params);
		boolean b = ad.putPopup(params);
		System.out.println("성공 : "+b);
		ModelAndView mv = new ModelAndView();
		if(b){
			mv.setViewName("redirect:/admin/management/popup/popup_list.ja");
		}else{
			mv.setViewName("redirect:/admin/management/popup/popup_write.ja");
		}
		return mv;
	}
	
	@RequestMapping("/popup/popup_detail.ja")
	public ModelAndView popup_detail(@RequestParam Map params){
		System.out.println("params : "+params);
		ModelAndView mv = new ModelAndView("ad_management");
		List li = ad.getPopup_detail(params);
		System.out.println("list는 "+li);
		mv.addObject("list", li);
		mv.addObject("params", params);
		mv.addObject("section", "/management/popup/popup_detail");
		return mv;
	}
	
	@RequestMapping("/popup/popup_modify.ja")
	public ModelAndView popup_modify(@RequestParam Map params){
		System.out.println("modify params : "+params);
		ModelAndView mv = new ModelAndView("ad_management");
		List li = ad.getPopup_detail(params);
		System.out.println("li : "+li);
		List clist = ad.getCupon_list();
		mv.addObject("cupon", clist);
		mv.addObject("list", li);
		mv.addObject("params", params);
		mv.addObject("section", "/management/popup/popup_modify");
		return mv;
	}
	
	@RequestMapping("/popup/popup_modifyExec.ja")
	public ModelAndView popup_modifyExec(@RequestParam Map params){
		System.out.println("modifyExec params : "+params);
		boolean b = ad.updatePopup(params);
		System.out.println("popup update : "+b);
		ModelAndView mv = new ModelAndView("redirect:/admin/management/popup/popup_list.ja");
		mv.addAllObjects(params);
		return mv;
	}
	
	@RequestMapping("/cupon/cupon_list.ja")
	public ModelAndView cupon_list(@RequestParam Map params, @RequestParam(name="p", defaultValue="1") Integer p){
		ModelAndView mv = new ModelAndView("ad_management");
		System.out.println("params : "+params);
		pg.setDefaultSetting(10, 5);
		
		int rows = ad.getCupon_base_count(params);
		pg.setNumberOfRecords(rows);
		Map paging = pg.calcPaging(p, rows);
		Map se = pg.calcBetween(p);
		params.put("start", se.get("start"));
		params.put("end", se.get("end"));
		
		List list = ad.getCupon_base_list(params);
		
		DecimalFormat df = new DecimalFormat("#,###");
		String total = df.format(rows);
		mv.addObject("total", total);
		
		mv.addObject("list", list);
		mv.addObject("paging", paging);
		mv.addObject("params", params);
		mv.addObject("section", "/management/cupon/cupon_list");
		return mv;
	}
	
	@RequestMapping("/cupon/cupon_modify.ja")
	@ResponseBody
	public Map cupon_modify(@RequestParam Map params){
		Map map = null;
		System.out.println("ajax params : "+params);
		boolean b = ad.updateCupon_base(params);
		System.out.println("성공 ? "+b);
		if(b){
			List li = ad.getCupon_base_one(params);
			System.out.println(li);
			map = (Map)li.get(0);
		}
		return map;
	}
	
	@RequestMapping("/cupon/cupon_del.ja")
	@ResponseBody
	public Map cupon_del(@RequestParam Map params){
		System.out.println("ajax params : "+params);
		boolean b = ad.delCupon_base(params);
		System.out.println("성공 ? "+b);
		Map map = new HashMap<>();
		map.put("b", b);
		return map;
	}
}
