//
//  RMEpisodeDetailViewViewModel.swift
//  RickAndMorty
//
//  Created by Kishan Kr Sharma on 8/6/23.
//

import UIKit

class RMEpisodeDetailViewViewModel {

    private let endpointUrl: URL?
    
    // MARK: - init
    init(url: URL?){
        self.endpointUrl = url
        fetchEpisodeData()
    }
    
    private func fetchEpisodeData() {
        guard let url = endpointUrl,
              let request = RMRequest(url: url) else {
            return
        }
        RMService.shared.execute(request, expecting: RMEpisode.self) { result in
            switch result {
            case .success(let success):
                print(String(describing: result))
            case .failure(let failure):
                break
            }
        }
    }
}
