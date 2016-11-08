package  {
	
	import flash.display.MovieClip;
	
	
	public class Block4 extends ParentBlock {
		
		
		public function Block4(bkCtl:BlockContrl) {
			var pointMap:Array = [[1, 1, 1, 1],
								  [0, 0, 0, 0],
								  [0, 0, 0, 0],
								  [0, 0, 0, 0]
								 ];
			
			super(bkCtl, pointMap, 2);
		}
	}
	
}
