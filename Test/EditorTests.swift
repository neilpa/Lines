//  Copyright (c) 2015 Neil Pankey. All rights reserved.

import Lines
import XCTest

final class EditorTests: XCTestCase {

    func testConstruction() {
        verify(Editor(), "", "")
        verify(Editor(str: "asdf"), "", "asdf")
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

    func testMovement() {
        var editor = Editor(str: "123")

        editor.left()
        verify(editor, "", "123")

        editor.right()
        verify(editor, "1", "23")

        editor.end()
        verify(editor, "123", "")

        editor.right()
        verify(editor, "123", "")

        editor.left()
        verify(editor, "12", "3")

        editor.home()
        verify(editor, "", "123")
    }

    func testRemoval() {
        var editor = Editor(str: "qwerty")

        editor.backspace()
        verify(editor, "", "qwerty")

        editor.right()
        editor.backspace()
        verify(editor, "", "werty")

        editor.delete()
        verify(editor, "", "erty")

        editor.end()
        editor.delete()
        verify(editor, "erty", "")

        editor.left()
        editor.backspace()
        verify(editor, "er", "y")

        editor.left()
        editor.delete()
        verify(editor, "e", "y")
    }

    func testClear() {
        var editor = Editor(str: "foobar")

        editor.clearHome()
        verify(editor, "", "foobar")

        editor.end()
        editor.clearEnd()
        verify(editor, "foobar", "")

        editor.move(.Left, 2);
        editor.clearEnd()
        verify(editor, "foob", "")

        editor.move(.Left, 2)
        editor.clearHome()
        verify(editor, "", "ob")

        editor.clear()
        verify(editor, "", "")
    }

    private func verify(editor: Editor, _ head: String, _ tail: String, file: String = __FILE__, line: UInt = __LINE__) {
        XCTAssertEqual(editor.head, head, "", file: file, line: line)
        XCTAssertEqual(editor.tail, tail, "", file: file, line: line)
        XCTAssertEqual(editor.text, head + tail, "", file: file, line: line)
    }
}
