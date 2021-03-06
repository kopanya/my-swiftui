//
//  ProfileSummary.swift
//  my-swiftui
//
//  Created by yaoyuan on 2021/8/4.
//

import SwiftUI

struct ProfileSummary: View {
    @EnvironmentObject var modelData: ModelData
    
    var profile: Profile
    var body: some View {
        ScrollView{
        
            VStack(alignment: .leading, spacing: 10){
            Text(profile.username).bold().font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            Text("Notifications: \(profile.prefersNotifications ? "On": "Off" )")
                            Text("Seasonal Photos: \(profile.seasonalPhoto.rawValue)")
                            Text("Goal Date: ") + Text(profile.goalDate, style: .date)
                Divider()
                VStack(alignment: .leading, spacing: /*@START_MENU_TOKEN@*/nil/*@END_MENU_TOKEN@*/, content: {
                    Text("Completed Badges")
                        .font(.headline)
                    ScrollView(.horizontal) {
                        HStack{
                            HikeBadge(name: "First Hike")
                            HikeBadge(name:"Earth Day").hueRotation(Angle(degrees: 90))
                            HikeBadge(name: "Tenth Hike").grayscale(0.5).hueRotation(Angle(degrees: 45))
                        }.padding(.bottom)
                    }

                })
                Divider()
                VStack(alignment: .leading,  content: {
                    Text("Recent Hikes")
                        .font(.headline)
                    HikeView(hike: modelData.hikes[0])

                })

        }
        }
    }
}

struct ProfileSummary_Previews: PreviewProvider {
    static var previews: some View {
        ProfileSummary(profile: Profile.default).environmentObject(ModelData())
    }
}
