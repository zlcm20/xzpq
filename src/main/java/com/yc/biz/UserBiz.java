package com.yc.biz;

import java.util.List;

import com.yc.bean.User;

public interface UserBiz {
	/**
	 * 注册用户
	 * @param user
	 * @return
	 */
	public boolean register(User user);
	/**
	 * 用户名是否存在
	 * @param user
	 * @return
	 */
	public boolean validate(User user);
	/**
	 * 根据id查用户
	 * @param id
	 * @return
	 */
	public User getUsersById(Integer uid);
	/**
	 * 登录
	 * @param user
	 * @return
	 */
	public User login(User user);
	/**
	 * 查询房东
	 * @param user
	 * @return
	 */
	public List<User> selectfd(User user);
	/**
	 * 查询房客
	 * @param user
	 * @return
	 */
	public List<User> selectfk(User user);
}
