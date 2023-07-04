import OSLog
import Foundation

struct Account: CustomStringConvertible {
    let userID: String
    let accountID: String
    let balance: Double

    var description: String { "Account<\(accountID)>" }
}

class AccountService {
    private let logger = Logger(subsystem: "com.charleshs.LoggerDemo", category: "UserService")

    let userID: String

    init(userID: String) {
        self.userID = userID
    }

    deinit {
        logger.debug("Deallocated \(type(of: self))")
    }

    func fetchAccount() {
        logger.debug("Start fetching account for user with id \(self.userID)")

        DispatchQueue.main.asyncAfter(wallDeadline: .now() + 3) {
            let account = Account(userID: self.userID, accountID: "A000001", balance: 9876.54)

            self.logger.debug("""
            Fetched account \(account) for user \(self.userID, privacy: .private(mask: .hash))
            Balance of the account: \(account.balance, format: .fixed(precision: 1), privacy: .public)
            """)
        }
    }
}
