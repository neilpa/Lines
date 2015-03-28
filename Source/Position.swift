//  Copyright (c) 2015 Neil Pankey. All rights reserved.

/// Track line and column number in a string
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
}

/// Compares two positions for equality
public func ==(lhs: Position, rhs: Position) -> Bool {
    return lhs.line == rhs.line && lhs.column == rhs.column
}

/// Determines `lhs` position is less than `rhs` position
public func <(lhs: Position, rhs: Position) -> Bool {
    return lhs.line < rhs.line || (lhs.line == rhs.line && lhs.column < rhs.column)
}
