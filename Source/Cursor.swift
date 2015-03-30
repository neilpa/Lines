//  Copyright (c) 2015 Neil Pankey. All rights reserved.

/// Proper cursor for a string that tracks character index and line/column offset
public struct Cursor : BidirectionalIndexType {
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

    /// Retracts `Cursor` by a single character
    public func predecessor() -> Cursor {
        return Cursor(string, index.predecessor(), position.predecessor(string[index]))
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

extension String {
    /// `Cursor` at the start of string
    public var startCursor: Cursor {
        return Cursor(string: self)
    }

    /// Lookup the character at `cursor`
    public subscript(cursor: Cursor) -> Character {
        return self[cursor.index]
    }

    /// Lookup the string in `range`
    public subscript(range: Range<Cursor>) -> String {
        return self[range.startIndex.index..<range.endIndex.index]
    }

    /// Is `cursor` at the end of the string
    public func isEOF(cursor: Cursor) -> Bool {
        return cursor.index == endIndex
    }

    /// Is `cursor` at the end of a line in string
    public func isEOL(cursor: Cursor) -> Bool {
        return isEOF(cursor) || self[cursor].isNewline
    }
}
