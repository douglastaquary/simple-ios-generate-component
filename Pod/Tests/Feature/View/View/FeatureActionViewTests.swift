import XCTest
@testable import ${POD_NAME}

class FeatureActionViewTests: XCTestCase {

    // MARK: Subject Under Test
    var view: FeatureActionView!
    var delegateSpy: FeatureActionViewDelegateSpy!

    override func setUp(){
        super.setUp()
        delegateSpy = .init()
        view = .init(delegate: delegateSpy)
    }

    // MARK: - Tests
    func testSimulateTap() {
        //When
        view.simulateTap()

        //Then
        XCAssert(delegateSpy.didTapSimuleteCalled,
                 "simulateTap() delegate action")
    }

    func testContinueTap() {
        //When
        view.continueTap()

        //Then
        XCAssert(delegateSpy.didTapSimuleteCalled,
                 "continueTap() delegate action")
    }
}