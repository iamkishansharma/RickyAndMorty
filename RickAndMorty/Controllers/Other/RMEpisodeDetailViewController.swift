//
//  RMEpisodeDetailViewController.swift
//  RickAndMorty
//
//  Created by Kishan Kr Sharma on 7/30/23.
//

import UIKit


/// ViewController to showdetail about an episode
final class RMEpisodeDetailViewController: UIViewController {

    private let viewModel:RMEpisodeDetailViewViewModel
    
    //MARK: - Init
    init(url: URL?) {
        self.viewModel = .init(url: url)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    //MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Episode"
        view.backgroundColor = .systemGreen
    }

}
