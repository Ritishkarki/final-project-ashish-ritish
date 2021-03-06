//
//  ListView.swift
//  MarketPlace
//
//  Created by Ashish-Ritish on 3/19/20.
//  Copyright © 2020 Ashish-Ritish. All rights reserved.
//

import SwiftUI

struct ListScreenView: View {
    @State var selectedTab = "selling"
    
    var body: some View {
        NavigationView{
            GeometryReader{ geometry in
                VStack(){
                    HStack{
                        
                        VStack(spacing: 5){
                            Text("Selling")
                                .font(.system(size: 18))
                                .foregroundColor(self.selectedTab == "selling" ? Color("appBlue") : .gray)
                            GeometryReader { g in
                                Rectangle()
                                    .fill(self.selectedTab == "selling" ? Color("appBlue") : Color.clear)
                                    .frame(width: g.size.width, height: 2)
                            }
                        }
                        .onTapGesture {
                            self.selectedTab = "selling"
                        }
                        
                        VStack(spacing: 5){
                            Text("Sold")
                                .font(.system(size: 18))
                                .foregroundColor(self.selectedTab == "sold" ? Color("appBlue") : .gray)
                            GeometryReader { g in
                                Rectangle()
                                    .fill(self.selectedTab == "sold" ? Color("appBlue") : Color.clear)
                                    .frame(width: g.size.width, height: 2)
                            }
                        }
                        .onTapGesture {
                            self.selectedTab = "sold"
                        }
                        
                        VStack(spacing: 5){
                            Text("Bought")
                                .font(.system(size: 18))
                                .foregroundColor(self.selectedTab == "bought" ? Color("appBlue") : .gray)
                            GeometryReader { g in
                                Rectangle()
                                    .fill(self.selectedTab == "bought" ? Color("appBlue") : Color.clear)
                                    .frame(width: g.size.width, height: 2)
                            }
                        }
                        .onTapGesture {
                            self.selectedTab = "bought"
                        }
                    }
                    .frame(width: geometry.size.width, height: geometry.size.height/15)
                    .background(Color.white)
                    .padding(.top, 10)
                    VStack{
                        HStack{
                            
                            if self.selectedTab == "selling"{
                                SellingList()
                            }else if self.selectedTab == "sold"{
                                SoldList()
                            }else if self.selectedTab == "bought"{
                                BroughtList()
                            }
                            
                        }
                    }
                    Spacer()
                }
            }
            .navigationBarTitle(Text("Listing"), displayMode: .inline)
        }
    }
}

struct ListScreenView_Previews: PreviewProvider {
    static var previews: some View {
        ListScreenView()
    }
}
