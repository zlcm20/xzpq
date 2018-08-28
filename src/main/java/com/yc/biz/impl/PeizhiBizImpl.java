package com.yc.biz.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.yc.bean.House;
import com.yc.bean.Peizhi;
import com.yc.bean.User;
import com.yc.biz.PeizhiBiz;
import com.yc.dao.BaseDao;
@Service
public class PeizhiBizImpl implements PeizhiBiz {

	@Resource(name="baseDaoMybatisImpl")
	private BaseDao baseDao;
	
	@Override
	public List<Peizhi> getPeizhiList() {
		List<Peizhi> types=null;
		types=baseDao.findAll(Peizhi.class, "getAllPeizhi");
		return types;
	}

	@Override
	public boolean addPeizhi(Peizhi peizhi) {
		baseDao.save(peizhi,"savePeizhi");
		return true;
	}

	@Override
	public Peizhi getPeizhiById(Integer pzid) {
		Peizhi pz=new Peizhi();
		pz.setPzid(pzid);
		List<Peizhi> list=baseDao.findAll(pz, "getPeizhi");
		if(list!=null  &&list.size()>0){
			return list.get(0);
		}
		return null;
		}

	@Override
	public boolean updatepeizhi(Peizhi peizhi) {
		baseDao.update(peizhi, "updatePeizhi");
		return true;
	}

	@Override
	public boolean delPeizhi(int pzid) {
		baseDao.del(Peizhi.class,pzid+"","delSinglePeizhi");
	    return true;
	}
}


