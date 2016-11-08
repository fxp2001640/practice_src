package  {
	
	import flash.display.MovieClip;
	
	
	public class Block2 extends ParentBlock {
		
		
		public function Block2(bkCtl:BlockContrl) {
			var pointMap:Array = [[1, 0, 0, 0],
								  [1, 1, 0, 0],
								  [0, 1, 0, 0],
								  [0, 0, 0, 0]
								 ];
			
			super(bkCtl, pointMap);
		}
	}
	
}
