package com.yc.controllers;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;


import com.yc.bean.Admin;
import com.yc.bean.House;
import com.yc.biz.AdminBiz;

import com.yc.utils.JsonModel;


@RestController      //类注解  同时使用@Controller  和@ResponseBody
public class AdminController {
	@Resource(name="adminBizImpl")
	private AdminBiz adminBiz;
	
	@RequestMapping("adminreg.action")
	public JsonModel register(Admin admin){
		JsonModel jm=new JsonModel();
		boolean r = adminBiz.validate(admin);
		if(!r){
			boolean result=adminBiz.reg(admin);
			if(result){
				jm.setCode(1);
			}else{
				jm.setCode(0);
				jm.setMsg("注册失败...");
			}
		}else{
			jm.setCode(0);
			jm.setMsg("用户名已存在...");
		}
		return jm;
	}
		
	@RequestMapping(value="adminlogin.action")
	public ModelAndView login(Admin admin,HttpServletRequest request,HttpSession session){
		ModelAndView mav=new ModelAndView();
		String zccode=request.getParameter("zccode");
		String rand=session.getAttribute("rand").toString();
		if(!rand.equals(zccode)){
			request.setAttribute("errormsg", "验证码错误");
		}else{
			admin=adminBiz.login(admin);
			if(admin!=null){
				session.setAttribute("admin", admin);
				mav.setViewName("manager/admin/adminList");
				return mav;
			}else{
				request.setAttribute("errormsg", "管理员账户或密码错误,请重新输入...");
			}
		}
		mav.setViewName("manager/admin/adminlogin");
		return mav;
	}

	
	@RequestMapping("showadmin.action")
	public JsonModel<Admin> showAdmin(HttpServletRequest request,HttpServletResponse response,
					@RequestParam(name="order") String orderway,
					@RequestParam(name="sort") String order,
					@RequestParam(name="page") Integer page,
					@RequestParam(name="rows") Integer pagesize){
		Map<String,Object> map=new HashMap<String,Object>();
		Integer start=(page-1)*pagesize;
		map.put("start", start);
		map.put("pages", page);
		map.put("pagesize", pagesize);
		map.put("order", order);
		map.put("orderway", orderway);
		JsonModel<Admin> jsonModel=adminBiz.getAdminByPages(map);
//		Gson g = new Gson();
//		String jsonString = g.toJson(jsonModel);
		return jsonModel;
	}
	

}
