//
//  ViewController.swift
//  RickAndMorty
//
//  Created by Kishan Kr Sharma on 4/23/23.
//

import UIKit

final class RMTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabs()
    }
    
    private func setupTabs(){
        let charactersVC =  RMCharacterViewController()
        let locationsVC =  RMLocationViewController()
        let episodesVC =  RMEpisodeViewController()
        let settingsVC =  RMSettingsViewController()
        
        // set title to automatic to show large and small navigation bar title
        charactersVC.navigationItem.largeTitleDisplayMode = .automatic
        locationsVC.navigationItem.largeTitleDisplayMode = .automatic
        episodesVC.navigationItem.largeTitleDisplayMode = .automatic
        settingsVC.navigationItem.largeTitleDisplayMode = .automatic
        
        // wrap each view controller with a navigation controller to add into tabbar array
        let nav1 = UINavigationController(rootViewController: charactersVC)
        let nav2 = UINavigationController(rootViewController: locationsVC)
        let nav3 = UINavigationController(rootViewController: episodesVC)
        let nav4 = UINavigationController(rootViewController: settingsVC)
        
        // add icon and title into each tabbar item
        nav1.tabBarItem = UITabBarItem(title: "Characters", image: UIImage(systemName: "person.fill"), tag: 1)
        nav2.tabBarItem = UITabBarItem(title: "Locations", image: UIImage(systemName: "globe"), tag: 2)
        nav3.tabBarItem = UITabBarItem(title: "Episodes", image: UIImage(systemName: "tv"), tag: 3)
        nav4.tabBarItem = UITabBarItem(title: "Settings ", image: UIImage(systemName: "gear"), tag: 4)
        
        // make title visible on the navigation bar
        for nav in [nav1, nav2, nav3, nav4] {
            nav.navigationBar.prefersLargeTitles = true
        }
        
        // attach navigation controllers in tab bar controller
        setViewControllers(
            [nav1, nav2, nav3, nav4], animated: true)
    }
    
}

