//
//  LandmarkDetail.swift
//  my-swiftui
//
//  Created by yaoyuan on 2021/7/26.
//

import SwiftUI

struct LandmarkDetail: View {
    @EnvironmentObject var modelData: ModelData
    var landmark: Landmark
    
    var landmarkIndex: Int {
        modelData.landmarks.firstIndex(where: { $0.id == landmark.id})!
    }
    
    var body: some View {
        ScrollView {
            MapView(coordinate:landmark.locationCoordinate).frame(height: 300)
            CircleImage(image: landmark.image).offset(y:-130).padding([.bottom],-130)
            VStack(alignment: .leading){
                HStack{
                    Text(landmark.name).font(.title).foregroundColor(.orange).padding([.bottom],7)
                    FavoriteButton(isSet: $modelData.landmarks[landmarkIndex].isFavorite)
                }
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
    static var modelData = ModelData()
    static var previews: some View {
        LandmarkDetail(landmark: modelData.landmarks[0]).environmentObject(modelData)
    }
}
