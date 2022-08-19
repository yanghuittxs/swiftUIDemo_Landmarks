//
//  LayoutTest.swift
//  Landmarks
//
//  Created by Young on 2022/6/27.
//

import SwiftUI

struct LayoutTest: View {
    var body: some View {
        VStack {
            Text("🍞🥑")
                .background(Color.red)
                .padding(.all)

            Text("🍞🥑")
                .padding(.all)
                .background(Color.red)
        }
        .frame(height: 200)
    }
}

struct LayoutTest_Previews: PreviewProvider {
    static var previews: some View {
        LayoutTest()
    }
}
