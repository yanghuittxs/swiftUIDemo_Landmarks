//
//  CategoryHome.swift
//  Landmarks
//
//  Created by Young on 2022/6/17.
//

import SwiftUI

struct CategoryHome: View {
    @EnvironmentObject var modalData: ModelData
    @State private  var showingProfile = false
    
    var body: some View {
        NavigationView {
            
            List {
                PageView(pages: modalData.features.map{ FeatureCard(landmark: $0) })
                    .aspectRatio(3.0 / 2, contentMode: .fit)
                    .listRowInsets(EdgeInsets())
                ForEach(modalData.categories.keys.sorted(), id: \.self) { key in
                    CategoryRow(categoryName: key, items: modalData.categories[key]!)
                }
                .listRowInsets(EdgeInsets())
                LayoutTest()
            }
            .listStyle(.inset)
            .navigationTitle(Text("Featured"))
            .toolbar {
                Button {
                    showingProfile.toggle()
                } label: {
                    Label("User Profile", systemImage: "person.crop.circle")
                }
            }
            .sheet(isPresented: $showingProfile) {
                ProfileHost()
                    .environmentObject(modalData)
            }
        }
    }
}

struct CategoryHome_Previews: PreviewProvider {
    static var previews: some View {
        CategoryHome()
            .environmentObject(ModelData())
    }
}
