package util
{
	import control.Loading;
	
	import flash.net.URLRequest;
	import flash.net.navigateToURL;
	
	import httpcontrol.CHTTPService;
	import httpcontrol.HttpServiceUtil;
	import httpcontrol.RemoteUtil;
	
	import mx.collections.ArrayCollection;
	import mx.rpc.AbstractOperation;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;

	public class ToolUtil
	{
		public function ToolUtil()
		{
		}
		
		public static function init():void{
//			hyRefresh();
//			kjkmRefresh();
//			bbRefresh();
//			userRefresh();
			sessionUserRefresh();
			
			ruleRefresh();
			ticketRefresh();
			businessRefresh();
			kmRefresh();
		}
		
		
		[Bindable]
		public static var sessionUser:Object=new Object();
		
		public static function sessionUserRefresh(fun:Function=null):void{
//			RemoteUtil.getOperationAndResult("getAllUser",resultAllUser).send();
			if(fun==null){
				HttpServiceUtil.getCHTTPServiceAndResult("/ft/currentUser",resultFinduser,"POST").send()
//				RemoteUtil.getOperationAndResult("",resultAllUser,false).send();
			}else{
				var http:CHTTPService=HttpServiceUtil.getCHTTPServiceAndResultAndFault("/ft/currentUser",resultFinduser,failueFinduser,"POST");
				
				http.resultFunArr.addItem(fun);
				http.send();
				
			}
		}
		public static function resultFinduser(result:Object,e:ResultEvent):void{
			if(result.success==true){
				sessionUser=result.result;
			}else{
				sessionUser=false;
			}
		}
		
		public static function failueFinduser(e:FaultEvent):void{
			 
		}
		
		[Bindable]
		public static var userList:ArrayCollection=new ArrayCollection();
		
		public static function userRefresh(fun:Function=null):void{
//			RemoteUtil.getOperationAndResult("getAllUser",resultAllUser).send();
			if(fun==null){
				HttpServiceUtil.getCHTTPServiceAndResult("_100_BaseInfosAction_findall.action",resultAllUser,"POST").send()
//				RemoteUtil.getOperationAndResult("",resultAllUser,false).send();
			}else{
				var http:CHTTPService=HttpServiceUtil.getCHTTPServiceAndResult("_100_BaseInfosAction_findall.action",resultAllUser,"POST");
				http.resultFunArr.addItem(fun);
				http.send();
				
			}
		}
		public static function resultAllUser(result:Object,e:ResultEvent):void{
			if(result.message.success==true){
				userList.removeAll();
				userList.addAll(new ArrayCollection(result.userslist as Array));
			}
		}
		[Bindable]
		public static var deptList:ArrayCollection=new ArrayCollection();
		
		public static function deptRefresh(fun:Function=null):void{
			
			if(fun==null){
				HttpServiceUtil.getCHTTPServiceAndResult("_100_BaseInfosAction_finddeptall.action",resultAllDept,"POST").send();
//				RemoteUtil.getOperationAndResult("getAllDept",resultAllDept,false).send();
			}else{
				var http:CHTTPService=HttpServiceUtil.getCHTTPServiceAndResult("_100_BaseInfosAction_finddeptall.action",resultAllDept,"POST");
				http.resultFunArr.addItem(fun);
				http.send();
				
			}
			
		}
		public static function resultAllDept(result:Object,e:ResultEvent):void{
			if(result.message.success==true){
				deptList.removeAll();
				deptList.addAll(new ArrayCollection(result.deptvolist as Array));
			}
		}
		[Bindable]
		public static var areaList:ArrayCollection=new ArrayCollection();
		
		public static function areaRefresh(fun:Function=null):void{
			
			if(fun==null){
				HttpServiceUtil.getCHTTPServiceAndResult("_100_BaseInfosAction_findareaall.action",resultAllArea,"POST").send();
//				RemoteUtil.getOperationAndResult("getAllDept",resultAllDept,false).send();
			}else{
				var http:CHTTPService=HttpServiceUtil.getCHTTPServiceAndResult("_100_BaseInfosAction_findareaall.action",resultAllArea,"POST");
				http.resultFunArr.addItem(fun);
				http.send();
				
			}
			
		}
		public static function resultAllArea(result:Object,e:ResultEvent):void{
			if(result.message.success==true){
				areaList.removeAll();
				areaList.addAll(new ArrayCollection(result.areapointvolist as Array));
			}
		}
		[Bindable]
		public static var hyList:ArrayCollection=new ArrayCollection();
		
		public static function hyRefresh(fun:Function=null):void{
			
			if(fun==null){
				HttpServiceUtil.getCHTTPServiceAndResult("/ft/getHyList",resultAllHy,"POST").send();
			}else{
				var http:CHTTPService=HttpServiceUtil.getCHTTPServiceAndResult("/ft/getHyList",resultAllHy,"POST");
				http.resultFunArr.addItem(fun);
				http.send();
				
			}
			
		}
		public static function resultAllHy(result:Object,e:ResultEvent):void{
			if(result.success==true){
				hyList.removeAll();
				hyList.addAll(new ArrayCollection(result.result as Array));
			}
		}
		[Bindable]
		public static var kjkmList:ArrayCollection=new ArrayCollection();
		
		public static function kjkmRefresh(fun:Function=null):void{
			
			if(fun==null){
				HttpServiceUtil.getCHTTPServiceAndResult("/ft/getKJKM",resultAllKjkm,"POST").send();
			}else{
				var http:CHTTPService=HttpServiceUtil.getCHTTPServiceAndResult("/ft/getKJKM",resultAllKjkm,"POST");
				http.resultFunArr.addItem(fun);
				http.send();
				
			}
			
		}
		public static function resultAllKjkm(result:Object,e:ResultEvent):void{
			if(result.success==true){
				kjkmList.removeAll();
				kjkmList.addAll(new ArrayCollection(result.result as Array));
			}
		}
		[Bindable]
		public static var bbList:ArrayCollection=new ArrayCollection();
		
		public static function bbRefresh(fun:Function=null):void{
			
			if(fun==null){
				HttpServiceUtil.getCHTTPServiceAndResult("/ft/getBB",resultAllBB,"POST").send();
			}else{
				var http:CHTTPService=HttpServiceUtil.getCHTTPServiceAndResult("/ft/getBB",resultAllBB,"POST");
				http.resultFunArr.addItem(fun);
				http.send();
				
			}
			
		}
		public static function resultAllBB(result:Object,e:ResultEvent):void{
			if(result.success==true){
				bbList.removeAll();
				bbList.addAll(new ArrayCollection(result.result as Array));
			}
		}
		
		[Bindable]
		public static var ticketList:ArrayCollection=new ArrayCollection();
		
		public static function ticketRefresh(fun:Function=null):void{
			
			if(fun==null){
				HttpServiceUtil.getCHTTPServiceAndResult("/ft/getAllTicket",resultAllTicket,"POST").send();
			}else{
				var http:CHTTPService=HttpServiceUtil.getCHTTPServiceAndResult("/ft/getAllTicket",resultAllTicket,"POST");
				http.resultFunArr.addItem(fun);
				http.send();
				
			}
			
		}
		public static function resultAllTicket(result:Object,e:ResultEvent):void{
			if(result.success==true){
				ticketList.removeAll();
				ticketList.addAll(new ArrayCollection(result.result as Array));
			}
		}
		[Bindable]
		public static var businessList:ArrayCollection=new ArrayCollection();
		
		public static function businessRefresh(fun:Function=null):void{
			
			if(fun==null){
				HttpServiceUtil.getCHTTPServiceAndResult("/ft/getAllBusiness",resultAllBusiness,"POST").send();
			}else{
				var http:CHTTPService=HttpServiceUtil.getCHTTPServiceAndResult("/ft/getAllBusiness",resultAllBusiness,"POST");
				http.resultFunArr.addItem(fun);
				http.send();
				
			}
			
		}
		public static function resultAllBusiness(result:Object,e:ResultEvent):void{
			if(result.success==true){
				businessList.removeAll();
				businessList.addAll(new ArrayCollection(result.result as Array));
			}
		}
		
		[Bindable]
		public static var kmList:ArrayCollection=new ArrayCollection();
		
		public static function kmRefresh(fun:Function=null):void{
			
			if(fun==null){
				HttpServiceUtil.getCHTTPServiceAndResult("/ft/getAllKM",resultAllKM,"POST").send();
			}else{
				var http:CHTTPService=HttpServiceUtil.getCHTTPServiceAndResult("/ft/getAllKM",resultAllKM,"POST");
				http.resultFunArr.addItem(fun);
				http.send();
				
			}
			
		}
		public static function resultAllKM(result:Object,e:ResultEvent):void{
			if(result.success==true){
				kmList.removeAll();
				kmList.addAll(new ArrayCollection(result.result as Array));
			}
		}
		[Bindable]
		public static var ruleList:ArrayCollection=new ArrayCollection();
		
		public static function ruleRefresh(fun:Function=null):void{
			
			if(fun==null){
				HttpServiceUtil.getCHTTPServiceAndResult("/ft/getRule",resultAllRule,"POST").send();
			}else{
				var http:CHTTPService=HttpServiceUtil.getCHTTPServiceAndResult("/ft/getRule",resultAllRule,"POST");
				http.resultFunArr.addItem(fun);
				http.send();
				
			}
			
		}
		public static function resultAllRule(result:Object,e:ResultEvent):void{
			if(result.success==true){
				ruleList.removeAll();
				ruleList.addAll(new ArrayCollection(result.result as Array));
			}
		}
		

		
	}
}