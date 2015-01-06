package events {
import flash.events.Event;

public class ChonXinHua extends Event {
    static public  var CHONGXINHUA:String = "chongxinhua";
    public var item:Object ;
    public function ChonXinHua(type:String, v:Object,bubbles:Boolean = false, cancelable:Boolean = false) {
        super(type, bubbles, cancelable);
        item = v;
    }
}
}