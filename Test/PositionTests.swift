//  Copyright (c) 2015 Neil Pankey. All rights reserved.

import Lines
import XCTest

final class PositionTests: XCTestCase {

    func testEquatable() {
        XCTAssert(Position() == Position())
        XCTAssert(Position() == Position(1, 1))
        XCTAssert(Position(2, 3) == Position(2, 3))

        XCTAssert(Position(2, 4) != Position(1, 1))
        XCTAssert(Position(2, 1) != Position(1, 1))
        XCTAssert(Position(1, 2) != Position(1, 1))
    }

    func testComparable() {
        XCTAssert(Position() <= Position())
        XCTAssert(Position() >= Position(1, 1))

        XCTAssert(Position() < Position(1, 2))
        XCTAssert(Position() < Position(2, 1))

        XCTAssert(Position(1, 3) > Position(1, 2))
        XCTAssert(Position(3, 2) > Position(2, 2))

        XCTAssert(Position(3, 4) < Position(4, 3))
        XCTAssert(Position(4, 3) < Position(4, 4))
    }
}
