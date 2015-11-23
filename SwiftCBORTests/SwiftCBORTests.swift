import XCTest
@testable import SwiftCBOR

class SwiftCBORTests: XCTestCase {
	
	override func setUp() {
		super.setUp()
	}
	
	override func tearDown() {
		super.tearDown()
	}
	
	func testDecodeNumbers() {
		for i in (0..<18) {
			XCTAssertEqual(try! CBORDecoder(input: [UInt8(i)]).decodeItem() as? Int, i)
		}
		XCTAssertEqual(try! CBORDecoder(input: [0x18, 0xff]).decodeItem() as? UInt, 255)
		XCTAssertEqual(try! CBORDecoder(input: [0x19, 0xff, 0xff]).decodeItem() as? UInt, 65535)
		do { try CBORDecoder(input: [0x19, 0xff]).decodeItem(); XCTAssertTrue(false) } catch { XCTAssertTrue(true) }
		XCTAssertEqual(try! CBORDecoder(input: [0x1a, 0xff, 0xff, 0xff, 0xff]).decodeItem() as? UInt, 4294967295)
		do { try CBORDecoder(input: [0x1a]).decodeItem(); XCTAssertTrue(false) } catch { XCTAssertTrue(true) }
		XCTAssertEqual(try! CBORDecoder(input: [0x1b, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff]).decodeItem() as? UInt, 18446744073709551615)
		do { try CBORDecoder(input: [0x1b, 0x00, 0x00]).decodeItem(); XCTAssertTrue(false) } catch { XCTAssertTrue(true) }
	}
	
	func testPerformanceExample() {
		self.measureBlock {
		}
	}
	
}