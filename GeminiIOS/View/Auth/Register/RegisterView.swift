//
//  RegisterView.swift
//  GeminiIOS
//
//  Created by Asim Seferli on 02.03.24.
//

import SwiftUI
import Firebase
struct RegisterView: View {
    @StateObject var authViewModel = AuthViewModel()

       
    var body: some View {
        Text("Register")
                   .font(.largeTitle)
                   .padding()
               
        TextField("Email", text: $authViewModel.email)
                   .padding()
                   .textFieldStyle(RoundedBorderTextFieldStyle())
               
        SecureField("Password", text: $authViewModel.password)
                   .padding()
                   .textFieldStyle(RoundedBorderTextFieldStyle())
               
               Button(action: {
                   authViewModel.register()
               }) {
                   Text("Register")
                       .font(.headline)
                       .foregroundColor(.white)
                       .padding()
                       .frame(maxWidth: .infinity)
                       .background(Color.blue)
                       .cornerRadius(10)
               }
               .padding()
               
               Spacer()
           }
       }

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
