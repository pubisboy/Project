package model;

import java.util.Map;

public interface AdminDao {

	public boolean login(Map<String, Object> map);
	public int doc();
	public int dpc();
	public int duc();
	public int auc();
	public int luc();
}