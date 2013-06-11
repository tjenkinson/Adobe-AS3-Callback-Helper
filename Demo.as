package {
	
	import flash.display.MovieClip;
	
	// import the helper
	import tjenkinson.callbackHelper.CallbackHelper;

	public class Demo extends MovieClip {
		
		public function Demo() {
			trace("Trying attempt 1");
			trace("================");
			attempt1();
			trace("Trying attempt 2");
			trace("================");
			attempt2();
		}
		
		private function attempt1():void {
			
			// lets say you want to create an array of anonymous functions that print out a number.
			// here is some code
			
			var functionArray:Array = []; // this will hold the anonymous functions
			for(var i:int=0; i<3; i++) {
				
				var a:String = "The number is "+i;
				functionArray.push(function() {
						   		trace(a);
						   });
			
			}
			
			// call the functions
			functionArray[0](); // traces "The number is 2"
			functionArray[1](); // traces "The number is 2"
			functionArray[2](); // traces "The number is 2"
			
			// You might have expected functionArray[0]() to output "The number is 0".
			// The reason why it doesn't is explained really well at http://stackoverflow.com/a/423073/1048589 and is related to variable scope
			// basically, thhe anonymous function sees a reference to a not a copy and the result is it always appearing as the last number
			// so the solution is to provide copies of the variables you want the anonymous function to access which you can do with the helper I've created as shown below
		}
		
		private function attempt2():void {
			
			var functionArray:Array = []; // this will hold the anonymous functions
			for(var i:int=0; i<3; i++) {
				
				var a:String = "The number is "+i;
				// look in the readme for details on this
				functionArray.push(CallbackHelper.createCallback(function(a:String) {
						   		trace(a);
						   }, a));
			}
			
			// call the functions just like before
			functionArray[0](); // traces "The number is 0"
			functionArray[1](); // traces "The number is 1"
			functionArray[2](); // traces "The number is 2"
			
			// the values passed to createCallback as paramaters after the function declaration have been cloned and then passed into the function as paramaters.
		}
	}
}