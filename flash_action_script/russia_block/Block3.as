package  {
	
	import flash.display.MovieClip;
	
	
	public class Block3 extends ParentBlock {
		
		
		public function Block3(bkCtl:BlockContrl) {
			var pointMap:Array = [[1, 1, 0, 0],
								  [1, 1, 0, 0],
								  [0, 0, 0, 0],
								  [0, 0, 0, 0]
								 ];
			
			super(bkCtl, pointMap, 1);
		}
	}
	
}
