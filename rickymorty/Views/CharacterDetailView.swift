//
//  CharacterDetailView.swift
//  rickymorty
//
//  Created by Felipe Santos on 10/12/24.
//

import SwiftUI

struct CharacterDetailView: View {
    let character: Character // Personagem recebido da lista

    var body: some View {
        VStack(spacing: 30) {
            AsyncImage(url: URL(string: character.image)) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            } placeholder: {
                ProgressView() // Indicador de carregamento
            }
            .frame(height: 300)
            .clipShape(RoundedRectangle(cornerRadius: 15))
            
            Text(character.name)
                .font(.largeTitle)
                .fontWeight(.bold)
            
            Text("Status: \(character.status)")
                .font(.headline)
            
            Text("Species: \(character.species)")
                .font(.subheadline)
            
            Text("Gender: \(character.gender)")
                .font(.subheadline)
            
            Spacer()
        }
        .padding()
        .navigationTitle(character.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}
