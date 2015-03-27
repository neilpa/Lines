//  Copyright (c) 2015 Neil Pankey. All rights reserved.

import XCTest
import Lines

final class EditorTests: XCTestCase {

    func testEmpty() {
        var editor = Editor()
        XCTAssertEqual(editor.head, "")
        XCTAssertEqual(editor.tail, "")
        XCTAssertEqual(editor.text, "")
    }

    func testInsert() {
        var editor = Editor()

        editor.insert("a")
        XCTAssertEqual(editor.text, "a")

        editor.insert("b")
        XCTAssertEqual(editor.text, "ab")

        editor.insert("cde")
        XCTAssertEqual(editor.text, "abcde")
    }
}
