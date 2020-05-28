//
//  HeroRow.swift
//  heros
//
//  Created by Jorge Guzman on 20/05/20.
//  Copyright © 2020 mruelas. All rights reserved.
//

import SwiftUI

struct HeroRowView: View {
    private let viewModel: HeroRowModel
    init(viewModel: HeroRowModel) {
      self.viewModel = viewModel
    }
    var body: some View {
        NavigationLink(destination: HeroDetailView(hero: viewModel.hero)){
        HStack {
            AsyncImage(url: URL(string: self.viewModel.hero.image!.url)!,placeholder:RoundedRectangle(cornerRadius: 10).foregroundColor(Color.gray))
            .frame(width: 80, height: 80)
                .cornerRadius(10)
            Text(viewModel.hero.name)
            }
            
        }
    }
}


