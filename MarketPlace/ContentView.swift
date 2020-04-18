//
//  ContentView.swift
//  MarketPlace
//
//  Created by Ashish Shrestha on 2/17/20.
//  Copyright © 2020 Ashish-Ritish. All rights reserved.
//

import SwiftUI
import Firebase
import GoogleSignIn

struct ContentView: View {
    
    @ObservedObject var viewRouter: ViewRouter
    @State var status = UserDefaults.standard.value(forKey: "status") as? Bool ?? false
    @EnvironmentObject var userProfile: UserProfile
    
    var body: some View {
        VStack{
            if status{
                RootTabView(viewRouter: ViewRouter()).environmentObject(self.userProfile)
            }else{
                logInView(viewRouter: viewRouter).environmentObject(self.userProfile)
            }
        }.animation(.spring())
        .onAppear {
            checkForNewUserExistence()
            NotificationCenter.default.addObserver(forName: NSNotification.Name("statusChange"), object: nil, queue: .main) { (_) in
                
                let status = UserDefaults.standard.value(forKey: "status") as? Bool ?? false
                self.status = status
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewRouter: ViewRouter())
    }
}

struct GoogleSignView : UIViewRepresentable {
    
    func makeUIView(context: UIViewRepresentableContext<GoogleSignView>) -> GIDSignInButton {
        
        let button = GIDSignInButton()
        button.colorScheme = .dark
        GIDSignIn.sharedInstance()?.presentingViewController = UIApplication.shared.windows.last?.rootViewController
        return button
        
    }
    
    func updateUIView(_ uiView: GIDSignInButton, context: UIViewRepresentableContext<GoogleSignView>) {
        
        
    }
}

func signInWithEmail(email: String,password : String,completion: @escaping (Bool,String)->Void){
    
    Auth.auth().signIn(withEmail: email, password: password) { (res, err) in
        
        if err != nil{
            
            completion(false,(err?.localizedDescription)!)
            return
        }
        
        completion(true,(res?.user.email)!)
    }
}
