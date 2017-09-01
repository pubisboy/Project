package model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AdminOracleDao implements AdminDao{

	@Autowired
	SqlSessionFactory factory;
	
	public boolean login(Map<String, Object> map){
		boolean b = false;
		SqlSession session = factory.openSession();
		try{
			int r = session.selectOne("admin.login", map);
			if(r > 0){
				b = true;
			}
		}catch(Exception e){
			System.out.println("error.login : "+e.toString());
		}finally{
			session.close();
		}
		return b;
	}
	
	/*public int doc(){
		SqlSession session = factory.openSession();
		try{
			return session.selectOne("admin.getCnt_dailyOrder");
		}catch(Exception e){
			System.out.println("error.doc : "+e.toString());
			return -1;
		}finally{
			session.close();
		}
	}
	
	public int dpc(){
		SqlSession session = factory.openSession();
		try{
			return session.selectOne("admin.getCnt_dailyPay");
		}catch(Exception e){
			System.out.println("error.dpc : "+e.toString());
			return -1;
		}finally{
			session.close();
		}
	}
	
	public int duc(){
		SqlSession session = factory.openSession();
		try{
			return session.selectOne("admin.getCnt_dailyUser");
		}catch(Exception e){
			System.out.println("error.duc : "+e.toString());
			return -1;
		}finally{
			session.close();
		}
	}
	
	public int auc(){
		SqlSession session = factory.openSession();
		try{
			return session.selectOne("admin.getCnt_allUser");
		}catch(Exception e){
			System.out.println("error.auc : "+e.toString());
			return -1;
		}finally{
			session.close();
		}
	}
	
	public int luc(){
		SqlSession session = factory.openSession();
		try{
			return session.selectOne("admin.getCnt_leaveUser");
		}catch(Exception e){
			System.out.println("error.luc : "+e.toString());
			return -1;
		}finally{
			session.close();
		}
	}*/
	
	public int getCnt(String mapper){
		SqlSession session = factory.openSession();
		try{
			return session.selectOne(mapper);
		}catch(Exception e){
			System.out.println(String.format("error.%s", mapper)+e.toString());
			return -1;
		}finally{
			session.close();
		}
	}
	
	public boolean putValues(String mapper, Map map){
		boolean b = false;
		SqlSession session = factory.openSession();
		try{
			int r = session.insert(mapper, map);
			if(r > 0){
				b = true;
			}
			session.commit();
		}catch(Exception e){
			System.out.println(String.format("error.%s", mapper)+e.toString());
			session.rollback();
		}finally{
			session.close();
		}
		return b;
	}
	
	public List<Map> getValues(String mapper){
		SqlSession session = factory.openSession();
		List<Map> rst = null;
		try{
			rst = session.selectList(mapper);
		}catch(Exception e){
			System.out.println(String.format("error.%s", mapper)+e.toString());
		}finally{
			session.close();
		}
		return rst;
	}
	
	public Map getValues(String mapper, int val){
		SqlSession session = factory.openSession();
		Map rst = null;
		try{
			rst = session.selectOne(mapper, val);
		}catch(Exception e){
			System.out.println(String.format("error.%s", mapper)+e.toString());
		}finally{
			session.close();
		}
		return rst;
	}
	
	public List<Map> getValues(String mapper, String table){
		SqlSession session = factory.openSession();
		List<Map> rst = null;
		Map map = new HashMap<>();
		map.put("table", table);
		try{
			rst = session.selectList(mapper, map);
		}catch(Exception e){
			System.out.println(String.format("error.%s", mapper)+e.toString());
		}finally{
			session.close();
		}
		return rst;
	}
	
	public List<Map> getValues(String mapper, Map map){
		SqlSession session = factory.openSession();
		List<Map> rst = null;
		try{
			rst = session.selectList(mapper, map);
		}catch(Exception e){
			System.out.println(String.format("error.%s", mapper)+e.toString());
		}finally{
			session.close();
		}
		return rst;
	}
}
