//
//  ProfileSummary.swift
//  my-swiftui
//
//  Created by yaoyuan on 2021/8/4.
//

import SwiftUI

struct ProfileSummary: View {
    var profile: Profile
    var body: some View {
        ScrollView{
        
        VStack(alignment: .leading, spacing: 10){
            Text(profile.username).bold().font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            Text("Notifications: \(profile.prefersNotifications ? "On": "Off" )")
                            Text("Seasonal Photos: \(profile.seasonalPhoto.rawValue)")
                            Text("Goal Date: ") + Text(profile.goalDate, style: .date)

        }
        }
    }
}

struct ProfileSummary_Previews: PreviewProvider {
    static var previews: some View {
        ProfileSummary(profile: Profile.default)
    }
}
