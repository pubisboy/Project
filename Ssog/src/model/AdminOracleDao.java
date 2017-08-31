package model;

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
	
	public int doc(){
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
	}
}
