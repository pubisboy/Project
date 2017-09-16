package model;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AdminProductDao {

	@Autowired
	SqlSessionFactory factory;
	
	public List product_list(Map map){
		SqlSession session = factory.openSession();
		List rst = null;
		try{
			rst = session.selectList("admin_product.product_list", map);
		}catch(Exception e){
			System.out.println("error.product_list"+e.toString());
		}finally{
			session.close();
		}
		return rst;
	}
	
	public int product_list_count(Map map){
		SqlSession session = factory.openSession();
		int rst = -1;
		try{
			rst = session.selectOne("admin_product.product_list_count", map);
		}catch(Exception e){
			System.out.println("error.product_list_count"+e.toString());
		}finally{
			session.close();
		}
		return rst;
	}
	
	public List get_catefory_s(){
		SqlSession session = factory.openSession();
		List rst = null;
		try{
			rst = session.selectList("admin_product.get_catefory_s");
		}catch(Exception e){
			System.out.println("error.get_catefory_s"+e.toString());
		}finally{
			session.close();
		}
		return rst;
	}
	
	public List get_catefory_l(){
		SqlSession session = factory.openSession();
		List rst = null;
		try{
			rst = session.selectList("admin_product.get_catefory_l");
		}catch(Exception e){
			System.out.println("error.get_catefory_l"+e.toString());
		}finally{
			session.close();
		}
		return rst;
	}
	
	
	public List order_detail(int num){
		SqlSession session = factory.openSession();
		List rst = null;
		try{
			rst = session.selectList("admin_product.order_detail", num);
		}catch(Exception e){
			System.out.println("error.order_detail"+e.toString());
		}finally{
			session.close();
		}
		return rst;
	}
	
	public boolean del_order(int num){
		SqlSession session = factory.openSession();
		boolean b = false;
		try{
			int r = session.delete("admin_product.del_order", num);
			if(r > 0){
				b = true;
			}
			session.commit();
		}catch(Exception e){
			System.out.println("error.del_order"+e.toString());
			b = false;
			session.rollback();
		}finally{
			session.close();
		}
		return b;
	}
	
	public boolean update_order(Map map){
		SqlSession session = factory.openSession();
		boolean b = false;
		try{
			int rst = session.insert("admin_product.update_order", map);
			if(rst > 0){
				b = true;
				session.commit();
			}
		}catch(Exception e){
			System.out.println("error.update_order"+e.toString());
			b = false;
			session.rollback();
		}finally{
			session.close();
		}
		return b;
	}
}