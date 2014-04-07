
package controller;

import java.util.List;

import model.FoodList;
import model.Menu;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.founder.fasf.beans.Criteria;
import com.founder.fasf.beans.Order;
import com.founder.fasf.beans.PageList;

@Controller
@Scope("prototype")
@RequestMapping("/foodList")
public class FoodListController extends AbstractController {


	@RequestMapping("/index")
	public ModelAndView index(Integer menuId) {
		mav.setViewName("foodList/index");
		List<Menu> menuList=genericService.getList(Menu.class, new Criteria(Menu.PARENT_ID, 2), new Order(Menu.SORT_NO));
		List<FoodList> foodList=genericService.getList(FoodList.class, new Criteria(FoodList.MENU_ID, menuId), new Order(FoodList.SORT_NO));
		List<Menu> topMenuList=genericService.getList(Menu.class, new Criteria(Menu.MENU_LEVEL, 1), new Order(Menu.SORT_NO));
		mav.addObject("menuList", menuList);
		mav.addObject("topMenuList", topMenuList);
		mav.addObject("foodList", foodList);
		mav.addObject("cMenuId", menuId);
		return mav;
	}

	@RequestMapping("/search")
	public ModelAndView search() {
		Criteria criteria = getCriteria(request.getParameterMap(), FoodList.NAME);
		PageList<FoodList> foodList = genericService.getPageList(FoodList.class,page, criteria, new Order(FoodList.NAME));
		mav.addObject("pageList", foodList);
		return mav;
	}

	@RequestMapping("/add")
	// @Secured({ "OA_ROLE_ADD"})
	public ModelAndView add() {
		mav.setViewName("system.FoodList.add");
		mav.addObject("FoodList", new FoodList());
		return mav;
	}

	@RequestMapping("/saveAdd")
	// @Secured({ "OA_ROLE_ADD"})
	public void saveAdd(FoodList foodList) {
		genericService.add(foodList);
	}

	@RequestMapping("/update")
	// @Secured({ "OA_ROLE_UPDATE"})
	public ModelAndView update(Integer id) {
		mav.setViewName("system.FoodList.update");
		FoodList foodList = genericService.get(FoodList.class,new Criteria(FoodList.ID, id));
		mav.addObject("FoodList", foodList);
		return mav;
	}

	@RequestMapping("/saveUpdate")
	// @Secured({ "OA_ROLE_UPDATE"})
	public void saveUpdate(FoodList foodList) {
		if (isNull(foodList.getId())) {
			return;
		}
		genericService.update(foodList);
	}

	@RequestMapping("/delete")
	// @Secured({ "OA_ROLE_DELETE"})
	public void delete(Integer[] id) {
		genericService.delete(FoodList.class,id);
	}
}
