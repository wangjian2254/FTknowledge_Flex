package httpcontrol {
import mx.controls.Alert;
import mx.rpc.events.FaultEvent;
import mx.rpc.events.ResultEvent;

public class HttpServiceUtil {
    public function HttpServiceUtil() {

    }

    public static function init():void {
    }

    private static function createRemote():CHTTPService {
        var httpservice:CHTTPService = new CHTTPService();
        httpservice.addEventListener(FaultEvent.FAULT, faultEvent);
        httpservice.addEventListener(ResultEvent.RESULT, resultEvent);
        return httpservice;
    }


    public static function getCHTTPServiceAndResult(url:String, resultFn:Function, method:String = "GET", resultFromate:String = "text"):CHTTPService {
        return getCHTTPServiceAndResultAndFault(url, resultFn, null, method);
    }

    public static function getCHTTPServiceAndResultAndFault(url:String, resultFn:Function, faultFn:Function, method:String = "GET", resultFromate:String = "text"):CHTTPService {

        var op:CHTTPService = createRemote();
        if (resultFn != null) {
            op.resultFunArr.addItem(resultFn);
//				op.resultFun=resultFn;
        }
        if (faultFn != null) {
            op.addEventListener(FaultEvent.FAULT, faultFn);
        }
        op.url = url;
        op.method = method.toUpperCase();
        op.resultFormat = resultFromate;

        return op;
    }


    public static function faultEvent(e:FaultEvent):void {
        Alert.show(e.fault.toString(), "警告");

//			Alert.show("系统错误。","警告");
    }

    public static function resultEvent(e:ResultEvent):void {
//			trace(e.result.toString());
        var result:Object = e.result;
        var o:Object = JSON.parse(result as String);
        if (o.success == false) {
            Alert.show(o.message, "警告");
        }
    }


}
}