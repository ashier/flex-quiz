package com.ashier.mediators {
	
	import com.ashier.ApplicationFacade;
	import com.ashier.views.InputWords;
	
	import flash.events.Event;
	import flash.utils.Dictionary;
	
	import org.puremvc.as3.interfaces.IMediator;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.mediator.Mediator;
	
	public class InputWordMediator extends Mediator implements IMediator {
		
		public static const NAME:String = "InputWordMediator"; 
		
		public function InputWordMediator( viewComponent:Object=null ) {
			super( getMediatorName(), viewComponent );
			createEvents();
		}
		
		private function createEvents():void {
			view.addEventListener( InputWords.PARSE, onParse );
		}
		
		private function onParse( event:Event ):void {
			view.outputText = "";
			sendNotification( ApplicationFacade.DICTIONARY_TOSTRING, parseText( view.inputText ) );
		}
		
		public function parseText( inputText:String ):String {
			if(inputText.length > 0) {
				
				var words:Array = inputText.split(" ");
				var dict:Dictionary = new Dictionary();
				var sorted:Array = new Array();
				
				for(var i:int = 0; i < words.length; i++) {
					var word:String = words[i];
					if(dict[word] != null) {
						dict[word] += 1;
					} else {
						dict[word] = 1;
					}
				}
				
				for( var props:String in dict ){
					sorted.push( props.toLowerCase() + " " + dict[props] );
				}
				sorted.sort( Array.CASEINSENSITIVE );
				
				return sorted.join("\n");
				
			} else {
				return "Please type in your words.";
			}
		}
		
		override public function listNotificationInterests():Array {
			return [ApplicationFacade.DICTIONARY_TOSTRING];
		}
		
		override public function handleNotification( notification:INotification ):void {
			switch( notification.getName() ) {
				case ApplicationFacade.DICTIONARY_TOSTRING:
					view.outputText = notification.getBody() as String;
					break;
			}
		}
		
		override public function getMediatorName():String {
			return InputWordMediator.NAME;
		}
		
		protected function get view():InputWords {
			return viewComponent as InputWords;
		}
	}
}