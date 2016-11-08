package  {
	
	public class BlockHitTester {
		public static const EMPTY:int = -2;
		public static const NODISPLAY:int = -1;
		/*形态数量， 值为{1，2，4}*/
		private var shapeNum:uint;
		/*图形所在正方形的边长*/
		public var shapeWidth:uint;
		/*在舞台点阵中的x坐标， 每次运动后应更新此值*/
		public var orgX:int;
		/*在舞台点阵中的y坐标， 每次运动后应更新此值*/
		public var orgY:int;
        /*本图形的点阵坐标，每次旋转之后应调整此点阵*/
		public var myScope:Array;
		
		public function BlockHitTester(shpN:uint, wd:uint, ox:int = 0, oy:int = 0) {
			var index_x:uint;
			var index_y:uint;
			
			this.shapeNum = shpN;
			this.shapeWidth = wd;
			this.orgX = ox;
			this.orgY = oy;
			
			this.myScope = new Array(this.shapeWidth);
			for(index_x = 0; index_x < this.shapeWidth; index_x++)
			{
				this.myScope[index_x] = new Array(this.shapeWidth);
				for(index_y = 0; index_y < this.shapeWidth; index_y++)
				{
					/*-2=没有图形；-1=有图形，但不显示；(>=0)=有图形且显示，值为图形索引*/
					this.myScope[index_x][index_y] = BlockHitTester.EMPTY;
				}
			}
		}
		
		public function updateOrgXY(ox:int, oy:int)
		{
			this.orgX = ox;
			this.orgY = oy;
		}
		
		public function addHit(px:uint, py:uint, index:int)
		{
			this.myScope[px][py] = index;
		}
		
		public function getPointMapByIndex(index:int, res:Array)
		{
			var index_x:int;
			var index_y:int;
			
			for(index_x = 0; index_x < this.shapeWidth; index_x++)
			{
				for(index_y = 0; index_y < this.shapeWidth; index_y++)
				{
					if(this.myScope[index_x][index_y] == index)
					{
						res[0] = index_x;
						res[1] = index_y;
						return;
					}
				}
			}
		}
		
		public function joinOtherHit(other:BlockHitTester, offset:uint)
		{
			var index_x:int;
			var index_y:int;
			var my_index_x:int;
			var my_index_y:int;
			
			for(index_x = 0; index_x < other.shapeWidth; index_x++)
			{
				for(index_y = 0; index_y < other.shapeWidth; index_y++)
				{
					if(other.myScope[index_x][index_y] != (BlockHitTester.EMPTY))
					{
						my_index_x = index_x + other.orgX - this.orgX;
						my_index_y = index_y + other.orgY - this.orgY;
						if((my_index_x >= 0) && (my_index_y >= 0))
						{
							this.myScope[my_index_x][my_index_y] = other.myScope[index_x][index_y] + offset;
						}
					}
				}
			}
		}
		
		public function hitOtherBlocks(toJudge:BlockHitTester):Boolean
		{
			var minHitTester:BlockHitTester;
			var maxHitTester:BlockHitTester;
			var index_x:uint;
			var index_y:uint;

			if(this.shapeWidth < toJudge.shapeWidth)
			{
				minHitTester = this;
				maxHitTester = toJudge;
			}
			else
			{
				minHitTester = toJudge;
				maxHitTester = this;
			}
			
			for(index_x = 0; index_x < minHitTester.shapeWidth; index_x++)
			{
				for(index_y = 0; index_y < minHitTester.shapeWidth; index_y++)
				{
					if((minHitTester.myScope[index_x][index_y] != (BlockHitTester.EMPTY)) &&
					   (index_x + minHitTester.orgX - maxHitTester.orgX >= 0) &&
					   (index_y + minHitTester.orgY - maxHitTester.orgY >= 0) &&
					   (maxHitTester.myScope[index_x + minHitTester.orgX - maxHitTester.orgX][index_y + minHitTester.orgY - maxHitTester.orgY] != (BlockHitTester.EMPTY)))
					{
						return true;
					}

				}
			}
			
			return false;
		}
		
		public function rotate(byClock:Boolean)
		{
			var myNewScope:Array;
			var xSz:Number = 0;
			var ySz:Number = 0;
			var index_x:uint;
			var index_y:uint;
			
			for(index_x = 0; index_x < this.shapeWidth; index_x++)
			{
				for(index_y = 0; index_y < this.shapeWidth; index_y++)
				{
					if(this.myScope[index_x][index_y] != (BlockHitTester.EMPTY))
					{
						xSz = ((index_x + 1) > xSz)? (index_x + 1) : xSz;
						ySz = ((index_y + 1) > ySz)? (index_y + 1) : ySz;
					}
				}
			}
			
			myNewScope = new Array(this.shapeWidth);
			for(index_x = 0; index_x < this.shapeWidth; index_x++)
			{
				myNewScope[index_x] = new Array(this.shapeWidth);
				for(index_y = 0; index_y < this.shapeWidth; index_y++)
				{
					myNewScope[index_x][index_y] = BlockHitTester.EMPTY;
				}
			}
			
			for(index_x = 0; index_x < xSz; index_x++)
			{
				for(index_y = 0; index_y < ySz; index_y++)
				{
					if(byClock)
					{
						myNewScope[ySz-1-index_y][index_x] = this.myScope[index_x][index_y];
					}
					else
					{
						myNewScope[index_y][xSz-1-index_x] = this.myScope[index_x][index_y];
					}
					
				}
			}
			
			this.myScope = myNewScope;
		}
		
		private function doClearRow(bkCtl:BlockContrl, row:uint)
		{
			var index_x:int;
			var index_y:int;
			
			for(index_x = (-this.orgX); index_x < (bkCtl.xBoundary - this.orgX); index_x++)
			{
				bkCtl.removeBasicBlock(this.myScope[index_x][row]);
				this.myScope[index_x][row] = BlockHitTester.EMPTY;
			}
			
			for(index_y = (row - 1); index_y >= 0; index_y--)
			{
				for(index_x = (-this.orgX); index_x < (bkCtl.xBoundary - this.orgX); index_x++)
				{
					if(this.myScope[index_x][index_y] != (BlockHitTester.EMPTY))
					{
						bkCtl.downBasicBlock(this.myScope[index_x][index_y]);
						this.myScope[index_x][index_y + 1] = this.myScope[index_x][index_y];
						this.myScope[index_x][index_y] = BlockHitTester.EMPTY;
					}
				}
			}
		}
		
		public function clearRow(bkCtl:BlockContrl):uint
		{
			var index_x:uint;
			var index_y:uint;
			var rowIsFull:Boolean;
			var clearedNum:uint = 0;
			
			for(index_y = 0; index_y < bkCtl.yBoundary; index_y++)
			{
				rowIsFull = true;
				for(index_x = (-this.orgX); index_x < (bkCtl.xBoundary - this.orgX); index_x++)
				{
					if(this.myScope[index_x][index_y] == (BlockHitTester.EMPTY))
					{
						rowIsFull = false;
						break;
					}
				}
				
				if(rowIsFull)
				{
					this.doClearRow(bkCtl, index_y);
					clearedNum++;
				}
			}
			
			return clearedNum;
		}
		
		public function getBound(tp:uint):Number
		{
			var xSz:Number = 0;
			var ySz:Number = 0;
			var index_x:uint;
			var index_y:uint;
			
			for(index_x = 0; index_x < this.shapeWidth; index_x++)
			{
				for(index_y = 0; index_y < this.shapeWidth; index_y++)
				{
					if(this.myScope[index_x][index_y] != (BlockHitTester.EMPTY))
					{
						xSz = ((index_x + 1) > xSz)? (index_x + 1) : xSz;
						ySz = ((index_y + 1) > ySz)? (index_y + 1) : ySz;
					}
				}
			}
			
			switch(tp)
			{
				case ParentBlock.TOP:
				return -(ySz/2);
				break;
				
				case ParentBlock.BOTTOM:
				return (ySz/2);
				break;
				
				case ParentBlock.LEFT:
				return -(xSz/2);
				break;
				
				case ParentBlock.RIGHT:
				return (xSz/2);
				break;
				
				default:
				return 0;
				break;
			}
		}
	}
	
}
