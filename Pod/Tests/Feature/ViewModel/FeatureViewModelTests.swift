import XCTest
@testable import ${POD_NAME}

class FeatureViewModelTests: XCTestCase {

    // MARK: Subject Under Test
    var viewModel: FeatureViewModel!
    var successServiceMock: FeatureServiceSuccessMock!
    var delegateSpy: FeatureViewModelDelegateSpy!

    // MARK: - Tests LifeCycle
    override func setUp(){
        super.setUp()
        delegateSpy = FeatureViewModelDelegateSpy()
        successServiceMock = FeatureServiceSuccessMock()
        viewModel = FeatureViewModel(service: successServiceMock, delegate: delegateSpy)
    }

    // MARK: - Tests
    func testCheckSuccess() {
        //Given
        let mockedValue: Double = 200

        //When
        let result = viewModel.check(value: mockedValue)

        //Then
        XCTAssertFalse(result, "invalid value")
    }

    func testCheckFailure() {
        //Given
        let mockedValue: Double = 20

        //When
        let result = viewModel.check(value: mockedValue)

        //Then
        XCTAssert(result, "value valid")
    }

    func testLoadValue() {
        //Given
        let viewDataExpectation = expectation(description: "trigger viewData bindings")
        viewModel.state.bind { state in
            XCTAssertNotNil(state,
                            "testLoadValue() should set viewData after success request")
            if case .data(_) = state {
                viewDataExpectation.fulfill()
            }
        }

        //When
        viewModel.loadValue()

        //Then
        XCTAssert(successServiceMock.fetchFeatureCalled,
                 "testLoadValue() should ask service to fetch feature")
        waitForExpectations(timeout: 3)
    }

    func testSimulate() {
        //Given
        let mockedValue = NSNumber(value: 10)
        let viewDataExpectation = expectation(description: "trigger viewData bindings")
        viewModel.state.bind { state in
            XCTAssertNotNil(mockedValue,
                            "testLoadValue() should set viewData after success request")
            if case .data(let viewData) = state {
                XCTAssertEqual(mockedValue,
                                viewData.value,
                                "testSimulate() should set same received value")
                viewDataExpectation.fulfill()
            } else {
                XCTFail("invalid state type")
            }
        }

        //When
        viewModel.simulate(with: mockedValue)

        //Then
        waitForExpectations(timeout: 3)
    }

    func testNext() {
        // When 
        viewModel.next()

        // Then
        XCTAssert(delegateSpy.goToNextFeatureCalled, "next() should call coordinator delegate")
    }
}