//
//  ViewController.swift
//  ToDoList
//
//  Created by Büşra Güneş on 20.09.2022.
//

import UIKit

class PostListViewController: UIViewController {
    @IBOutlet weak var PostsTableView: UITableView!

    private let viewModel = PostListViewModel()
    private var items: [PostCellViewModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        viewModel.viewDelegate = self
        viewModel.DidViewLoad()
    }
}

private extension PostListViewController{
    func setupUI(){
        PostsTableView.delegate = self
        PostsTableView.dataSource = self
        registerCell()
    }
    func registerCell(){
        PostsTableView.register(.init(nibName: "PostListTableViewCell", bundle: nil), forCellReuseIdentifier: "PostListTableViewCell")
    }
    
}
extension PostListViewController:PostListViewModelViewProtocol{
    func didCellItemFetch(_ items: [PostCellViewModel]) {
        DispatchQueue.main.async {
            self.items = items
            self.PostsTableView.reloadData()
        }
    }
    func showEmptyView(){
        self.PostsTableView.isHidden = true
        //TODO
    }
    func hideEmptyView(){
        self.PostsTableView.isHidden = false
        //TODO
    }
}

extension PostListViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.didClickItem(at: indexPath.row)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PostListTableViewCell") as! PostListTableViewCell
        cell.postTitleLabel.text = items[indexPath.row].title
        cell.postDescLabel.text = items[indexPath.row].desc
        return cell
    }
    
 
}
