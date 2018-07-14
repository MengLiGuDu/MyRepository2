package com.kcls.action.logistics;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.annotation.Resource;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import com.kcls.service.logistice.UsagerDemandeService;
import com.kcls.util.DateUtil;

@Controller
public class UsagerDemandeAction {
	@Resource
	private UsagerDemandeService usagerDemandeService;
	
	@RequestMapping(value="UsagerDemandeList",method=RequestMethod.POST)
	@ResponseBody
	public Object resourceTypeList(@RequestParam HashMap<String, Object> input){
		
		
		HashMap<String, Object> in = DateUtil.page(input);
		Map<String, Object> magMap = new HashMap<String, Object>();
		List<HashMap<String, Object>> list = usagerDemandeService.UsagerDemandeList(in);
		int total = usagerDemandeService.UsagerDemandeCount(in);
		
		magMap.put("total", total);
		magMap.put("rows", list);
		
		return magMap;
	}
}
