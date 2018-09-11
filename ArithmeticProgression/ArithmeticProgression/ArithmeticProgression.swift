import Foundation

class ArithmeticProgression {
    
    class func findMissingValues(in list: [Int]) -> [Int] {
        guard list.count > 2 else {
            return []
        }

        let step = calculateStep(in: list)
        return determineMissingValues(in: list, usingStep: step)
    }
    
    private class func calculateStep(in list: [Int]) -> Int {
        guard let first = list.first, let last = list.last else {
            return 0
        }

        // start at list[1] so that we can use the first value as the previous value
        let step = list[1...].reduce((first, Int.max)) { acc, next in
            let (previous, minStep) = acc
            let thisStep = next - previous
            
            return (next, min(abs(thisStep), minStep))
        }.1

        // detemine sign of step i.e. +ive / -ive
        let isAscending = last > first
        let signMultiplier = isAscending ? 1 : -1

        return step * signMultiplier
    }
    
    private class func determineMissingValues(in list: [Int], usingStep step: Int) -> [Int] {
        guard let first = list.first, step != 0 else {
            return []
        }
        return list[1...].reduce((first, [])) { acc, next in
            let (previous, missing) = acc
            let thisStep = next - previous
            if thisStep != step {
                let from = previous + step
                let to = next
                return (next, missing + stride(from: from, to: to, by: step))
            }
            return (next, missing)
        }.1
    }
    

}

