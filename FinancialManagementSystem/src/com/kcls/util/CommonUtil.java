package com.kcls.util;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import com.kcls.bean.NodeBean;
import com.kcls.bean.TreeBean;
import com.kcls.bean.UserBean;

public class CommonUtil {

	//天数算出时间
	public static String getDate(int days){
		Calendar cal = Calendar.getInstance();
		DateFormat dates = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		cal.setTime(new Date());
		
		cal.add(Calendar.DAY_OF_YEAR, +days);
		
		return dates.format(cal.getTime());
	}
	//系统当前时间
	public static String getTime(){
		Date date = new Date();
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String strTime = df.format(date);
		return strTime;
	}
	//获取当前登录session用户
	public static UserBean getLoginUser(HttpSession session){
		
		UserBean user = (UserBean) session.getAttribute("loginUser");
		
		return user;
	}
	//获取UUID
	public static String getUUID(){
			
		UUID id = UUID.randomUUID();
		
		return ""+id;
	}
	
	//获取树
	public static List<TreeBean> getTree(List<NodeBean> nodes){
		List<TreeBean> Tree = new ArrayList<TreeBean>();
		for (int i = 0; i < nodes.size(); i++) { 
			NodeBean node  = nodes.get(i);
			if (node.getParent_id() == null) {
				TreeBean tree = new TreeBean(node.getNode_id(),node.getText());
				Tree.add(tree);
			}
		}
		for (int j = 0; j < Tree.size(); j++) {
			for (int k = 0; k < nodes.size(); k++) {
				NodeBean bean = nodes.get(k);
				if(Tree.get(j).getNode_id().equals(bean.getParent_id())){
					Tree.get(j).getNodes().add(bean);
				}
			}
		}
		return Tree;
	}
}
