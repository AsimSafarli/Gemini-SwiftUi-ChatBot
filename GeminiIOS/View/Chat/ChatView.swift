//
//  ChatView.swift
//  GeminiIOS
//
//  Created by Asim Seferli on 02.03.24.
//

import SwiftUI
import GoogleGenerativeAI

struct ChatView: View {
    let model = GenerativeModel(name: "gemini-pro", apiKey: "AIzaSyAM2T3tynSdkPNaaG2gsFHIYnh2H3oCosQ")
    @State var output: String = ""
    @State var input: String = "Ask anything."
    var body: some View {
        VStack{
                    ScrollView{
                        Text(output)
                            .padding(.horizontal)
                        Text(input)
                            .background(Color.teal)
                            .padding(.trailing, 20)
                    }
                    HStack{
                        TextField("Ask me anything", text: $input)
                            .textFieldStyle(.roundedBorder)
                        
                        Spacer()
                        
                        Button(action: {
                            if input != "" {
                                Task {
                                    let response = try await model.generateContent(input)
                                    if let text = response.text {
                                        output = text
                                        input = ""
                                    }
                                }
                            }
                            
                        }, label: {
                            Image(systemName: "paperplane.fill")
                                .font(.title)
                        })
                    }
                }
    }
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView()
    }
}
