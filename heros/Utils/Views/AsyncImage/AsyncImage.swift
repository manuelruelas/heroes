//
//  AsyncImg.swift
//  heros
//
//  Created by Jorge Guzman on 21/05/20.
//  Copyright © 2020 mruelas. All rights reserved.
//

import SwiftUI

struct AsyncImage<Placeholder: View>: View {
    
    @ObservedObject private var loader: ImageLoader
    private let placeholder: Placeholder?
       
   init(url: URL, placeholder: Placeholder? = nil) {
       loader = ImageLoader(url: url)
       self.placeholder = placeholder
   }

   var body: some View {
       image
           .onAppear(perform: loader.load)
           .onDisappear(perform: loader.cancel)
   }
    
    private var image: some View {
        
        Group {
            if self.loader.image != nil{
                Image(uiImage: loader.image!)
                .resizable()
            } else{
                placeholder
            }
        }
    }
}

struct AsyncImage_Previews: PreviewProvider {
    
    static var previews: some View {
        AsyncImage(url:URL(string:"")!,placeholder: Text(""))
    }
}
