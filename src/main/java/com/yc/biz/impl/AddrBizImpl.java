package com.yc.biz.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.yc.bean.Addr;
import com.yc.bean.House;
import com.yc.biz.AddrBiz;
import com.yc.dao.BaseDao;
@Service
public class AddrBizImpl implements AddrBiz {

	@Resource(name="baseDaoMybatisImpl")
	private BaseDao baseDao;
	
	@Override
	public List<Addr> getAddrList() {
		List<Addr> types=null;
		types=baseDao.findAll(Addr.class, "getAllAddr");
		return types;
	}

	@Override
	public boolean addAddr(Addr addr) {
		baseDao.save(addr,"saveAddr");
		return true;
	}

	@Override
	public Addr getAddrById(Integer addrid) {
		Addr addr=new Addr();
		addr.setAddrid(addrid);
		List<Addr> list=baseDao.findAll(addr, "getAddr");
		if(list!=null  &&list.size()>0){
			return list.get(0);
		}
		return null;
		}

	@Override
	public boolean updateaddr(Addr addr) {
		baseDao.update(addr, "updateAddr");
		return true;
	}
	
	@Override
	public boolean delAddr(int addrid) {
			baseDao.del(Addr.class,addrid+"","delSingleAddr");
		    return true;
	}
}


