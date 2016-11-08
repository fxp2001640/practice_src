package  {
	import flash.events.Event;
	
	public class BlockStopLifeEvent extends Event{
		public static const BLOCKSTOP:String = "blockstop";
		
		public function BlockStopLifeEvent() {
			super(BLOCKSTOP);
		}

	}
	
}
