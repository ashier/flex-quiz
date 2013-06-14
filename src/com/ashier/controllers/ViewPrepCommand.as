package com.ashier.controllers {
	
	import com.ashier.ApplicationFacade;
	import com.ashier.mediators.InputWordMediator;
	
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;
	
	public class ViewPrepCommand extends SimpleCommand {
		
		override public function execute( notification:INotification ) :void {
			facade.registerMediator( new InputWordMediator( ( notification.getBody() as sample ).inputWords ) );            
		}
		
	}
}