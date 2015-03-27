//  Copyright (c) 2015 Neil Pankey. All rights reserved.

public extension String {
    public var lines: [String] {
        return split(self, allowEmptySlices: true) { $0.isNewline }
    }
}
