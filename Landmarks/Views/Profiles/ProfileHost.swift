//
//  ProfileHost.swift
//  Landmarks
//
//  Created by Young on 2022/6/17.
//

import SwiftUI

struct ProfileHost: View {
    @Environment(\.editMode) var editModel
    @EnvironmentObject var modelData : ModelData
    @State private var draftProfile = Profile.default
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            HStack {
                if editModel?.wrappedValue == .active {
                    Button.init {
                        draftProfile = modelData.profile
                        editModel?.animation().wrappedValue = .inactive
                    } label: {
                        Text("Cancel")
                    }

                }
                Spacer()
                EditButton()
            }
            if editModel?.wrappedValue == .inactive {
                ProfileSummary(profile: modelData.profile)
            }
            else {
                ProfileEditor(profile: $draftProfile)
                    .onAppear {
                        draftProfile = draftProfile
                    }
                    .onDisappear {
                        modelData.profile = draftProfile
                    }
            }
        }
        .padding()
    }
}

struct ProfileHost_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHost()
            .environmentObject(ModelData())
    }
}
