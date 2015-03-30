//  Copyright (c) 2015 Neil Pankey. All rights reserved.

/// Track line and column number in a string. Negative values represent offset
/// from the end of lines and columns rather than the start.
public struct Position : Comparable {
    /// 1-based line number in a string
    public let line: Int
    /// 0-based offset into the current `line`
    public let offset: Int

    /// Construct a `Position` at the start of a string
    public init() {
        self.init(1, 1)
    }

    /// Construct a `Position` at the given line and column
    public init(_ line: Int, _ offset: Int) {
        precondition(line != 0, "1-based line numbers")

        self.line = line
        self.offset = offset
    }

    /// Advances `Position` by `character`
    public func successor(character: Character) -> Position {
        return character.isNewline ? Position(line + 1, 1) : Position(line, offset + 1)
    }

    /// Retracts `Position` relative to `previous` character
    public func predecessor(previous: Character) -> Position {
        return previous.isNewline ? Position(line - 1, -1) : Position(line, offset - 1)
    }
}

/// Compares two positions for exact equality.
///
/// Note for a given string there are semantically equivalent positions if
/// measuring offset from the end of lines that this won't consider equal.
public func ==(lhs: Position, rhs: Position) -> Bool {
    return lhs.line == rhs.line && lhs.offset == rhs.offset
}

/// Determines if `lhs` position is less than `rhs` position.
///
/// Note that this assumes both positions are measured relative to the same
/// starting offset. In other words don't try to compare a negative based
/// position from a positive one.
public func <(lhs: Position, rhs: Position) -> Bool {
    // TODO The above requirement sucks, can we do better.
    return lhs.line < rhs.line || (lhs.line == rhs.line && lhs.offset < rhs.offset)
}
