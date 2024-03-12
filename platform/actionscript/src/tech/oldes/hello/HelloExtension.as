//   ____  __   __        ______        __
//  / __ \/ /__/ /__ ___ /_  __/__ ____/ /
// / /_/ / / _  / -_|_-<_ / / / -_) __/ _ \
// \____/_/\_,_/\__/___(@)_/  \__/\__/_// /
//  ~~~ oldes.huhuman at gmail.com ~~~ /_/
//
// SPDX-License-Identifier: Apache-2.0

package tech.oldes.hello
{
	import flash.events.EventDispatcher;
	import flash.events.Event;
	import flash.events.StatusEvent;
	import flash.external.ExtensionContext;
	
	public class HelloExtension extends EventDispatcher
	{
		////////////////////////////////////////////////////////
		//	CONSTANTS
		//
		
		//
		//	ID and Version numbers
		public static const EXT_CONTEXT_ID:String = Const.EXTENSIONID;
		private static const EXT_ID_NUMBER:int = -1;
		
		public static const VERSION:String = Const.VERSION;
		private static const VERSION_DEFAULT:String = "0";
		private static const IMPLEMENTATION_DEFAULT:String = "unknown";
		
		//
		//	Error Messages
		private static const ERROR_CREATION:String = "The HelloExtension context could not be created";

		////////////////////////////////////////////////////////
		//	VARIABLES
		//
		
		//
		// Singleton variables	
		private static var _instance:HelloExtension;
		private static var _extContext:ExtensionContext;
		
		////////////////////////////////////////////////////////
		//	SINGLETON INSTANCE
		//
		public static function get instance():HelloExtension {
			if ( !_instance ) {
				_instance = new HelloExtension( new SingletonEnforcer() );
				_instance.init();
			}
			return _instance;
		}

		public function HelloExtension( enforcer:SingletonEnforcer ) {
			_extContext = ExtensionContext.createExtensionContext( EXT_CONTEXT_ID, null );
			if ( !_extContext ) throw new Error( ERROR_CREATION );
			_extContext.addEventListener( StatusEvent.STATUS, onStatusHandler );
		}

		private function onStatusHandler( event:StatusEvent ):void {
			var e:Event;
			trace("onStatusHandler: " + event)

			switch(event.code) {
//				case RequestPermissionsResultEvent.ON_REQUEST_PERMISSIONS_RESULT:
//					e = new RequestPermissionsResultEvent(event.code, event.level);
//					break;
//				case AppDetailsActivityStartedEvent.ON_APP_DETAILS_ACTIVITY_STARTED:
//					e = new AppDetailsActivityStartedEvent(event.code);
//					break;
			}
			if (e) {
				this.dispatchEvent(e);
			}
		}

		private function init():void {
			_extContext.call( "init" );
		}

		public function dispose():void {
			if (_extContext) {
				_extContext.removeEventListener( StatusEvent.STATUS, onStatusHandler );
				_extContext.dispose();
				_extContext = null;
			}
			_instance = null;
		}
		

		
		
		//----------------------------------------
		//
		// Public Methods
		//
		//----------------------------------------

		public function get version():String
		{
			return VERSION;
		}

		public function get nativeVersion():String
		{
			return _extContext.call("nativeVersion") as String;
		}

		public function systemLog(message:String):void
		{
			_extContext.call("systemLog", message);
		}
		
//		public function checkPermission(permision:String): Boolean {
//			return _extContext.call("checkPermission", permision) as Boolean;
//		}

	}
}

class SingletonEnforcer {}