package com.yc.controllers;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.yc.bean.Peizhi;
import com.yc.biz.PeizhiBiz;
import com.yc.utils.JsonModel;


@RestController
public class PeizhiController {

	@Resource(name="peizhiBizImpl")
	private PeizhiBiz peizhiBiz;
	
	@RequestMapping("peizhiList.action")
	public JsonModel peizhiList( HttpServletRequest request, HttpSession session){
		List<Peizhi> peizhilist=peizhiBiz.getPeizhiList();
	    session.setAttribute("peizhilist", peizhilist);
		JsonModel jm=new JsonModel();
		jm.setCode(1);
		jm.setObj(peizhilist);
		return jm;
	}
	
	
	@RequestMapping("peizhi.action")
	public JsonModel  getpeizhi(@RequestParam Integer pzid, HttpServletRequest request, HttpSession session){
		List<Peizhi> peizhi=(List<Peizhi>) peizhiBiz.getPeizhiById(pzid);
	    session.setAttribute("peizhi", peizhi);
		JsonModel jm=new JsonModel();
		jm.setCode(1);
		jm.setObj(peizhi);
		return jm;
	}
	

}
