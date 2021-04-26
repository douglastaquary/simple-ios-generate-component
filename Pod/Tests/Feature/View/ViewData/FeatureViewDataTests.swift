import XCTest
@testable import ${POD_NAME}

class FeatureViewDataTests: XCTestCase {

    // MARK: Subject Under Test
    var viewData: FeatureViewData!
    var modelMock: FeatureModel!

    override func setUp(){
        super.setUp()
        modelMock = .init(value: 150, success: true)
        viewData = .init(model: modelMock)
    }

    // MARK: - Tests
    func testValue() {
        //When
        let result = viewData.value

        //Then
        XCTAssertEqual(result.doubleValue,
                       modelMock.value,
                       "viewData should has same value as model")
    }

    func testMessage() {
        //When
        let result = viewData.message

        //Then
        XCTAssertEqual(result,
                       "Seu valor atual é de R$ 150, 00"),
                       "message should use formatted model value")
    }
}