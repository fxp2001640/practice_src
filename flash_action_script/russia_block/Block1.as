package  {
	
	import flash.display.MovieClip;
	
	
	public class Block1 extends ParentBlock {
		
		
		public function Block1(bkCtl:BlockContrl) {
			var pointMap:Array = [[1, 1, 1, 0],
								  [0, 0, 1, 0],
								  [0, 0, 0, 0],
								  [0, 0, 0, 0]
								 ];
			
			super(bkCtl, pointMap);
		}
	}
	
}
