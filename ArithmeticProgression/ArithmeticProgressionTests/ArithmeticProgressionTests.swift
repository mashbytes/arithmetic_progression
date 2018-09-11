import XCTest
@testable import ArithmeticProgression

class ArithmeticProgressionTests: XCTestCase {
    
    func testReturnsEmptyArrayWhenEmptyInput() {
        XCTAssertEqual([], ArithmeticProgression.findMissingValues(in: []))
    }

    func testReturnsEmptyArrayWhenLessThan3Values() {
        XCTAssertEqual([], ArithmeticProgression.findMissingValues(in: [1]))
        XCTAssertEqual([], ArithmeticProgression.findMissingValues(in: [1,2]))
    }

    func testReturnsEmptyArrayWhenAllValuesSame() {
        XCTAssertEqual([], ArithmeticProgression.findMissingValues(in: [1,1,1,1,1,1,1]))
    }

    func testReturnsEmptyArrayWhenNoMissingValues_inputAllPositive() {
        XCTAssertEqual([], ArithmeticProgression.findMissingValues(in: [1,2,3]))
        XCTAssertEqual([], ArithmeticProgression.findMissingValues(in: [1,3,5]))
        XCTAssertEqual([], ArithmeticProgression.findMissingValues(in: [10,14,18]))
    }

    func testReturnsEmptyArrayWhenNoMissingValues_inputAllNegative() {
        XCTAssertEqual([], ArithmeticProgression.findMissingValues(in: [-1,-2,-3]))
        XCTAssertEqual([], ArithmeticProgression.findMissingValues(in: [-5,-3,-1]))
        XCTAssertEqual([], ArithmeticProgression.findMissingValues(in: [-10,-14,-18]))
    }

    func testReturnsEmptyArrayWhenNoMissingValues_inputMixture() {
        XCTAssertEqual([], ArithmeticProgression.findMissingValues(in: [-5,0,5]))
        XCTAssertEqual([], ArithmeticProgression.findMissingValues(in: [1,-3,-7]))
        XCTAssertEqual([], ArithmeticProgression.findMissingValues(in: [-10,-5,0]))
    }

    func testReturnsSingleValueWhenOnlyOneValueMissing_inputAllPositive() {
        XCTAssertEqual([3], ArithmeticProgression.findMissingValues(in: [1,2,4]))
        XCTAssertEqual([4], ArithmeticProgression.findMissingValues(in: [0,2,6]))
        XCTAssertEqual([32], ArithmeticProgression.findMissingValues(in: [12,22,42]))
    }
    
    func testReturnsSingleValueWhenOnlyOneValueMissing_inputAllNegative() {
        XCTAssertEqual([-3], ArithmeticProgression.findMissingValues(in: [-1,-2,-4]))
        XCTAssertEqual([-4], ArithmeticProgression.findMissingValues(in: [0,-2,-6]))
        XCTAssertEqual([-32], ArithmeticProgression.findMissingValues(in: [-12,-22,-42]))
    }

    func testReturnsSingleValueWhenOnlyOneValueMissing_inputMixture() {
        XCTAssertEqual([5], ArithmeticProgression.findMissingValues(in: [-5,0,10]))
        XCTAssertEqual([-7], ArithmeticProgression.findMissingValues(in: [1,-3,-11]))
        XCTAssertEqual([-5], ArithmeticProgression.findMissingValues(in: [-10,0,5]))
    }

    func testReturnsMultipleNonConsecutiveValues_inputAllPositive() {
        XCTAssertEqual([3,6], ArithmeticProgression.findMissingValues(in: [1,2,4,5,7]))
        XCTAssertEqual([4,8,16,20], ArithmeticProgression.findMissingValues(in: [0,2,6,10,12,14,18,22]))
        XCTAssertEqual([32,72], ArithmeticProgression.findMissingValues(in: [12,22,42,52,62,82]))
    }

    func testReturnsMultipleNonConsecutiveValues_inputAllNegative() {
        XCTAssertEqual([-3,-5], ArithmeticProgression.findMissingValues(in: [-1,-2,-4,-6]))
        XCTAssertEqual([-8,-4], ArithmeticProgression.findMissingValues(in: [-10,-6,-2,0]))
        XCTAssertEqual([-12,-32,-62], ArithmeticProgression.findMissingValues(in: [-2,-22,-42,-52,-72]))
    }

    func testReturnsMultipleNonConsecutiveValues_inputMixture() {
        XCTAssertEqual([-10,10], ArithmeticProgression.findMissingValues(in: [-30,-20,0,20]))
        XCTAssertEqual([1,-5], ArithmeticProgression.findMissingValues(in: [3,-1,-3,-7]))
        XCTAssertEqual([5,10], ArithmeticProgression.findMissingValues(in: [-10,-5,0,15]))
    }

    func testReturnsMultipleConsecutiveValues_inputAllPositive() {
        XCTAssertEqual([3,4], ArithmeticProgression.findMissingValues(in: [1,2,5,6,7]))
        XCTAssertEqual([4,6,8,18,20], ArithmeticProgression.findMissingValues(in: [0,2,10,12,14,16,22]))
        XCTAssertEqual([32,42,72], ArithmeticProgression.findMissingValues(in: [12,22,52,62,82]))
    }

    func testReturnsMultipleConsecutiveValues_inputAllNegative() {
        XCTAssertEqual([-3,-4], ArithmeticProgression.findMissingValues(in: [-1,-2,-5,-6]))
        XCTAssertEqual([-6,-3], ArithmeticProgression.findMissingValues(in: [-12,-9,0]))
        XCTAssertEqual([-12,-22,-32], ArithmeticProgression.findMissingValues(in: [-2,-42,-52,-62]))
    }

    func testReturnsMultipleConsecutiveValues_inputMixture() {
        XCTAssertEqual([0,-1], ArithmeticProgression.findMissingValues(in: [3,2,1,-2,-3]))
        XCTAssertEqual([0,1], ArithmeticProgression.findMissingValues(in: [-3,-2,-1,2,3]))
        XCTAssertEqual([0,-4], ArithmeticProgression.findMissingValues(in: [4,-8,-12,-16]))

    }

    

}
