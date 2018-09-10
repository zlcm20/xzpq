package com.yc.controllers;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.yc.bean.House;
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
	public ModelAndView login(User user,HttpServletResponse response,HttpServletRequest request,HttpSession session) throws IOException{
		ModelAndView mav=new ModelAndView();
		String zccode=request.getParameter("zccode");
		String rand=session.getAttribute("rand").toString();
		//System.out.println(user);
		response.setCharacterEncoding("UTF-8");
		//PrintWriter out=response.getWriter();
		if(!rand.equals(zccode)){
			request.setAttribute("errormsg", "验证码错误");
			//out.println("<a>alert('验证码错误')</a>");
		}else{
			user=userBiz.login(user);
			//System.out.println("00000"+user);
			if(user!=null){
				session.setAttribute("user", user);
				mav.setViewName("/page/login");
				return mav;
			}else{
				//out.println( "账户或密码错误,请重新输入...");
				request.setAttribute("errormsg", "账户或密码错误,请重新输入...");
			}
		}
		mav.setViewName("/page/login");
		//out.flush();
		return mav;
	}
	
	
	@RequestMapping("user_logout.action")
	public void logout(HttpSession session,HttpServletResponse resp){
	
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
		return jsonModel;
	}
	
	@RequestMapping("/fangke.action")
	public JsonModel<User> fangke(User user,HttpServletRequest request,HttpSession session,HttpServletResponse resp) throws IOException{
		List<User> users=userBiz.selectfk(user);
		JsonModel<User> jsonModel = new JsonModel<User>();
		jsonModel.setRows(users);
		jsonModel.setTotal(users.size());
		return jsonModel;
	}
	
	/**
	 * 改变房客变成房东
	 * @param user
	 * @param request
	 * @param session
	 * @param resp
	 * @return
	 * @throws IOException
	 */
	@RequestMapping("/user/fkbianfd.action")
	public ModelAndView gaibian(User user,HttpServletRequest request,HttpSession session,HttpServletResponse resp) throws IOException{
		ModelAndView mav=new ModelAndView();
		user= (User) session.getAttribute("user");
		System.out.println(user);
		mav.setViewName("/page/add");
		
		return mav;
	}
	


	@RequestMapping("/user_dochangepwd.action")
	public ModelAndView dochangepwd(HttpSession session,
			HttpServletRequest request) {
		ModelAndView mav=new ModelAndView();
		User user = (User) session.getAttribute("user");
		String pwd = request.getParameter("upassword");
		user.setUpassword(pwd);
		boolean uu=userBiz.updateUser(user);
		session.removeAttribute("user");
		mav.setViewName("/index");
		
		return mav;
		
	}
}
