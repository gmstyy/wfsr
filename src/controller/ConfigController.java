
package controller;

import model.Config;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.founder.fasf.beans.Criteria;
import com.founder.fasf.beans.Order;
import com.founder.fasf.beans.PageList;

@Controller
@Scope("prototype")
@RequestMapping("/config")
public class ConfigController extends AbstractController {


	@RequestMapping("/index")
	public String index() {
		return "config/index";
	}

	@RequestMapping("/search")
	public ModelAndView search() {
		Criteria criteria = getCriteria(request.getParameterMap(), Config.KEY);
		PageList<Config> configList = genericService.getPageList(Config.class,page, criteria, new Order(Config.KEY));
		mav.addObject("pageList", configList);
		return mav;
	}

	@RequestMapping("/add")
	// @Secured({ "OA_ROLE_ADD"})
	public ModelAndView add() {
		mav.setViewName("system.config.add");
		mav.addObject("config", new Config());
		return mav;
	}

	@RequestMapping("/saveAdd")
	// @Secured({ "OA_ROLE_ADD"})
	public void saveAdd(Config config) {
		genericService.add(config);
	}

	@RequestMapping("/update")
	// @Secured({ "OA_ROLE_UPDATE"})
	public ModelAndView update(Integer id) {
		mav.setViewName("system.config.update");
		Config config = genericService.get(Config.class,new Criteria(Config.ID, id));
		mav.addObject("config", config);
		return mav;
	}

	@RequestMapping("/saveUpdate")
	// @Secured({ "OA_ROLE_UPDATE"})
	public void saveUpdate(Config config) {
		if (isNull(config.getId())) {
			return;
		}
		genericService.update(config);
	}

	@RequestMapping("/delete")
	// @Secured({ "OA_ROLE_DELETE"})
	public void delete(Integer[] id) {
		genericService.delete(Config.class,id);
	}
}
