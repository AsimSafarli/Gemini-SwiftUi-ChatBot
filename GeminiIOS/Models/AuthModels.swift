import Foundation
import Firebase

class AuthViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
    @Published  var errorMessage: String?
    @Published var isLoggedIn: Bool = false

    init() {
           checkUserLoggedIn()
       }
    
    func checkUserLoggedIn() {
           if Auth.auth().currentUser != nil {
               isLoggedIn = true
           } else {
               isLoggedIn = false
           }
       }
    
        func register() {
                Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                    if let error = error {
                        self.errorMessage = error.localizedDescription
                    } else {
                        self.login()
                        print("User created successfully")
                    }
                }
            }
    
    func login() {
          Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
              guard let self = self else { return }
              if let error = error {
                  self.errorMessage = error.localizedDescription
              } else {
                  print("User logged in successfully")
              }
          }
      }
    
    func logout() {
           try? Auth.auth().signOut()
           isLoggedIn = false
       }
}
