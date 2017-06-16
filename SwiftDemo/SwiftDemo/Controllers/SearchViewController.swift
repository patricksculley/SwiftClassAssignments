//
//  SearchViewController.swift
//  SwiftDemo
//
//  Created by khurram iqbal on 16/06/2017.
//  Copyright © 2017 Nisum. All rights reserved.
//

import UIKit

class SearchViewController: UITableViewController {
    
    var items : [Item]? = [Item]()
    var filteredArray : [EntityProtocol] = [EntityProtocol]()
    var selectedItem : Item?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let searchController = UISearchController(searchResultsController: nil)
        
        searchController.searchBar.scopeButtonTitles = ["ItemType", "BinType", "LocationType"]
        searchController.searchBar.delegate = self
        searchController.searchBar.showsScopeBar = true

        searchController.searchResultsUpdater = self
        searchController.dimsBackgroundDuringPresentation = false
        definesPresentationContext = true
        tableView.tableHeaderView = searchController.searchBar
        
        

    }
    override func viewWillAppear(_ animated: Bool) {
        self.filteredArray = self.items! as [EntityProtocol]
        self.tableView.reloadData()
    }

  

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80;
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return filteredArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: AppConstant.searchViewControllerCellIdentifier)
        
        switch (filteredArray[indexPath.row].entityType){
        
        case .ItemType :
            cell?.textLabel?.text = "Item name : \((filteredArray[indexPath.row] as! Item).name ?? "")"
            cell?.detailTextLabel?.text = "Bin Name = \((filteredArray[indexPath.row] as! Item).bin?.name ?? "") Location Name = \((filteredArray[indexPath.row] as! Item).bin?.location?.name ?? "")"
            
        case .BinType :
            cell?.textLabel?.text = "Bin name : \((filteredArray[indexPath.row] as! Bin).name ?? "")"
            cell?.detailTextLabel?.text = "Location name = \((filteredArray[indexPath.row] as! Bin).location?.name ?? "") "
            
        case .LocationType:
            cell?.textLabel?.text = "Location name : \((filteredArray[indexPath.row] as! Location).name ?? "")"
        
        }
       
        
        return cell!
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedItem = filteredArray[indexPath.row] as? Item
        self.performSegue(withIdentifier: AppConstant.backToBinControllerSegueIdentifier, sender: self)
    }
    
    func filterContentForSearchText(searchText: String, scope: String ) {
        filteredArray = items!.filter { item in
            
            let objType = String(describing: item.entityType)
            return (item.name?.lowercased().contains(searchText.lowercased()))! && objType == scope
        }
        
        tableView.reloadData()
    }

  

}

extension SearchViewController : UISearchResultsUpdating{
    func updateSearchResults(for searchController: UISearchController) {
        
            let searchBar = searchController.searchBar
            let scope = searchBar.scopeButtonTitles![searchBar.selectedScopeButtonIndex]
            filterContentForSearchText(searchText: searchController.searchBar.text!, scope: scope)
    
    }
    
    
    
}
extension SearchViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
        
        filterContentForSearchText(searchText: searchBar.text!, scope: searchBar.scopeButtonTitles![selectedScope])
    }
    
}


