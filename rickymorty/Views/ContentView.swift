//
//  ContentView.swift
//  rickymorty
//
//  Created by Felipe Santos on 07/12/24.
//

import SwiftUI

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = CharacterViewModel()

    var body: some View {
        NavigationView {
            VStack {
                // Título
                Text("Rick and Morty")
                    .font(.largeTitle)
                    .padding()

                // Campo de pesquisa
                TextField("Busca por nome...", text: $viewModel.searchQuery)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                    .onChange(of: viewModel.searchQuery) {
                        viewModel.applyFilter()
                    }

                // Lista de personagens
                List {
                    ForEach(viewModel.characters) { character in
                        NavigationLink(destination: CharacterDetailView(character: character)) {
                            HStack {
                                // Imagem
                                AsyncImage(url: URL(string: character.image)) { phase in
                                    switch phase {
                                    case .empty:
                                        ProgressView()
                                    case .success(let image):
                                        image
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 100, height: 100)
                                    case .failure:
                                        Image(systemName: "exclamationmark.triangle.fill")
                                            .resizable()
                                            .frame(width: 100, height: 100)
                                    @unknown default:
                                        EmptyView()
                                    }
                                }
                                .padding(.trailing)

                                // Informações do personagem
                                VStack(alignment: .leading) {
                                    Text(character.name)
                                        .font(.headline)
                                    Text("Status: \(character.status)")
                                    Text("Species: \(character.species)")
                                    Text("Gender: \(character.gender)")
                                }
                                .padding()
                            }
                            .padding(.vertical, 5)
                        }
                    }
                    
                    // Scroll infinito
                    if viewModel.canLoadMore {
                        ProgressView()
                            .onAppear {
                                viewModel.fetchCharacters()
                            }
                    }
                }
                .onAppear {
                    viewModel.fetchCharacters()
                }
            }
            .padding()
        }
    }
}
