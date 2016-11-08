package  {
	
	import flash.display.MovieClip;
	
	
	public class Block5 extends ParentBlock {
		
		
		public function Block5(bkCtl:BlockContrl) {
			var pointMap:Array = [[0, 1, 0, 0],
								  [1, 1, 0, 0],
								  [0, 1, 0, 0],
								  [0, 0, 0, 0]
								 ];
			
			super(bkCtl, pointMap);
		}
	}
	
}
