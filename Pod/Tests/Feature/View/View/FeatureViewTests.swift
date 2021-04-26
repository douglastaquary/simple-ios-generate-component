import XCTest
@testable import ${POD_NAME}

class FeatureViewTests: XCTestCase {

    // MARK: Subject Under Test
    var view: FeatureView!
    var contentViewSpy: FeatureContentViewSpy!

    override func setUp(){
        super.setUp()
        view = FeatureView()
        contentViewSpy = .init()
        view.contentView = contentViewSpy
    }

    // MARK: - Tests
    func testSetupViewData() {
        //When
        view.setupViewData(FeatureViewDataTypeMock())

        //Then
        XCTAssert(delegateSpy.didTapSimuleteCalled,
                 "simulateTap() delegate action")
    }

    func testContinueTap() {
        //When
        view.continueTap()

        //Then
        XCTAssert(contentViewSpy.setupViewDataCalled,
                 "setupViewData should set view data`s values")
    }
}