package com.yc.biz.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.yc.bean.User;
import com.yc.biz.UserBiz;
import com.yc.dao.BaseDao;
@Service

public class UserBizImpl implements UserBiz {

	@Resource(name = "baseDaoMybatisImpl")
	private BaseDao<User> baseDao;
	
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

}
