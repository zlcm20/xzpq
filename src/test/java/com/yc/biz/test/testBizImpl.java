package com.yc.biz.test;


import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.yc.bean.Addr;
import com.yc.bean.House;
import com.yc.bean.Peizhi;
import com.yc.bean.User;
import com.yc.biz.AddrBiz;
import com.yc.biz.HouseBiz;
import com.yc.biz.PeizhiBiz;
import com.yc.biz.UserBiz;


@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@AutoConfigureMockMvc//注入MockMvc实例
@SpringBootTest
public class testBizImpl {    
	    
	    
	    @Resource(name="userBizImpl")
	    private UserBiz userBiz;
	    @Resource(name="houseBizImpl")
	    private HouseBiz houseBiz;
	    @Resource(name="addrBizImpl")
	    private AddrBiz addrBiz;
	    @Resource(name="peizhiBizImpl")
	    private PeizhiBiz peizhiBiz;
	    
	    /**
	     * 根据id查用户
	     */
	    @Test
	    public void testRegister() {
	        System.out.println(userBiz.getUsersById(1));
	    } 
	    
	    
	    /**
		 * 根据用户名和密码来查询用户
		 */
		@Test
		public void testLogin(){
			User u=new User();
			u.setUname("a");
			u.setUpassword("a");
			System.out.println(userBiz.login(u));
		}
		
		 /**
		 * 根据房子id查询房屋信息 
		 */
		@Test
		public void testGetHouseBean(){
			House house =new House();
			house.setHid(1);
			System.out.println(houseBiz.getHouseBean(house));
		}
		 /**
		 * 根据房子id查询房屋信息 
		 */
		@Test
		public void testGetAllHouseBean(){
			House house =new House();
			house.setHid(1);
			System.out.println(houseBiz.getAllHouseBean(house));
		}
		
		@Test
		public void testAddHouse(){
			House house =new House();
			Peizhi pz=new Peizhi();
			pz.setPzid(1);
			house.setPeizhi(pz);
			
			Addr addr=new Addr();
			addr.setAddrid(1);
			house.setAddr(addr);
			house.setHname("第7家");
			house.setUid(3);
			house.setHprice(500.0);
			house.setHdescription("卧室有免费百兆wifi");
			house.setHfloorage(500);
			house.setHsum(5);
			System.out.println(houseBiz.addHouse(house));
		}
		
		
	    
		
		@Test//
		public void testSearchHouse(){
			Map<String,Object> map=new HashMap<String,Object>();
			int pages=1;
			int pagesize=10;
			int start=(pages-1)*pagesize;//0
			map.put("start", start);//0
			map.put("pages",pages);//1
			map.put("pagesize", pagesize);//5
			System.out.println(houseBiz.searchHouse(map));
		}
		
		
		@Test//
		public void testFindAll(){
			Map<String,Object> map=new HashMap<String,Object>();
			int pages=1;
			int pagesize=3;
			int start=(pages-1)*pagesize;//0
			map.put("start", start);//0
			map.put("pages",pages);//1
			map.put("pagesize", pagesize);//5
			System.out.println(houseBiz.getAllHouse(map));
		}
		
		
		@Test//Addr
		public void testFindAddr(){
			System.out.println(addrBiz.getAddrList());
		}
		
		
		@Test//Addr
		public void testFindPeizhi(){
			System.out.println(peizhiBiz.getPeizhiList());
		}
		
		
		@Test//Addr
		public void testFindPeizhiById(){
			System.out.println(peizhiBiz.getPeizhiById(3));
		}
		/**
		 * insert into peizhi (rent,bed,shi,ting,chu,yangtai,toilet,floor,towards)
            values( '整套出租','单人床',2,1,1,1,1,2,'南');
		 */
		
		@Test
		public void testAddPeizhi(){
			Peizhi pz=new Peizhi();
			pz.setRent("独立单间");
			pz.setBed("双人床");
			pz.setShi(1);
			pz.setTing(1);
			pz.setChu(1);
			pz.setYangtai(1);
			pz.setToilet(1);
			pz.setFloor(1);
			pz.setTowards("北");
			
			System.out.println(peizhiBiz.addPeizhi(pz));
		}
		
		
		/**
		 * insert into addr( province,city,town,xxaddr,doornumber)
            values( '湖南省','衡阳市','珠晖区','中山路阳光小区8号楼2单元','201房');
		 */
		@Test
		public void testAddAddr(){
			Addr addr=new Addr();
			addr.setProvince("湖南省");
			addr.setCity("邵阳市");
			addr.setTown("武冈市");
			addr.setXxaddr("五中小区9号楼3单元");
			addr.setDoornumber("301房");
			System.out.println(addrBiz.addAddr(addr));
		}
		
		@Test
		public void testUpdateAddr(){
			Addr addr=new Addr();
			addr.setAddrid(9);
			addr.setProvince("湖南省");
			addr.setCity("邵阳市");
			addr.setTown("武冈市");
			addr.setXxaddr("五中小区88号楼88单元");
			addr.setDoornumber("888房");
			System.out.println(addrBiz.updateaddr(addr));
		}
		
		@Test
		public void testUpdatePeizhi(){
			Peizhi pz=new Peizhi();
			pz.setPzid(9);
			pz.setRent("独立单间");
			pz.setBed("单人床");
			pz.setShi(2);
			pz.setTing(2);
			pz.setChu(2);
			pz.setYangtai(2);
			pz.setToilet(2);
			pz.setFloor(2);
			pz.setTowards("北");
			
			System.out.println(peizhiBiz.updatepeizhi(pz));
		}
		
		

		@Test
		public void testUpdateHouse(){
			House house =new House();
			house.setHid(9);
			house.setPzid(9);
			house.setAddrid(9);
			house.setHname("第44家");
			house.setUid(3);
			house.setHprice(444.0);
			house.setHdescription("卧室有空调、衣柜、挂墙液晶电视、免费百兆wifi");
			house.setHfloorage(444);
			house.setHsum(4);
			System.out.println(houseBiz.updateHouse(house));
		}
		
		
		@Test
		public void testDelHouse(){
			
			System.out.println(houseBiz.delHouse(1));
		}
		
		@Test
		public void testDelAddr(){
			
			System.out.println(addrBiz.delAddr(1));
		}
		
		@Test
		public void testDelPeizhi(){
			
			System.out.println(peizhiBiz.delPeizhi(1));
		}
		
		
	}

