<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="/app/jsp/common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body style="background: #3F7ACF;" >
	<div style="background:#3F7ACF;">
		  <div class="row" >
		    <div class="col-sm-4" >
		      <div id="treeview3" ></div>
		     
		    </div>
		  </div>
	</div>
</body>
<script type="text/javascript">
		$(function() {
        var defaultData = [
          {
            text: '仓管员',
            nodes: [
              {
                text: '申购管理',
                nodes: [
                  {
                    text: '申购记录管理',
                    href: '/MaterialManagement/app/jsp/user_manage/logistics/subscribe/subscribe.jsp',
                    target:'right',
                  }
                ]
              },{
                text: '库存管理',
                nodes: [
                  {
                    text: '盘点管理',
                    href: '/MaterialManagement/app/jsp/user_manage/logistics/check/check_manage.jsp',
                  },{
                    text: '入库管理',
                    href: '/MaterialManagement/app/jsp/user_manage/logistics/StorageGérer.jsp',
                  },{
                    text: '出库管理',
                    href: '/MaterialManagement/app/jsp/user_manage/logistics/ChuKuGerer.jsp',
                  },{
                    text: '物资管理',
                    href: '/MaterialManagement/app/jsp/user_manage/logistics/RessourcesGerer.jsp',
                  },{
                    text: '用户申请记录',
                    href: '/MaterialManagement/app/jsp/user_manage/logistics/UsagerDemande.jsp',
                  },{
                    text: '资产统计',
                    href: '/MaterialManagement/app/jsp/user_manage/logistics/statistics/property_statistics.jsp',
                  }
                ]
              }
            ]
          }, {
            text: '领导',
            nodes: [
              {
                text: '资产',
                nodes: [
                  {
                    text: '资产统计',
                    href: '/MaterialManagement/app/jsp/user_manage/lead/property_statistics.jsp',
                  }
                ]
              },{
                text: '审批管理',
                nodes: [
                  {
                    text: '已审批记录',
                    href: '/MaterialManagement/app/jsp/user_manage/lead/yetApprovalRecord.jsp',
                  },{
                    text: '未审批处理',
                    href: '/MaterialManagement/app/jsp/user_manage/lead/notApprovalDispose.jsp',
                  }
                ]
              }
            ]
          },{
            text: '用户',
            nodes: [
              {
                text: '申请',
                nodes: [
                  {
                    text: '申请管理', 
                    href: '/MaterialManagement/app/jsp/user_manage/user/applyManage.jsp',
                    
                  },
                  {
                    text: '申请记录查看',
                    href: '/MaterialManagement/app/jsp/user_manage/user/applyRecordLook.jsp',
                  }
                ]
              }
            ]
          }, {
            text: 'admin',
            nodes: [
              {
                text: '审批权限设置',
                href: '#child1',
                nodes: [
                  {
                    text: '审批领导管理',
                    href: '/MaterialManagement/app/jsp/user_manage/admin/approval_leadership.jsp',
                  }
                ]
              }
            ]
          }
        ];
		$('#treeview3').treeview({
		          expandIcon: "glyphicon glyphicon-stop",
		          collapseIcon: "glyphicon glyphicon-unchecked",
		          nodeIcon: "glyphicon glyphicon-user",
		          color: "white",
		          backColor: "#3F7ACF",
		          onhoverColor: "orange",
		          borderColor: "red",
		          showBorder: false,
		          showTags: true,
		          highlightSelected: true,
		          selectedColor: "yellow",
		          selectedBackColor: "darkorange",
		          data: defaultData,
		          onNodeSelected: function (event, data) {
		        	  
		        	  if(data.href != null){
		        		  window.top.right.location = data.href;
		        	  } 
                  }  

                  } 
		);
		  });
	</script>
</html>