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
}
