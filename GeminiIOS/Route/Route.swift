//
//  Route.swift
//  GeminiIOS
//
//  Created by Asim Seferli on 02.03.24.
//
import SwiftUI
import FirebaseAuth

struct Route: View {
    @StateObject var authViewModel = AuthViewModel()

    var body: some View {
        Group {
            if authViewModel.isLoggedIn {
                ChatView()
            } else {
                RegisterView()
            }
        }
        .onAppear {
            authViewModel.checkUserLoggedIn()
        }
    }
}


struct Route_Previews: PreviewProvider {
    static var previews: some View {
        Route()
    }
}
