import Foundation

class ArithmeticProgression {
    
    class func findMissingValues(in list: [Int]) -> [Int] {
        guard let first = list.first, let last = list.last, list.count > 2 else {
            return []
        }

        let difference = calculateDifference(in: list)
        if difference == 0 {
            return []
        }
        
        let multiplier = last > first ? 1 : -1
        
        let (_, missing): (Int, [Int]) = list[1...].reduce((first, [])) { acc, next in
            let (previous, missing) = acc
            if (next - previous) == difference {
                return (next, missing)
            }
            let numberToInsert = (next - previous) / difference
            if numberToInsert == 0 {
                return (next, missing)
            }
            let toInsert = sequence(first: previous + (difference * multiplier), next: { $0 + (difference * multiplier)  }).prefix(abs(numberToInsert) - 1)
            
            return (next, missing + toInsert)
        }

        return missing
    }
    
    class func calculateDifference(in list: [Int]) -> Int {
        let (_, difference) = list[1...].reduce((list.first!, Int.max)) { acc, next in
            let (previous, minimumDifference) = acc
            let difference = next - previous
            
            return (next, min(abs(difference), minimumDifference))
        }
        return difference
    }
    
    class func array(sized size: Int, start: Int, generator: (Int) -> Int) -> [Int] {
        return [0..<size].reduce([start]) { acc, _ in
            guard let previous = acc.last else {
                return acc
            }
            let next = generator(previous)
            return acc + [next]
        }
    }
    
}

