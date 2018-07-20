//
//  ViewController.swift
//  Promises&Codeables
//
//  Created by Sushant on 7/18/18.
//  Copyright © 2018 Sushant. All rights reserved.
//

import UIKit
import PromiseKit
import SVProgressHUD

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var jokesTableView: UITableView!
     @IBOutlet weak var noResultsLabel: UILabel!
    var jokesArray : [Jokes]? = [Jokes].init()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.jokesTableView.register(UINib(nibName: "JokeViewCell", bundle: nil), forCellReuseIdentifier: "Cell")
        self.jokesTableView.separatorStyle = .none
        self.noResultsLabel.isHidden = true
    }

    override func viewWillAppear(_ animated: Bool) {
        self.getRandomJokes()
    }
    
    func getRandomJokes() {
        SVProgressHUD.show()
            firstly {
                JokesViewModel.shared().getJokes()
            }.done { (jokes) in
                self.jokesArray?.append(contentsOf: jokes)
                self.noResultsLabel.isHidden = true
                self.jokesTableView.reloadData()
            }.catch { (error) in
                SVProgressHUD.dismiss()
                self.noResultsLabel.isHidden = false
                self.showAlert(title: "Error", message: error.localizedDescription)
            }.finally {
                SVProgressHUD.dismiss()
        }   
    }
    
    
    // MARK: - Tableview Delegate and Datasource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return  self.jokesArray?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? JokeViewCell , let jokeInfo = self.jokesArray?[indexPath.row] {
            cell.joke = jokeInfo
            DispatchQueue.main.async {
                cell.jokeView.centerText()
            }
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 250
    }
    
    func scrollViewWillBeginDecelerating(_ scrollView: UIScrollView) {
        if scrollView == self.jokesTableView {
            if ((scrollView.contentOffset.y + scrollView.frame.size.height) >= scrollView.contentSize.height-50) {
                    self.getRandomJokes()
            }
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func showAlert(title : String, message: String) {
        var alert = UIAlertController()
        alert = alert.showAlert(title: title, message: message)
        self.present(alert, animated: true, completion: nil)
    }

}

