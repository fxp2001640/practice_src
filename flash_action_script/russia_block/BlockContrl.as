package  {
	import flash.display.MovieClip;
	
	public class BlockContrl extends MovieClip{
		public var blockSize:uint;

		public var yMoveTime:uint;
		public var xBoundary:uint;
		public var yBoundary:uint;
		private var numOfBlockType:uint;
		private var activeBlock:ParentBlock;
		public var childBlock:Array;
		public var myHitTester:BlockHitTester;
		
		public function BlockContrl(bkSz:uint, typeNum:uint, yMvT:uint, xBd:uint, yBd:uint) {
			var wd:uint;
			var index_x:uint;
			var index_y:uint;
			
			this.blockSize = bkSz;
			this.numOfBlockType = typeNum;
			this.yMoveTime = yMvT;
			this.xBoundary = xBd/this.blockSize;
			this.yBoundary = yBd/this.blockSize;
			
			wd = ((this.xBoundary + 2) > (this.yBoundary + 1))? (this.xBoundary + 2) : (this.yBoundary + 1);
			this.myHitTester = new BlockHitTester(1, wd, -1, 0);
			this.childBlock = new Array();
			
			for(index_x = 1, index_y = this.yBoundary; index_x < (this.xBoundary + 1); index_x++)
			{
				this.myHitTester.addHit(index_x, index_y, BlockHitTester.NODISPLAY);
			}
			
			for(index_x = 0, index_y = 0; index_y < this.yBoundary; index_y++)
			{
				this.myHitTester.addHit(index_x, index_y, BlockHitTester.NODISPLAY);
				this.myHitTester.addHit((index_x + 1 + this.xBoundary), index_y, BlockHitTester.NODISPLAY);
			}
		}
		
		public function startRun()
		{
			/*start stage*/
			this.activeBlock = this.getBlockRandly();
			this.addChild(this.activeBlock);
			this.activeBlock.addEventListener(BlockStopLifeEvent.BLOCKSTOP, this.processBlockStopEvent);
			this.activeBlock.startMyLife(this);
		}

		public function removeBasicBlock(index:uint)
		{
			var bk:Block = this.childBlock[index];
			
			this.removeChild(bk);
			/*这里需要显式的释放资源*/
			this.childBlock[index] = null;
		}
		
		public function downBasicBlock(index:uint)
		{
			var bk:Block = this.childBlock[index];
			
			bk.y += this.blockSize;
		}
		
		private function processBlockStopEvent(evt:BlockStopLifeEvent)
		{
			var newXY:Array = new Array(2);
			var index:uint;
			var my_index_x:int;
			var my_index_y:int;
			var offset:uint = 0;
			var indexBk:Block;
			
			this.activeBlock.removeEventListener(BlockStopLifeEvent.BLOCKSTOP, this.processBlockStopEvent);
			this.removeChild(this.activeBlock);
			
			for(index = 0; index < this.activeBlock.childBlock.length; index++)
			{
				while(this.childBlock[offset] != null)
				{
					++offset;
				}
				
				this.childBlock[offset] = this.activeBlock.childBlock[index];
				
				this.activeBlock.myHitTester.getPointMapByIndex(index, newXY);
				my_index_x = newXY[0] + this.activeBlock.myHitTester.orgX - this.myHitTester.orgX;
				my_index_y = newXY[1] + this.activeBlock.myHitTester.orgY - this.myHitTester.orgY;
				this.myHitTester.addHit(my_index_x, my_index_y, offset);
				
				indexBk = this.childBlock[offset];
				indexBk.x = this.blockSize * (my_index_x + this.myHitTester.orgX);
				indexBk.y = this.blockSize * (my_index_y + this.myHitTester.orgY);
				this.addChild(indexBk);
				//trace("hit: x=" + indexBk.x + ", y=" + indexBk.y);
			}
			
			this.activeBlock = null;
			MovieClip(root).score.text = String(Number(MovieClip(root).score.text) + this.myHitTester.clearRow(this));
			this.startRun();
		}
		
		private function getBlockByType(type:uint):ParentBlock
		{
			var bk:ParentBlock = null;
			var xp_bk:Block1;
			
			switch(type)
			{
				case 1:
				bk = new Block1(this);
				break;
				
				case 2:
				bk = new Block2(this);
				break;
				
				case 3:
				bk = new Block3(this);
				break;

				case 4:
				bk = new Block4(this);
				break;
				
				case 5:
				bk = new Block5(this);
				break;
				
				default:
				bk = null;
				break;
			}
			
			return bk;
		}
		
		private function getBlockRandly():ParentBlock
		{
			var type:uint = 1 + (Math.round(Math.random()*100) % this.numOfBlockType);
			
			return this.getBlockByType(type);
		}

	}
	
}
