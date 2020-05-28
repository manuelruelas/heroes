//
//  HeroDetailVIew.swift
//  heros
//
//  Created by Jorge Guzman on 25/05/20.
//  Copyright © 2020 mruelas. All rights reserved.
//

import SwiftUI

struct HeroDetailView: View {
    var hero:Hero
    
    var body: some View {
        
        ScrollView{
            Section{
                VStack{
                    AsyncImage(url:URL(string: self.hero.image!.url)!, placeholder: Text("Loading"))
                        .aspectRatio(contentMode: .fit)
                        .clipShape(Circle())
                        .frame(width: 200, alignment: .center)
                        .shadow(radius: 10)
                    Text(self.hero.name).font(.title)
                }
            }
            
            Divider()
            Section{
                HStack{
                    VStack(alignment: .leading,spacing: 3){
                        Text("Real name: \(hero.biography!.fullName)")
                        Text("Alteregos: \(hero.biography!.alterEgos)")
                        Text("Place of birth: \(hero.biography!.placeOfBirth)")
                        Text("Publisher: \(hero.biography!.publisher)")
                    }.frame(alignment:.leading).padding()
                }.frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                
                
            }
            
            
            Section{
                HStack{
                    VStack{
                        attributeBoxView(name: "intelligence",value: hero.powerstats!.intelligence)
                        attributeBoxView(name: "power",value: hero.powerstats!.power)
                    }
                    VStack{
                        attributeBoxView(name: "speed",value: hero.powerstats!.speed)
                        attributeBoxView(name: "strength",value: hero.powerstats!.strength)
                    }
                }
                
            }
        }
        
    }
    
}
struct attributeBoxView: View{
    
    var name:String = "powerstats"
    var value:String = "0"
    
    var body: some View{
        VStack{
            Text(value != "null" ? value : "?").font(.title)
            Text(name)
            }.frame(width: 100, height: 100, alignment: .center)
            
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(Color.gray,lineWidth: 1)
            ).shadow(radius: 10).padding()
            
    }
    
}
//struct HeroDetailVIew_Previews: PreviewProvider {
//
//    static var previews: some View {
//
//        HeroDetailView(hero: hero)
//    }
//}
