//
//  TableViewController.swift
//  MyApps
//
//  Created by Andrey Vanakoff on 08/10/2023.
//

import UIKit
import CoreData

class TableViewController: UITableViewController {
    
    var appsArray = [MyApp]()
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadApps()
    }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return appsArray.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = appsArray[indexPath.row].siteName
        
        return cell
    }
    
    //MARK: - Load Data
    func loadApps() {
        let request : NSFetchRequest<MyApp> = MyApp.fetchRequest()
        
        do {
            appsArray = try context.fetch(request)
        } catch {
            print("Cannot Fetch data, \(error)")
        }
        tableView.reloadData()
    }
    
    func saveApp() {
        do {
            try context.save()
        } catch {
            print("Cannot save a new app, \(error)")
        }
        tableView.reloadData()
    }

    
    //MARK: - Save Data
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        guard let settingsVC = segue.source as? SettingsViewController else { return }
        
        let newApp = MyApp(context: self.context)
        newApp.siteName = settingsVC.websiteNameTF.text
        
        newApp.siteAddress = settingsVC.websiteURLTV.text
        
        appsArray.append(newApp)
        saveApp()
    }
    
  
    //MARK: - Delete Data
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
            //    testArray.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    
}
