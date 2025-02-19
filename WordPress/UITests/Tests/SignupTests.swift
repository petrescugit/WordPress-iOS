import UITestsFoundation
import XCTest

class SignupTests: XCTestCase {

    override func setUpWithError() throws {
        try super.setUpWithError()
        setUpTestSuite()
    }

    override func tearDownWithError() throws {
        takeScreenshotOfFailedTest()
    }

    func testEmailSignup() throws {
        try WelcomeScreen()
            .selectSignup()
            .selectEmailSignup()
            .proceedWith(email: WPUITestCredentials.signupEmail)
            .openMagicSignupLink()
            .verifyEpilogueContains(
                username: WPUITestCredentials.signupUsername,
                displayName: WPUITestCredentials.signupDisplayName
            )
            .setPassword(WPUITestCredentials.signupPassword)
            .continueWithSignup()
            .dismissNotificationAlertIfNeeded()
            .assertScreenIsLoaded()
    }
}
