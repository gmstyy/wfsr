package controller;

import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import model.Config;
import model.Menu;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.founder.fasf.beans.Criteria;
import com.founder.fasf.beans.Order;

@Controller
@RequestMapping("/access")
public class LoginController extends AbstractController{
	
	@RequestMapping("/index")
	public ModelAndView index(){
		mav.setViewName("index");
		Map<String, Config> configMap=genericService.getKeyMap(Config.class, Config.KEY, new Criteria());
		for(Entry<String, Config> en:configMap.entrySet()){
			mav.addObject(en.getKey(), en.getValue());
		}
		List<Menu> menuList=genericService.getList(Menu.class, new Criteria(Menu.MENU_LEVEL, 1), new Order(Menu.SORT_NO));
		mav.addObject("menuList", menuList);
		return mav;
	}
	@RequestMapping("/noFounde")
	public ModelAndView noFounde(){
		mav.setViewName("error");
		mav.addObject("code", "404");
		mav.addObject("msg", "未找到页面");
		return mav;
	}
}
