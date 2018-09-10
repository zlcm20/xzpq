package com.yc.controllers;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.yc.bean.Addr;
import com.yc.biz.AddrBiz;
import com.yc.utils.JsonModel;


@RestController
public class AddrController {

	@Resource(name="addrBizImpl")
	private AddrBiz addrBiz;
	
	@RequestMapping("addr.action")
	public JsonModel  houseList( HttpServletRequest request, HttpSession session){
		List<Addr> addrlist=addrBiz.getAddrList();
	     session.setAttribute("addrlist", addrlist);
		//System.out.println(houseTypeList);
		JsonModel jm=new JsonModel();
		jm.setCode(1);
		jm.setObj(addrlist);
		return jm;
	}

}
