package com.ashier.controllers {
	
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;
	
	public class ModelPrepCommand extends SimpleCommand {
		
		override public function execute( note:INotification ) :void {
			// nothing to register for now
		}
	}
}