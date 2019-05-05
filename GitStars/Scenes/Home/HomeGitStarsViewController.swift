//
//  HomeGitStarsViewController.swift
//  GitStars
//
//  Created by Ricardo Bailoni on 05/05/19.
//  Copyright (c) 2019 Ricardo Bailoni. All rights reserved.
//

import UIKit

import UIKit

protocol HomeGitStarsDisplayLogic: class {
    func displayError(erro: Error)
    func displayRepos(viewModel: [HomeGitStars.Repos.ViewModel])
}

class HomeGitStarsViewController: UIViewController, HomeGitStarsDisplayLogic {
    var interactor: HomeGitStarsBusinessLogic?
    var router: (NSObjectProtocol & HomeGitStarsRoutingLogic & HomeGitStarsDataPassing)?
    var repositories = [HomeGitStars.Repos.ViewModel]()
    var tableView = UITableView()
    var isLoading = false
    
    private let refreshControl: UIRefreshControl = {
        let refresh = UIRefreshControl()
        refresh.addTarget(self, action: #selector(refreshTableView), for: .valueChanged)
        return refresh
    }()
    
    // MARK: Object lifecycle
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    // MARK: Setup
    
    private func setup() {
        let viewController = self
        let interactor = HomeGitStarsInteractor()
        let presenter = HomeGitStarsPresenter()
        let router = HomeGitStarsRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
        setupTableView()
    }
    
    private func setupTableView() {
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        tableView.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor).isActive = true
        tableView.refreshControl = refreshControl
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    private func loadRepositories(_ page: Int? = nil, isReload: Bool = false) {
        isLoading = true
        tableView.reloadSections(IndexSet(integer: 1), with: .none)
        let request = HomeGitStars.Repos.Request(page: page, isReload: isReload)
        self.interactor?.getRepos(request: request)
    }
    
    @objc private func refreshTableView() {
        loadRepositories(0, isReload: true)
    }
    
    // MARK: Routing
    //    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    //        if let scene = segue.identifier {
    //            let selector = NSSelectorFromString("routeTo\(scene)WithSegue:")
    //            if let router = router, router.responds(to: selector) {
    //                router.perform(selector, with: segue)
    //            }
    //        }
    //    }
    
    // MARK: View lifecycle
    override func loadView() {
        super.loadView()
        view.backgroundColor = .white
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        tableView.register(RepositoryTableViewCell.self, forCellReuseIdentifier: "RepositoryCell")
        tableView.register(LoadingTableViewCell.self, forCellReuseIdentifier: "LoadingCell")
        tableView.rowHeight = 80.0
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        loadRepositories()
    }
    
    func displayError(erro: Error) {
        isLoading = false
        DispatchQueue.main.async {
            self.tableView.refreshControl?.endRefreshing()
            self.tableView.reloadSections(IndexSet(integer: 1), with: .none)
            let alert = UIAlertController(title: "Alerta", message: "Erro ao carregar os repositorios", preferredStyle: .alert)
            let ok = UIAlertAction(title: "Ok", style: .default, handler: nil)
            alert.addAction(ok)
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    func displayRepos(viewModel: [HomeGitStars.Repos.ViewModel]) {
        if viewModel.count > 0 {
            if viewModel[0].isReload {
                repositories = [HomeGitStars.Repos.ViewModel]()
            }
        }
        repositories.append(contentsOf: viewModel)
        isLoading = false
        self.tableView.refreshControl?.endRefreshing()
        self.tableView.reloadData()
    }
}

extension HomeGitStarsViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return repositories.count
        } else if section == 1 && isLoading {
            return 1
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "RepositoryCell", for: indexPath) as! RepositoryTableViewCell
            cell.repositoryView.repository = repositories[indexPath.row]
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "LoadingCell", for: indexPath) as! LoadingTableViewCell
            cell.loadingActivity.startAnimating()
            return cell
        }
    }
}

extension HomeGitStarsViewController: UITableViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height
        
        if offsetY > contentHeight - scrollView.frame.height * 3{
            if !isLoading {
                loadRepositories()
            }
        }
    }
}
