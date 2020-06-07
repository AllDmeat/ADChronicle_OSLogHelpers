import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(ADChronicle_OSLogHelpersTests.allTests),
    ]
}
#endif
