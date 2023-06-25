//
//  MainTabView.swift
//  Sara GSM
//
//  Created by Yousef on 6/24/23.
//
import SwiftUI

struct MainTabView: View {
    @State private var selectedTab = 0
    
    var body: some View {
        TabView(selection: $selectedTab) {
            HomePageView()
                .tabItem {
                    VStack {
                        Label("Home", systemImage: "house.fill")
                    }
                }
                .tag(0)
            
            CategoryPageView()
                .tabItem {
                    VStack {
                        Label("Categories", systemImage: "folder.fill")
                    }
                }
                .tag(1)
            
            CartPageView()
                .tabItem {
                    VStack {
                        
                        Label("Cart", systemImage: "cart.fill")
                    }
                }
                .tag(2)
                
            SearchPageView()
                .tabItem {
                    VStack {
                        Label("Search", systemImage: "magnifyingglass")
                    }
                }
                .tag(3)
                
            LoginPageView()
                .tabItem {
                    VStack {
                        Label("Login", systemImage: "person.circle.fill")
                    }
                }
                .tag(4)
        }
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
