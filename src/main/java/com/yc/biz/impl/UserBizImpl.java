package com.yc.biz.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.yc.bean.House;
import com.yc.bean.User;
import com.yc.biz.UserBiz;
import com.yc.dao.BaseDao;
@Service

public class UserBizImpl implements UserBiz {

	@Resource(name = "baseDaoMybatisImpl")
	private BaseDao baseDao;
	
	@Override
	public boolean register(User user) {
		baseDao.save(user, "saveUsers");
		return true;
	}

	@Override
	public boolean validate(User user) {
		List<User> list=baseDao.findAll(user, "isUsersExist");
		if(list!=null  && list.size()>0){
			return true;
		}
		return false;
	}

	@Override
	public User getUsersById(Integer uid) {
	User u=new User();
	u.setUid(uid);
	List<User> list=baseDao.findAll(u, "getUsers");
	if(list!=null  &&list.size()>0){
		return list.get(0);
	}
	return null;
	}

	@Override
	public User login(User user) {
		List<User> list=baseDao.findAll(user, "getUsersByLogin");
		if(list!=null  &&list.size()>0){
			return list.get(0);
		}
		return null;
		}
	
	@Override
	public List<User> selectfd(User user) {
		List<User> list=baseDao.findAll(user, "getfangdong");
		
		if(list!=null  &&list.size()>0){
			System.out.println("666"+list);
			return list;
		}
		return null;
	}
	@Override
	public List<User> selectfk(User user) {
		List<User> list=baseDao.findAll(user, "getfangke");
		if(list!=null  &&list.size()>0){
			return list;
		}
		return null;
		}

	@Override
	public boolean chance(User user) {
		baseDao.update(user, "updatefk");
		return true;
	}
	
	@Override
	public List<User> getByUid(Integer uid) {
			Map<String,String> map=new HashMap<String,String>();
			map.put("uid",uid+" ");
			List<User> list=this.baseDao.findAll(House.class, "findByUid", map);
			if( list!=null&&list.size()>0){
		    	return list;
		    }else{
		    	return null;
		    }	
	   }

	@Override
	public boolean updateUser(User user) {
		baseDao.update(user,"changeUsers");
		return true;
	}

}
