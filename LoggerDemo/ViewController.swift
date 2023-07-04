//
//  ViewController.swift
//  LoggerDemo
//
//  Created by Charles Hsieh on 2023/7/2.
//

import ModuleA
import ModuleB
import OSLog
import UIKit

class ViewController: UIViewController {

    private let authLog = Logger(subsystem: "com.charleshs.LoggerDemo", category: "Authentication")

    @IBOutlet weak private var usernameField: UITextField!
    @IBOutlet weak private var passwordField: UITextField!
    @IBOutlet weak private var signInButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        let service = AccountService(userID: UUID().uuidString)

        service.fetchAccount()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        DispatchQueue.main.asyncAfter(wallDeadline: .now() + 3.0) {
            FeatureA().run()
            FeatureB().run()
        }
    }

    @IBAction func signInButtonTapped(_ sender: Any) {
        let username = usernameField.text
        let password = passwordField.text

        guard let username, !username.isEmpty else {
            authLog.log("User entered empty username.")
            return
        }
        guard let password, !password.isEmpty else {
            authLog.log("User entered empty password.")
            return
        }

        authLog.log("username=\(username), password=\(password, privacy: .private(mask: .hash))")
    }

}
