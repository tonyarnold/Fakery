import Foundation

#if !os(Linux)
    import CoreGraphics
#endif

public final class Number {
  fileprivate var lastUsedId: Int64 = 0

  public func randomBool() -> Bool {
    return randomInt() % 2 == 0
  }

  public func randomInt(min: Int = 0, max: Int = 1000) -> Int {
    var i: Int = 0
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
    
#if !os(Linux)
  public func randomCGFloat(min: CGFloat = 0, max: CGFloat = 1000) -> CGFloat {
    return CGFloat(Float(arc4random()) / Float(UInt32.max)) * (max - min) + min
  }
#endif

  public func randomDouble(min: Double = 0, max: Double = 1000) -> Double {
    return (Double(arc4random()) / Double(UInt32.max)) * (max - min) + min
  }

#if !os(Linux)
  public func increasingUniqueId() -> Int {
    OSAtomicIncrement64(&lastUsedId)
    return Int(lastUsedId)
  }
#endif

}

#if os(Linux)
    public func arc4random(_ max: UInt32) -> Int32 {
        print("random")
        return Int32(random() % Int32(max-1))
    }
    
    public func arc4random() -> Int32 {
        print("random")
        return Int32(random() % Int32(1))
    }
    
    public func arc4random_uniform(_ max: UInt32) -> Int32 {
        print("random_uniform")
        return Int32(random() % Int32(max-1))
    }
    
    public func arc4random_uniform() -> Int32 {
        print("random_uniform")
        return Int32(random() % Int32(max-1))
    }
#endif
