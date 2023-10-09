//
//  TabView.swift
//  CustomTabView
//
//  Created by Alumno on 21/09/23.
//

import SwiftUI

struct TabView: View {
    
    @Binding var selectedTab: Tab
    
    var body: some View {
        GeometryReader { geometry in
            RoundedRectangle(cornerRadius: 45) // Wrap the stack in a RoundedRectangle
                .frame(height: 100)
                .foregroundColor(Color.blue)
                .offset(y: geometry.size.height/1.04)
        }

        HStack {
            
            Spacer()
            
            Button {
                selectedTab = .home
            } label: {
                Image(systemName: TabItem.home.tab == selectedTab ? TabItem.home.selectedImage : TabItem.home.image)
                    .font(.title)
            }
            
            Spacer()
            
            Button {
                selectedTab = .news
            } label: {
                Image(systemName: TabItem.news.tab == selectedTab ? TabItem.news.selectedImage : TabItem.news.image)
                    .font(.title)
            }
            
            Spacer()
            
            Button {
                selectedTab = .search
            } label: {
                Image(systemName: TabItem.search.tab == selectedTab ? TabItem.search.selectedImage : TabItem.search.image)
                    .font(.title)
            }
            
            
            Spacer()
            
        }
        .tint(Color.white)
        .frame(maxWidth: .infinity)
                
        
    }
}

#Preview {
    TabView(selectedTab: .constant(.home))
}
