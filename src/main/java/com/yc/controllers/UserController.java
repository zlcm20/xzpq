package com.yc.controllers;

import java.io.IOException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.yc.bean.Addr;
import com.yc.bean.Peizhi;
import com.yc.bean.User;
import com.yc.biz.AddrBiz;
import com.yc.biz.PeizhiBiz;
import com.yc.biz.UserBiz;
import com.yc.utils.JsonModel;

@RestController      //类注解  同时使用@Controller  和@ResponseBody
public class UserController {
	@Resource(name="userBizImpl")
	private UserBiz userBiz;
	@Resource(name = "addrBizImpl")
	private AddrBiz addrBiz;
	@Resource(name = "peizhiBizImpl")
	private PeizhiBiz peizhiBiz;
	
	
	@RequestMapping("/user_register.action")
	public JsonModel register(User user){
		JsonModel jm=new JsonModel();
		boolean result=userBiz.register(user);
		if(result){
			jm.setCode(1);
		}else{
			jm.setCode(0);
		}
		return jm;
	}
	
	@RequestMapping("/user_login.action")
	public ModelAndView login(User user,HttpServletRequest request,HttpSession session){
		ModelAndView mav=new ModelAndView();
		String zccode=request.getParameter("zccode");
		String rand=session.getAttribute("rand").toString();
	
		if(!rand.equals(zccode)){
			request.setAttribute("errormsg", "验证码错误");
		}else{
			user=userBiz.login(user);
			if(user!=null){
				session.setAttribute("user", user);
				mav.setViewName("/WEB-INF/page/list");
				return mav;
			}else{
				request.setAttribute("errormsg", "账户或密码错误,请重新输入...");
			}
		}
		mav.setViewName("/WEB-INF/page/login");
		return mav;
	}
	
	
	@RequestMapping("user_logout.action")
	public void logout(HttpSession session,HttpServletResponse resp){
		ModelAndView mav=new ModelAndView();
		session.removeAttribute("user");
		try {
			resp.sendRedirect("index.action");
		} catch (IOException e){
			e.printStackTrace();
		}
	}

	
	@RequestMapping("/fangdong.action")
	public JsonModel<User> fangdong(User user,HttpServletRequest request,HttpSession session,HttpServletResponse resp) throws IOException{
		List<User> users=userBiz.selectfd(user);

		JsonModel<User> jsonModel = new JsonModel<User>();
		jsonModel.setRows(users);
		jsonModel.setTotal(users.size());
//		DataGridModel dgm = new DataGridModel();
//		dgm.setRows(users);
//		dgm.setTotal( users.size() );
//		
//		Gson g = new Gson();
//		String jsonString = g.toJson(dgm);
		return jsonModel;
	}
	
	@RequestMapping("/fangke.action")
	public JsonModel<User> fangke(User user,HttpServletRequest request,HttpSession session,HttpServletResponse resp) throws IOException{
		List<User> users=userBiz.selectfk(user);
//		DataGridModel dgm = new DataGridModel();
//		dgm.setRows(users);
//		dgm.setTotal( users.size() );
//		
//		Gson g = new Gson();
//		String jsonString = g.toJson(dgm);
		JsonModel<User> jsonModel = new JsonModel<User>();
		jsonModel.setRows(users);
		jsonModel.setTotal(users.size());
		return jsonModel;
	}
}
