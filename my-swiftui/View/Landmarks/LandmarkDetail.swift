//
//  LandmarkDetail.swift
//  my-swiftui
//
//  Created by yaoyuan on 2021/7/26.
//

import SwiftUI

struct LandmarkDetail: View {
    var landmark: Landmark
    
    var body: some View {
        ScrollView {
            MapView(coordinate:landmark.locationCoordinate).frame(height: 300)
            CircleImage(image: landmark.image).offset(y:-130).padding([.bottom],-130)
            VStack(alignment: .leading){
                Text(landmark.name).font(.title).foregroundColor(.orange).padding([.bottom],7)
                
                HStack(){
                    Text(landmark.park)
                    Spacer()
                    Text(landmark.state)
                    
                }.font(.subheadline).foregroundColor(Color.init(red: 0, green: 0, blue: 0, opacity: 1))
                Divider()
                Text("About \(landmark.name)")
                    .font(.title2)
                Text(landmark.description)
            }.padding()
        }.navigationTitle(landmark.name)
        .navigationBarTitleDisplayMode(.inline)
        
    }
}

struct LandmarkDetail_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkDetail(landmark: ModelData().landmarks[0])
    }
}
