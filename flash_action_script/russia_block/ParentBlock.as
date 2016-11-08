package  {
	import flash.display.MovieClip;
	import flash.events.KeyboardEvent;
	import flash.ui.Keyboard;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	
	public class ParentBlock extends MovieClip{
		public static const TOP:uint = 0;
		public static const BOTTOM:uint = 1;
		public static const LEFT:uint = 2;
		public static const RIGHT:uint = 3;
		
		private var blockSize:uint;
		private var yMoveTime:uint;
		private var shapeNum:uint;

		public var myHitTester:BlockHitTester;
		private var yMoveTimer:Timer;
		private var blockCtl:BlockContrl;
		public var childBlock:Array;

		public function ParentBlock(bkCtl:BlockContrl, pointMap:Array, shpN:uint = 4, wd:uint = 4) {
			var index_x:uint;
			var index_y:uint;
			var index:int;
			var orgX:uint;
			var orgY:uint;
			var newBk:Block;
			
			this.blockSize = bkCtl.blockSize;
			this.yMoveTime = bkCtl.yMoveTime;
			this.shapeNum = shpN;
			
			this.blockCtl = bkCtl;
			this.myHitTester = new BlockHitTester(this.shapeNum, wd);
			this.childBlock = new Array();
			
			index = 0;
			for(index_x = 0; index_x < wd; index_x++)
			{
				for(index_y = 0; index_y < wd; index_y++)
				{
					if(pointMap[index_x][index_y] > 0)
					{
						newBk = new Block();
						newBk.x = index_x * this.blockSize;
						newBk.y = index_y * this.blockSize;
						this.childBlock[index] = newBk;
						
						this.myHitTester.addHit(index_x,index_y, index);
						index++;
					}
					else if(pointMap[index_x][index_y] < 0)
					{
						this.myHitTester.addHit(index_x,index_y, BlockHitTester.NODISPLAY);
					}
				}
			}
			
			for(index = 0; index < this.childBlock.length; index++)
			{
				newBk = this.childBlock[index];
				newBk.x += this.blockSize * this.myHitTester.getBound(ParentBlock.LEFT);
				newBk.y += this.blockSize * this.myHitTester.getBound(ParentBlock.TOP);
				this.addChild(newBk);
			}
			
			orgX = this.blockCtl.xBoundary/2;
			orgY = 0;
			this.myHitTester.updateOrgXY(orgX, orgY);
			this.x = (orgX - this.myHitTester.getBound(ParentBlock.LEFT)) * this.blockSize;
			this.y = (orgY - this.myHitTester.getBound(ParentBlock.TOP)) * this.blockSize;
			//trace("x=" + this.x + ", y=" + this.y);
		}

		public function startMyLife(bkCtl:BlockContrl)
		{
			this.yMoveTimer = new Timer(this.yMoveTime);
			this.yMoveTimer.addEventListener(TimerEvent.TIMER, this.processTimer);
			stage.addEventListener(KeyboardEvent.KEY_UP, this.processKeyEvent);
			this.yMoveTimer.start();
			
		}
		
		public function stopMyLife()
		{
			this.yMoveTimer.stop();
			this.yMoveTimer.removeEventListener(TimerEvent.TIMER, this.processTimer);
			stage.removeEventListener(KeyboardEvent.KEY_UP, this.processKeyEvent);
			this.dispatchEvent(new BlockStopLifeEvent());
		}
		
		private function processTimer(evt:TimerEvent)
		{
			var oldy:Number;
			var xIncr:Number;
			var yIncr:Number;
			
			oldy = this.y;
			this.y += this.blockSize;
			xIncr = this.blockSize * this.myHitTester.getBound(ParentBlock.LEFT);
			yIncr = this.blockSize * this.myHitTester.getBound(ParentBlock.TOP);
			this.myHitTester.updateOrgXY(Math.round((this.x + xIncr)/this.blockSize), Math.round((this.y + yIncr)/this.blockSize));
			if(this.myHitTester.hitOtherBlocks(this.blockCtl.myHitTester) == true)
			{
				this.y = oldy;
				this.myHitTester.updateOrgXY(Math.round((this.x + xIncr)/this.blockSize), Math.round((this.y + yIncr)/this.blockSize));
				this.stopMyLife();
			}			
		}
		
		private function processKeyEvent(evt:KeyboardEvent)
		{
			var oldx:Number;
			var oldy:Number;
			var xIncr:Number;
			var yIncr:Number;
			
			switch(evt.keyCode)
			{
				case Keyboard.LEFT:
				case Keyboard.RIGHT:
				oldx = this.x;
				if(evt.keyCode == Keyboard.LEFT)
				{
					this.x -= this.blockSize;
				}
				else
				{
					this.x += this.blockSize;
				}
				xIncr = this.blockSize * this.myHitTester.getBound(ParentBlock.LEFT);
				yIncr = this.blockSize * this.myHitTester.getBound(ParentBlock.TOP);
				this.myHitTester.updateOrgXY(Math.round((this.x + xIncr)/this.blockSize), Math.round((this.y + yIncr)/this.blockSize));
				if(this.myHitTester.hitOtherBlocks(this.blockCtl.myHitTester) == true)
				{
					this.x = oldx;
					this.myHitTester.updateOrgXY(Math.round((this.x + xIncr)/this.blockSize), Math.round((this.y + yIncr)/this.blockSize));
				}
				//trace("x=" + this.x + ", y=" + this.y);
				break;
				
				case Keyboard.UP:
				oldx = this.x;
				oldy = this.y;
				
				this.myHitTester.rotate(true);
				this.rotation += 90;
				xIncr = this.blockSize * this.myHitTester.getBound(ParentBlock.LEFT);
				yIncr = this.blockSize * this.myHitTester.getBound(ParentBlock.TOP);
				this.x = Math.round((this.x + xIncr)/this.blockSize) * this.blockSize - xIncr;
				this.y = Math.round((this.y + yIncr)/this.blockSize) * this.blockSize - yIncr;
				this.myHitTester.updateOrgXY(Math.round((this.x + xIncr)/this.blockSize), Math.round((this.y + yIncr)/this.blockSize));
				if(this.myHitTester.hitOtherBlocks(this.blockCtl.myHitTester) == true)
				{
					this.myHitTester.rotate(false);
					this.rotation -= 90;
					xIncr = this.blockSize * this.myHitTester.getBound(ParentBlock.LEFT);
					yIncr = this.blockSize * this.myHitTester.getBound(ParentBlock.TOP);
					this.x = oldx;
					this.y = oldy;
					this.myHitTester.updateOrgXY(Math.round((this.x + xIncr)/this.blockSize), Math.round((this.y + yIncr)/this.blockSize));
				}
				break;
				
				case Keyboard.DOWN:
				oldy = this.y;
				this.y += this.blockSize;
				xIncr = this.blockSize * this.myHitTester.getBound(ParentBlock.LEFT);
				yIncr = this.blockSize * this.myHitTester.getBound(ParentBlock.TOP);
				this.myHitTester.updateOrgXY(Math.round((this.x + xIncr)/this.blockSize), Math.round((this.y + yIncr)/this.blockSize));
				if(this.myHitTester.hitOtherBlocks(this.blockCtl.myHitTester) == true)
				{
					this.y = oldy;
					this.myHitTester.updateOrgXY(Math.round((this.x + xIncr)/this.blockSize), Math.round((this.y + yIncr)/this.blockSize));
					this.stopMyLife();
				}			
				break;
				
				default:
				break;
			}
		}
	}
	
}
