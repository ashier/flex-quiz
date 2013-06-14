package com.ashier {
	
	import com.ashier.controllers.ApplicationStartupCommand;
	
	import org.puremvc.as3.patterns.facade.Facade;
	
	public class ApplicationFacade extends Facade {
		
		public static const STARTUP:String = "startup";
		public static const DICTIONARY_TOSTRING:String = "dictionaryToString";
		
		public static function getInstance() : ApplicationFacade {
			if(!instance) {
				instance = new ApplicationFacade();
			}
			return instance as ApplicationFacade;
		}
		
		override protected function initializeController():void {
			super.initializeController();
			registerCommand(STARTUP, ApplicationStartupCommand);
		}
		
		public function startup( application:sample ):void {
			sendNotification( STARTUP, application );
		}
	}
}