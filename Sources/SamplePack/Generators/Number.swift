import CoreGraphics
import Foundation

public final class Number {
    public func randomBool() -> Bool {
        return randomInt() % 2 == 0
    }

    public func randomInt(min: Int = 0, max: Int = 1000) -> Int {
        var i = 0
        arc4random_buf(&i, MemoryLayout.size(ofValue: i))
        i = i & Int.max // Make the number positive

        if max >= 0 && max - Int.max >= min {
            return min + i
        }

        return min + (i % (max - min))
    }

    public func randomFloat(min: Float = 0, max: Float = 1000) -> Float {
        return (Float(arc4random()) / Float(UInt32.max)) * (max - min) + min
    }

    public func randomCGFloat(min: CGFloat = 0, max: CGFloat = 1000) -> CGFloat {
        return CGFloat(Float(arc4random()) / Float(UInt32.max)) * (max - min) + min
    }

    public func randomDouble(min: Double = 0, max: Double = 1000) -> Double {
        return (Double(arc4random()) / Double(UInt32.max)) * (max - min) + min
    }

    public func increasingUniqueID() -> Int {
        OSAtomicIncrement64(&lastUsedID)
        return Int(lastUsedID)
    }

    fileprivate var lastUsedID: Int64 = 0
}
