//
//  ContentView.swift
//  SwiftUI-List-Starter
//
//  Created by Pasan Bopagamage on 2023-06-10.
//

import SwiftUI

struct VideoListView: View {
    var videos: [Video] = VideoList.topTen
    var body: some View {
        NavigationView{
            List {
                ForEach(videos) { video in
                    VideoCall(video: video)
                        .swipeActions {
                            Button(role: .destructive) {
                                print("Delete")
                            } label: {
                                Label("Delete", systemImage: "trash.circle.fill")
                            }
                            
                            Button {
                                print("Favorite")
                            } label: {
                                Label("Favorite", systemImage: "star.circle.fill")
                            }
                            .tint(.green)
                        }
                        .swipeActions(edge: .leading, allowsFullSwipe: false){
                            Button {
                                print("Pin")
                            } label: {
                                Label("Pin", systemImage: "pin.circle.fill")
                            }
                            .tint(.orange)                        }
                }
                
            }
                .navigationTitle("Levi's Top 10")
        }
    }
}

struct VideoCall: View{
    var video: Video
    
    var body: some View{
        HStack{
            Image(video.imageName)
                .resizable()
                .scaledToFit()
                .frame(height: 70)
                .cornerRadius(4)
                .padding(.vertical, 4)
            
            VStack(alignment: .leading, spacing: 5){
                Text(video.title)
                    .fontWeight(.semibold)
                    .lineLimit(2)
                    .minimumScaleFactor(0.5)
                
                Text(video.uploadData)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        VideoListView()
    }
}
