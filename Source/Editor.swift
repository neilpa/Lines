//  Copyright (c) 2015 Neil Pankey. All rights reserved.

/// Simple text buffer for editing a string. Consists of `head` and `tail` portions
/// with an implied cursor that sits between them.
public struct Editor {
    /// Construct an empty `Editor`
    public init() {
    }

    /// The prefix of the string
    public private(set) var head = ""

    /// The suffix of the string
    public private(set) var tail = ""

    /// The contents of `Editor`
    public var text: String {
        return head + tail
    }

    /// Insert a new character at the end of `head`
    public mutating func insert(char: Character) {
        head.append(char)
    }

    /// Insert a new string at the end of `head`
    public mutating func insert(str: String) {
        head.extend(str)
    }
}
