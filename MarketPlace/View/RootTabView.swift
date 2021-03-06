//
//  HomePage.swift
//  MarketPlace
//
//  Created by Ashish-Ritish on 4/13/20.
//  Copyright © 2020 Ashish-Ritish. All rights reserved.
//
import SwiftUI
import Firebase

let productsCollectionRef = Firestore.firestore().collection("products")
let categoriesCollectionRef = Firestore.firestore().collection("categories")
var uid = Auth.auth().currentUser?.uid
let userRef = Firestore.firestore().collection("users").document(uid!)

struct RootTabView: View {
    @ObservedObject var viewRouter: ViewRouter
    
    @State var showPopUp = false
    @State var newUser = UserDefaults.standard.value(forKey: "NewUser") as? Bool ?? false
    let publisher = NotificationCenter.default.publisher(for: NSNotification.Name("newUser"))
    
    init(viewRouter: ViewRouter) {
        UINavigationBar.appearance().titleTextAttributes = [
            .foregroundColor: UIColor.darkGray,
            .font : UIFont(name: "Arial", size: 22)!]
        self.viewRouter = viewRouter
        checkForNewUserExistence()
        print(self.viewRouter.selectedTab)
    }
    
    var body: some View {
        GeometryReader{ geometry in
            VStack{
                Spacer()
                
                if self.viewRouter.selectedTab == "home" {
                    HomeView(viewRouter: self.viewRouter)
                } else if self.viewRouter.selectedTab == "notification" {
                    NotificationView()
                }
                else if self.viewRouter.selectedTab == "fav" {
                    FavoriteList()
                }
                else if self.viewRouter.selectedTab == "list" {
                    ListScreenView()
                }
                else if self.viewRouter.selectedTab == "add" {
                    AddProductView()
                }
                
                Spacer()
                
                ZStack {
                    
                    HStack(spacing: 0){
                        
                        VStack(){
                            Image(systemName: "house.fill")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .padding(0)
                                .frame(height: 23)
                            Text("Home")
                                .font(.system(size: 12))
                            
                        }
                        .contentShape(Rectangle())
                        .frame(width: geometry.size.width/5, height: 75)
                        .foregroundColor(self.viewRouter.currentView == "home" ? Color("appBlue") : .gray)
                        .onTapGesture {
                            self.viewRouter.selectedTab = "home"
                            self.viewRouter.currentView = "home"
                            self.showPopUp = false
                        }
                        
                        VStack(){
                            Image(systemName: "bell.fill")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .padding(0)
                                .frame(height: 23)
                            Text("Notification")
                                .font(.system(size: 12))
                        }
                        .contentShape(Rectangle())
                        .frame(width: geometry.size.width/5, height: 75)
                        .foregroundColor(self.viewRouter.currentView == "notification" ? Color("appBlue") : .gray)
                        .onTapGesture {
                            self.viewRouter.selectedTab = "notification"
                            self.viewRouter.currentView = "notification"
                            self.showPopUp = false
                        }
                        
                        ZStack {
                            Circle()
                                .foregroundColor(Color.white)
                                .frame(width: 65, height: 65)
                            Image(systemName: "plus.circle.fill")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 65, height: 65)
                                .foregroundColor(Color("appBlue"))
                                .overlay(Circle().stroke(Color.white, lineWidth: 3))
                                .shadow(radius: 3)
                                .rotationEffect(Angle(degrees: self.showPopUp ? 180: 0))
                        }
                        .offset(y: -geometry.size.height/10/2)
                        .onTapGesture {
                            
                            self.viewRouter.selectedTab = "add"
                            self.viewRouter.currentView = "add"
                            withAnimation{
                                self.showPopUp = true
                            }
                            
                        }
                        
                        VStack(){
                            Image(systemName: "heart.fill")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .padding(0)
                                .frame(width: geometry.size.width/6, height: 23)
                            Text("Favorite")
                                .font(.system(size: 12))
                        }
                        .contentShape(Rectangle())
                        .frame(width: geometry.size.width/5, height: 75)
                        .foregroundColor(self.viewRouter.currentView == "fav" ? Color("appBlue") : .gray)
                        .onTapGesture {
                            self.viewRouter.currentView = "fav"
                            self.viewRouter.selectedTab = "fav"
                            self.showPopUp = false
                        }
                        
                        VStack(){
                            Image(systemName: "line.horizontal.3")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .padding(0)
                                .frame(width: 27)
                            Text("List")
                                .font(.system(size: 12))
                        }
                        .contentShape(Rectangle())
                        .frame(width: geometry.size.width/5, height: 75)
                        .foregroundColor(self.viewRouter.currentView == "list" ? Color("appBlue") : .gray)
                        .onTapGesture {
                            self.viewRouter.currentView = "list"
                            self.viewRouter.selectedTab = "list"
                            self.showPopUp = false
                        }
                        
                    }
                    .frame(width: geometry.size.width, height: geometry.size.height/10)
                    .background(Color.white.shadow(radius: 2))
                }
                
            }
            .edgesIgnoringSafeArea(.bottom)
            .sheet(isPresented: self.$newUser) {
                CreateAccount(show: self.$newUser)
            }
            .onReceive(self.publisher) { (output) in
                let new = UserDefaults.standard.value(forKey: "NewUser") as? Bool ?? false
                if(new != self.newUser){
                    self.newUser = new
                }
            }
        }
    }
}



struct RootTabView_Previews: PreviewProvider {
    static var previews: some View {
        RootTabView(viewRouter: ViewRouter())
    }
}

extension UserDefaults {
    @objc dynamic var keyPath: Int {
        return integer(forKey: "keyPath")
    }
}
