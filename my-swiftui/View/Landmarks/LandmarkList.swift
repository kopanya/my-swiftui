//
//  LandmarkList.swift
//  my-swiftui
//
//  Created by yaoyuan on 2021/7/26.
//

import SwiftUI

struct LandmarkList: View {
    @EnvironmentObject var modelData: ModelData
    @State private var showFavoriteesOnly = false
        
    var filteredLandmarks: [Landmark] {
        modelData.landmarks.filter {
            landmark in (!showFavoriteesOnly || landmark.isFavorite)
        }
    }
    
    var body: some View {
        NavigationView{
            List {
                Toggle(isOn: $showFavoriteesOnly){
                    Text("Favorites only")
                }
                
                ForEach(filteredLandmarks) {
                    landmark in NavigationLink(destination: LandmarkDetail(landmark: landmark)) {
                        LandmarkRow(landmark: landmark)
                    }
                }
            }.navigationTitle("LandMark")
        }
            
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkList()
    }
}
