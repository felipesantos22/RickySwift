//
//  CharacterViewModel.swift
//  rickymorty
//
//  Created by Felipe Santos on 07/12/24.
//

import SwiftUI
import Combine
import SwiftData


class CharacterViewModel: ObservableObject {
    @Published var characters: [Character] = [] // Personagens visíveis após a filtragem
    @Published var searchQuery: String = "" // Query de pesquisa
    @Published var canLoadMore: Bool = true // Visível para o ContentView
    
    private var allCharacters: [Character] = [] // Lista completa de personagens
    private var currentPage: Int = 1

    func fetchCharacters() {
        guard canLoadMore else { return }
        
        let urlString = "https://rickandmortyapi.com/api/character?page=\(currentPage)"
        guard let url = URL(string: urlString) else { return }

        URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            guard let self = self, let data = data, error == nil else { return }
            
            do {
                let response = try JSONDecoder().decode(CharacterResponse.self, from: data)
                DispatchQueue.main.async {
                    self.allCharacters.append(contentsOf: response.results)
                    self.applyFilter()
                    self.currentPage += 1
                    self.canLoadMore = response.info.next != nil
                }
            } catch {
                print("Error decoding: \(error)")
            }
        }.resume()
    }

    func applyFilter() {
        if searchQuery.isEmpty {
            characters = allCharacters
        } else {
            characters = allCharacters.filter { $0.name.lowercased().contains(searchQuery.lowercased()) }
        }
    }
}

