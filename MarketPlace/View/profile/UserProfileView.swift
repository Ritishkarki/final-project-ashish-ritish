//
//  UserProfileView.swift
//  MarketPlace
//
//  Created by ritish karki on 3/20/20.
//  Copyright © 2020 Ashish-Ritish. All rights reserved.
//

import SwiftUI

struct UserProfileView: View {
    // MARK: - Propertiers
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var viewRouter: ViewRouter
    @State private var isNavigationBarHidden = true
    @State private var email = ""
    @State private var password = ""
    @State private var userRating = 4
    
    
    func dismiss() {
        presentationMode.wrappedValue.dismiss()
    }
    
    func navigate(place: String){
        self.viewRouter.currentView = place
        self.viewRouter.itemColor = place
    }
    
    
    var body: some View {
        NavigationView{
            VStack{
                VStack{
                    GeometryReader { geometry in
                        HStack{
                            
                            Image("karki")
                                .resizable()
                                .frame(width: 100, height: 100)
                                .clipShape(Circle())
                                .overlay(Circle().stroke(Color.white, lineWidth: 2))
                                .shadow(radius: 10)
                                .edgesIgnoringSafeArea(.top)
                                .scaledToFit()
                                .padding([.top,.bottom], 50)
                                .padding([.leading,.trailing], 20)
                            
                            VStack(alignment: .leading){
                                Text("Ritish Karki").font(.system(size: 25))
                                Text("21 Andrews Street, West Haven")
                                Section {
                                    RatingView(rating: self.$userRating)
                                }
                            }
                        }
                        .frame(width: geometry.size.width)
                    }
                    
                    HStack(spacing: 40){
                        //   Spacer()
                        NavigationLink(destination: EditProfile()){
                            HStack {
                                Image(systemName: "bell.fill")
                                Text("Edit")
                            }.padding(10.0)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10.0)
                                        .stroke(lineWidth: 2.0)
                            )
                                .foregroundColor(Color.gray)
                                .frame(minWidth: 120)
                            
                        }
                        Button(action: {
                            self.dismiss()
                            self.navigate(place: "notification")
                         
                        }) {
                            HStack {
                                Image(systemName: "bell.fill")
                                Text("Notification")
                            }.padding(10.0)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10.0)
                                        .stroke(lineWidth: 2.0)
                            )
                                .foregroundColor(Color.gray)
                                .frame(minWidth: 120)
                        }
                        
                        //                        Button(action: {
                        //
                        //                        }) {
                        //                            HStack {
                        //                                Image(systemName: "list.dash")
                        //                                Text("List")
                        //                            }.padding(10.0)
                        //                                .frame(minWidth: 120)
                        //                                .overlay(
                        //                                    RoundedRectangle(cornerRadius: 10.0)
                        //                                        .stroke(lineWidth: 2.0)
                        //                            )
                        //                                .foregroundColor(Color.gray)
                        //                       }
                    }.padding(.bottom, 10)
                    
                }
                .background(Color(UIColor(red:0, green: 0, blue: 0, alpha: 0.05)))
                .frame(height:180)
                Spacer()
                
                HStack(spacing: 0) {
                    Button(action: {
                        self.viewRouter.currentPage = "loginPage"
                        self.dismiss()
                    }) {
                        Text("Log Out")
                            .foregroundColor(.black)
                    }
                }
            }
            .navigationBarHidden(isNavigationBarHidden)
            .navigationBarTitle("Back", displayMode: .inline)
            .onAppear {
                self.isNavigationBarHidden = true
            }
            .onDisappear {
                self.isNavigationBarHidden = false
            }
        }
    }
}

struct UserProfileView_Previews: PreviewProvider {
    static var previews: some View {
        UserProfileView(viewRouter: ViewRouter())
    }
}

extension Color {
    static var themeTextField: Color {
        return Color(red: 220.0/255.0, green: 230.0/255.0, blue: 230.0/255.0, opacity: 1.0)
    }
}
