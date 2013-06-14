package flexUnitTests {
	import com.ashier.mediators.InputWordMediator;
	import com.ashier.views.InputWords;
	
	import flashx.textLayout.debug.assert;
	
	import org.flexunit.Assert;
	
	public class InputWordsMediatorTestClass {
		
		private var mediator:InputWordMediator;
		
		[Before]
		public function setUp():void {
			mediator = new InputWordMediator(new InputWords());
		}
		
		[After]
		public function tearDown():void {
			mediator = null;
		}
		
		[BeforeClass]
		public static function setUpBeforeClass():void {
		}
		
		[AfterClass]
		public static function tearDownAfterClass():void {
		}
		
		[Test]
		public function testParseText():void {
			Assert.assertEquals( mediator.parseText("It was so and so"), 
				"and 1\n" +
				"it 1\n" +
				"so 2\n" +
				"was 1"
			);
		}
		
	}
}