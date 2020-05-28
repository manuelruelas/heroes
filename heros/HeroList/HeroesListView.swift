//
//  ContentView.swift
//  heros
//
//  Created by Jorge Guzman on 5/19/20.
//  Copyright © 2020 mruelas. All rights reserved.
//

import SwiftUI

struct HeroesListView: View {
    @ObservedObject var heroesViewModel: HeroesListViewModel
    
    init(viewModel: HeroesListViewModel) {
        self.heroesViewModel = viewModel
    }
    
    var body: some View {
        NavigationView {
            VStack{
                SearchBar(text: $heroesViewModel.hero)
                circlesSection
                Divider()
                if heroesViewModel.dataSource.isEmpty{
                    emptySection
                } else{
                    heroesSection
                }
            }
            .listStyle(PlainListStyle())
            .navigationBarTitle("Heroes")
        }.onAppear {
            self.heroesViewModel.fetchHero()
        }
        
    }
}
private extension HeroesListView{
    
    var circlesSection:some View{
        Section{
            ScrollView(.horizontal, content: {
                HStack{
                    ForEach(self.heroesViewModel.dataSource, content: circleItem.init(hero:))
                }.frame(height:130)
                
                }).padding()
        }
    }
    
    
    var heroesSection: some View {
      
        List(heroesViewModel.dataSource){ hero in
            HeroRowView.init(viewModel: hero)
                .onAppear{
                    self.heroesViewModel.loadMore(id: Int(hero.id) ?? 1)
                }
            
            }
      
    }
    var emptySection: some View{
        
        VStack{
            Text("No results").foregroundColor(.gray)
            Spacer()
        }
     
    }
}


struct circleItem: View{
    private let hero: HeroRowModel
    init(hero: HeroRowModel) {
      self.hero = hero
    }
    var body: some View {
            VStack(){
                AsyncImage(url: URL(string: self.hero.hero.image!.url)!,placeholder: Text(""))
                    .frame(width: 100,height:100 , alignment: .center)
                    .aspectRatio(contentMode: .fit)
                    .clipShape(Circle())
                Text(self.hero.hero.name)
        }
    }
}
struct HeroesListView_Previews: PreviewProvider {
    static var previews: some View {
        
        HeroesListView(viewModel: HeroesListViewModel(heroRepository: HeroRepository()))
    }
}
