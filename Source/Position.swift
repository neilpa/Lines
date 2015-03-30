//  Copyright (c) 2015 Neil Pankey. All rights reserved.

/// Track line and column number in a string. Negative values represent offset
/// from the end of lines and columns rather than the start.
public struct Position : Comparable {
    /// 1-based line number in a string
    public let line: Int
    /// 1-based column number in a string
    public let column: Int

    /// Construct a `Position` at the start of a string
    public init() {
        self.init(1, 1)
    }

    /// Construct a `Position` at the given line and column
    public init(_ line: Int, _ column: Int) {
        self.line = line
        self.column = column
    }

    /// Advances `Position` by `character`
    public func successor(character: Character) -> Position {
        return character.isNewline ? Position(line + 1, 1) : Position(line, column + 1)
    }

    /// Retracts `Position` by `character`
    public func predecessor(character: Character) -> Position {
        return character.isNewline ? Position(line - 1, -1) : Position(line, column - 1)
    }
}

/// Compares two positions for equality
public func ==(lhs: Position, rhs: Position) -> Bool {
    return lhs.line == rhs.line && lhs.column == rhs.column
}

/// Determines if `lhs` position is less than `rhs` position
public func <(lhs: Position, rhs: Position) -> Bool {
    return lhs.line < rhs.line || (lhs.line == rhs.line && lhs.column < rhs.column)
}
