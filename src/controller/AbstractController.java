
package controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.Map.Entry;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.context.MessageSource;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.servlet.ModelAndView;

import com.founder.fasf.beans.Criteria;
import com.founder.fasf.beans.Criterion;
import com.founder.fasf.beans.OP;
import com.founder.fasf.beans.Order;
import com.founder.fasf.beans.Page;
import com.founder.fasf.service.IGenericService;
import com.founder.fasf.util.ObjectUtil;

public abstract class AbstractController {
//	@Resource
	private IGenericService  genericService;
	protected ModelAndView mav;

	protected Page page;

	protected Order order;

	protected Criteria orgCriteria;

	protected Criteria deptCriteria;

	protected MessageSource messageSource;

	protected Log log = LogFactory.getLog(this.getClass());


	public Criteria getCriteria(Map<String, String[]> map, String... parm) {
		return getCriteria(new Criteria(), map, parm);
	}

	public Criteria getCriteria(Criteria result, Map<String, String[]> map, String... parm) {
		if (isNull(result)) {
			result = new Criteria();
		}
		if (map == null || map.size() < 1) {
			return result;
		}
		// added start by jacky zhang 2013/09/18
		Map<String, String> keyMap = new HashMap<String, String>();
		for (String key : map.keySet()) {
			if (key.indexOf(":") > -1) {
				keyMap.put(key.split(":")[0], key);
				continue;
			}
			keyMap.put(key, key);
		}
		// added end by jacky zhang 2013/09/18
		if (parm != null && parm.length > 0) {
			for (String key : parm) {
				// modified start by jacky zhang 2013/09/18
				// addCritreia(result, key, map);
				addCritreia(result, keyMap.get(key), map);
				// modified end by jacky zhang 2013/09/18
			}
			return result;
		}
		for (Entry<String, String[]> entry : map.entrySet()) {
			addCritreia(result, entry.getKey(), map);
		}
		return result;
	}

	private void addCritreia(Criteria result, String key, Map<String, String[]> map) {
		// added start by jacky zhang 2013/09/18
		if (key == null) {
			return;
		}
		// added end by jacky zhang 2013/09/18
		String[] parameters = key.split(":");
		String[] values;
		if (parameters.length == 1) {
			values = map.get(key);
			if (isNull(values)) {
				return;
			}
			if (values.length >1) {
				result.add(key, OP.IN, values);
				return;
			}
			result.add(key, values[0]);
		} else if (parameters.length > 1) {
			// modified start by jacky zhang 2013/09/18
			// values = map.get(parameters[0]);
			values = map.get(key);
			// modified end by jacky zhang 2013/09/18
			if (isNull(values)) {
				return;
			}
			if (parameters.length == 3) {
				Class<?> clazz = ObjectUtil.getClass(parameters[1].trim());
				if (values.length > 0) {
					Object[] objects = ObjectUtil.convertValue(clazz, values);
					if (objects.length > 1) {
						result.addCriterion(new Criterion(parameters[0], clazz, "IN", objects));
						return;
					}
					result.addCriterion(new Criterion(parameters[0], clazz, parameters[2], objects[0]));
				}
			}
		} else {
			return;
		}
	}

	protected boolean isNull(Object obj) {
		return ObjectUtil.isNullOrEmpty(obj);
	}

	protected <T> T nvl(T object, T defaultValue) {
		if (object == null) {
			return defaultValue;
		}
		return object;
	}

	@InitBinder
	public void initBinder(WebDataBinder binder) {
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		dateFormat.setLenient(false);
		binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
	}

	public ModelAndView getMav() {
		return mav;
	}

	public void setMav(ModelAndView mav) {
		this.mav = mav;
	}

	public void setPage(Page page) {
		this.page = page;
	}

	public Order getOrder() {
		return order;
	}

	public void setOrder(Order order) {
		this.order = order;
	}

	public void setOrgCriteria(Criteria orgCriteria) {
		this.orgCriteria = orgCriteria;
	}

	public void setDeptCriteria(Criteria deptCriteria) {
		this.deptCriteria = deptCriteria;
	}
}
