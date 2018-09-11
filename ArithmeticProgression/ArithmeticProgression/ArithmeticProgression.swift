import Foundation

class ArithmeticProgression {
    
    class func findMissingValues(in list: [Int]) -> [Int] {
        guard let first = list.first, let last = list.last, list.count > 2 else {
            return []
        }

        let step = calculateStep(in: list)
        if step == 0 {
            return []
        }

        let (_, missing): (Int, [Int]) = stride(from: first, to: last, by: step).reduce((0, [])) { acc, next in
            let (index, missing) = acc
            if list[index] == next {
                return (index+1, missing)
            }
            return (index, missing + [next])
        }
        
        return missing
    }
    
    class func calculateStep(in list: [Int]) -> Int {
        guard let first = list.first, let last = list.last else {
            return 0
        }

        let (_, step) = list[1...].reduce((list.first!, Int.max)) { acc, next in
            let (previous, minStep) = acc
            let thisStep = next - previous
            
            return (next, min(abs(thisStep), minStep))
        }

        // detemine sign of step i.e. +ive / -ive
        let isAscending = last > first
        let signMultiplier = isAscending ? 1 : -1

        return step * signMultiplier
    }
    
}

