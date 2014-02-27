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
			hyRefresh();
//			deptRefresh();
//			userRefresh();
			sessionUserRefresh();
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
		

		
	}
}