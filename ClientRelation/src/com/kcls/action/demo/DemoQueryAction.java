package com.kcls.action.demo;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kcls.bean.Client;
import com.kcls.service.DemoService;
import com.kcls.util.CommonData;

@Controller
public class DemoQueryAction {

	@Resource(name="demoService")
	private DemoService demoService;
	
	@RequestMapping(value="/demoQuery",method=RequestMethod.POST)
	@ResponseBody
	public Object query(Client client){
		
		Map<String ,String> map = new HashMap<String ,String>();
		if(!client.getClient_name().isEmpty()){
			if(client.getClient_id().isEmpty()){
				client.setClient_id(CommonData.getUuid());
				demoService.demoAdd(client);
				map.put("message", "添加成功");
				return map;
			}else{
				demoService.demoModify(client);
				map.put("message", "修改成功");
				return map;
			}
		}
		map.put("message", "姓名输入为空");
		return map;
	}
}
