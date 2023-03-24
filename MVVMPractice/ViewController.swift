//
//  ViewController.swift
//  MVVMPractice
//
//  Created by Mohammad  Talha on 21/03/2023.
//

import UIKit
import RxSwift
import RxCocoa
import Reachability

class ViewController: UIViewController, UIScrollViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    // --- Variable ---
    
    let bag = DisposeBag()
    let viewModeel = ModelView()
    var dataToBind : [UsersData]? = nil
    var reachability: Reachability?

    let label = UILabel()
    let tf = UITextField()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "ListingTableViewCell", bundle: nil), forCellReuseIdentifier: "ListingTableViewCell")
        self.tableView.tableHeaderView?.largeContentTitle = "Talhaaaaa"
        bindData()
        fetchApiData()
        bindTableView()
    }
    
    func fetchApiData() {
        
        reachability?.rx.isConnected
             .subscribe(onNext: {
               print("Is connected")
                 self.viewModeel.fetchMovieData()
             })
             .disposed(by: bag)
    }
    
    func bindTableView() {
        
        // ---- What if need to set the label value ----
        viewModeel.labelName.subscribe(onNext: { response in
            self.label.text = response
        }).disposed(by: bag)
        
        // ---- Bind data to Table View ----
        tableView.rx.setDelegate(self).disposed(by: bag)
        self.viewModeel.category.bind(to: tableView.rx.items){(tv, row, item) -> UITableViewCell in
            let cell = tv.dequeueReusableCell(withIdentifier: "ListingTableViewCell", for: IndexPath.init(row: row, section: 0)) as! ListingTableViewCell
            cell.data = item
            cell.setData()
            return cell
        }.disposed(by: bag)
    }
    
    func bindData (){
        
        tf.rx.text.orEmpty.subscribe(onNext: { text in
                    self.viewModeel.sessionName.accept(text)
                })
                .disposed(by: bag)
        viewModeel.category.subscribe(onNext: { responce in
            self.dataToBind = responce
        }).disposed(by: bag)
    }
    
}

