package controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.founder.fasf.service.IGenericService;

@RequestMapping("/access")
public class LoginController extends AbstractController{
	
	@RequestMapping("/index")
	public ModelAndView index(){
		mav.setViewName("index");
		return mav;
	}
}
