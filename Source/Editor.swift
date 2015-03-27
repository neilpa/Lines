//  Copyright (c) 2015 Neil Pankey. All rights reserved.

/// Simple text buffer for editing a string. Consists of `head` and `tail` portions
/// with an implied cursor that sits between them.
public struct Editor {
    /// Construct an empty `Editor`
    public init() {
    }

    /// Construct an `Editor` from `str` placing cursor at home
    public init(str: String) {
        tail = str
    }


    /// The prefix of the string
    public private(set) var head = ""

    /// The suffix of the string
    public private(set) var tail = ""

    /// The contents of `Editor`
    public var text: String {
        return head + tail
    }


    /// Move backward one character if `head` is non-empty
    public mutating func left() {
        if let char = dropLast(&head) {
            tail.insert(char, atIndex: tail.startIndex)
        }
    }

    /// Move forward one character if `tail` is non-empty
    public mutating func right() {
        if let char = dropFirst(&tail) {
            head.append(char)
        }
    }

    /// Moves to the start of `text`
    public mutating func home() {
        tail = head + tail
        head = ""
    }

    /// Moves to the end of `text`
    public mutating func end() {
        head.extend(tail)
        tail = ""
    }


    /// Insert a new character at the end of `head`
    public mutating func insert(char: Character) {
        head.append(char)
    }

    /// Insert a new string at the end of `head`
    public mutating func insert(str: String) {
        head.extend(str)
    }
    /// Delete the last character of `head` if non-empty
    public mutating func backspace() {
        dropLast(&head)
    }

    /// Delete the first character of `tail` if non-empty
    public mutating func delete() {
        dropFirst(&tail)
    }

    /// Deletes all text in `Editor`
    public mutating func clear() {
        head = ""
        tail = ""
    }

    /// Deletes all text in `head`
    public mutating func clearHome() {
        head = ""
    }

    /// Deletes all text in `tail`
    public mutating func clearEnd() {
        tail = ""
    }


    /// Remove the first character from `str`
    private func dropFirst(inout str: String) -> Character? {
        return !isEmpty(str) ? str.removeAtIndex(str.startIndex) : nil
    }

    /// Remove the last character from `str`
    private func dropLast(inout str: String) -> Character? {
        return !isEmpty(str) ? str.removeAtIndex(str.endIndex.predecessor()) : nil
    }
}
