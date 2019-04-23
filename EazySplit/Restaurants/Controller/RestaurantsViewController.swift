//
//  RestaurantsViewController.swift
//  EazySplit
//
//  Created by Dynara Rico Oliveira on 21/04/19.
//  Copyright © 2019 Dynara Rico Oliveira. All rights reserved.
//

import UIKit

class RestaurantsViewController: UIViewController {

    @IBOutlet weak var restaurantsTableView: UITableView!
    
    var restaurants: [Restaurant] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadRestaurants()
        restaurantsTableView.delegate = self
        restaurantsTableView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = false
    }
    
    func loadRestaurants() {
        let restaurant1 = Restaurant(id: 1, name: "MC Donalds", image: "", type: "Fast food", description: "Fast food", rating: 8)
        let restaurant2 = Restaurant(id: 2, name: "Tolloco", image: "", type: "Comida mexicana", description: "Comida mexicana", rating: 9)
        restaurants.append(restaurant1)
        restaurants.append(restaurant2)
    }
}

extension RestaurantsViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return restaurants.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let restaurant = restaurants[indexPath.row]
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "RestaurantTableViewCell") as? RestaurantTableViewCell else {
                return UITableViewCell()
        }
        
        cell.setupRestaurant(restaurant)
        
        return cell
    }
    
    
}
