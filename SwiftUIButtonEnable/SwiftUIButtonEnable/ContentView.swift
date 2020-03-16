//
//  ContentView.swift
//  SwiftUIButtonEnable
//
//  Created by Kyle Wilson on 2020-02-16.
//  Copyright © 2020 Xcode Tips. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var textDisplay: String = "Login"
    
    private var validated: Bool {
        !email.isEmpty && !password.isEmpty
    }
    
    var body: some View {
        VStack {
            VStack {
                Text("Email:")
                TextField("Enter Your Email: ", text: $email)
                    .multilineTextAlignment(.center)
                .frame(width: 200, height: 30, alignment: .center)
            }
            VStack {
                Text("Password:")
                SecureField("Enter Your Passowrd: ", text: $password)
                    .multilineTextAlignment(.center)
                .frame(width: 200, height: 30, alignment: .center)
            }
            Button(action: {
                self.textDisplay = self.textDisplay == "Login" ? "Logging In..." : "Login"
            }) {
                Text(textDisplay)
                    .foregroundColor(.white)
                    .frame(width: 200, height: 50, alignment: .center)
                    .background(validated ? Color.orange : Color.gray)
                    .font(.title)
                    .cornerRadius(50)
            }.disabled(!validated)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
