import XCTest
@testable import ${POD_NAME}

class FeatureViewControllerTests: XCTestCase {

    // MARK: Subject Under Test
    var viewController: FeatureViewController!
    var viewModelSpy: FeatureViewModelSpy!
    var window: UIWindow!

    override func setUp(){
        super.setUp()
        window = UIWindow()
        viewModelSpy = FeatureViewModelSpy()
        viewController = FeatureViewController(viewModel: viewModelSpy)
    }

    override func tearDown(){
        window = nil
        super.tearDown()
    }

    func loadView() {
        // call loadView() when you want viewController to instantiate IBOutlets
        window.addSubview(viewController.view)
        RunLoop.current.run(until: Date())
    }

    // MARK: - Tests
    func testLoadView() {
        //When
        viewController.loadView()

        //Then
        XCTAssert(viewController.view is FeatureView,
                 "loadView() should set FeatureView")
    }

    func testViewDidLoad() {
        //When
        viewController.viewDidLoad()

        //Then
        XCTAssert(viewModelSpy.loadValueCalled,
                 "viewDidLoad() should ask View Model to load value")
    }

    // MARK: - Binding tests
    func testBindViewModel() {
        //When
        viewController.bindViewModel()

        //Then
        XCTAssert(!viewModelSpy.state.listeners.isEmpty,
                 "bindViewModel() should define at least onde bind closure to viewModel properties")
    }

        // MARK: - Delegates Tests
    func testDidTapSimulate() {
        //Given
        let fakeView = FeatureActionView()

        // When
        viewController.didTapSimulate(view: fakeView)

        //Then
        XCTAssert(viewModelSpy.simulateCalled,
                 "didTapSimulate() should call view model")
    }

    func testContinueTap() {
        //Given
        let fakeView = FeatureActionView()

        // When
        viewController.didTapContinue(view: fakeView)

        //Then
        XCTAssert(viewModelSpy.nextCalled,
                 "didTapContinue() should call view model")
    }
}