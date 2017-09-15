package model;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AdminOrderDao {

	@Autowired
	SqlSessionFactory factory;
	
	public List order_list(Map map){
		SqlSession session = factory.openSession();
		List rst = null;
		try{
			rst = session.selectList("admin_order.order_list", map);
		}catch(Exception e){
			System.out.println("error.order_list"+e.toString());
		}finally{
			session.close();
		}
		return rst;
	}
	
	public int order_list_count(Map map){
		SqlSession session = factory.openSession();
		int rst = -1;
		try{
			rst = session.selectOne("admin_order.order_list_count", map);
		}catch(Exception e){
			System.out.println("error.order_list_count"+e.toString());
		}finally{
			session.close();
		}
		return rst;
	}
	
	public List order_detail(int num){
		SqlSession session = factory.openSession();
		List rst = null;
		try{
			rst = session.selectList("admin_order.order_detail", num);
		}catch(Exception e){
			System.out.println("error.order_detail"+e.toString());
		}finally{
			session.close();
		}
		return rst;
	}
}