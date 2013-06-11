// created by Tom Jenkinson. Please let me know if you use this and find it helpful
package tjenkinson.callbackHelper {
	
	public class CallbackHelper {
		
		// pass in the function you want to be called as the furst paramater. Then put the actual paramaters that you want to be copied and passed to it when it is called in the future afterwards.
		public static function createCallback(fn:Function, ... embeddedArgs):Function {
			return function(... passedArgs):Object {
				// the args that are passed to the function will be the embedded args.
				// any args that are passed in when the function is called will overwrite the embedded ones (unless null)
				var args:Array = embeddedArgs;
				for (var i:uint=0; i<passedArgs.length; i++) {
					if (passedArgs[i] != null) {
						args[i] = passedArgs[i];
					}
				}
				// call the function and pass in the args and return the result
				return fn.apply(null, args);
			};
		}
		
		public static function storeVar(a:Object):Function {
			return function():Object {
				return a;
			};
		}
	}
}