//
//  SmallVideoPlayerView.swift
//  ProyectoApp
//
//  Created by Alumno on 17/10/23.
//

import SwiftUI
import AVFoundation
import _AVKit_SwiftUI

struct SmallVideoPlayerView: View {
    @State var link: URL
    var body: some View {
        VideoPlayer(player: AVPlayer(url: link))
            .frame(width: 150, height: 150)
    }
}

#Preview {
    SmallVideoPlayerView(link: URL(string: "https://firebasestorage.googleapis.com:443/v0/b/united-society-fad81.appspot.com/o/publications%2F986E973E-BFE2-40FB-B89B-ED75CDBBD647?alt=media&token=9540a694-1b01-4977-961f-87c3ea470b40")!)
}
