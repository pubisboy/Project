package model;

import java.util.List;
import java.util.Map;

public interface AdminDao {

	public boolean login(Map<String, Object> map);
	public int doc();
	public int dpc();
	public int duc();
	public int auc();
	public int luc();
	public int getCnt(String mapper);
	public boolean putValues(String mapper, Map map);
	public List<Map> getValues(String mapper);
	public Map getValues(String mapper, int val);
	public List<Map> getValues(String mapper, String table);
	public List<Map> getValues(String mapper, Map map);
	public boolean putImages(List list);
	public List getInfo_company();
	public boolean updateValues(List list);
	public boolean delInfo_company(String name);
	public int plusInfo_company(String name);
	public List getUuid_notice_img();
}