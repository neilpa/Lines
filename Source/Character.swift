//  Copyright (c) 2015 Neil Pankey. All rights reserved.

public extension Character {
    public var isNewline: Bool {
        return self == "\n" || self == "\r"
    }

    public var isWhitespace: Bool {
        return self == " " || self == "\t"
    }
}