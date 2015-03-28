//  Copyright (c) 2015 Neil Pankey. All rights reserved.

/// Proper cursor for a string that tracks character offset and line/column
public struct Cursor : ForwardIndexType {
    /// Offset into the string
    public let index: String.Index
    /// Line and column in the string
    public let position: Position

    /// Corresponding `string` for `Cursor`
    private let string: String

    /// Construct a `Cursor` at the start of `string`
    public init(string: String) {
        self.init(string, string.startIndex, Position())
    }

    /// Advance `Cursor` by a single character
    public func successor() -> Cursor {
        return Cursor(string, index.successor(), position.successor(string[index]))
    }

    /// Construct a `Cursor` for `string` at the given `index` and `position`
    private init(_ string: String, _ index: String.Index, _ position: Position) {
        self.string = string
        self.index = index
        self.position = position
    }
}

/// Compares two cursors for equality
public func ==(lhs: Cursor, rhs: Cursor) -> Bool {
    return lhs.index == rhs.index
}

/// Determines if `lhs` cursor is less than `rhs` cursor
public func <(lhs: Cursor, rhs: Cursor) -> Bool {
    return lhs.index < rhs.index
}
