//
//  HomeViewController.swift
//  RickAndMorty
//
//  Created by muhammed fatih elçi on 24.07.2023.
//

import UIKit
import Alamofire
import SnapKit

class HomeViewController: UIViewController,CollectionViewProtocol {
  
    

//MARK: - View
    
    private var searchBar: UISearchController = {
        let search = UISearchController()
        search.searchBar.placeholder = "Ara"
        search.searchBar.showsCancelButton = false
        return search
    }()
    
    private lazy var segmentControl: UISegmentedControl = {
       var segment = UISegmentedControl()
        let items = ["List","Grid"]
        segment = UISegmentedControl(items: items)
        segment.backgroundColor = .systemRed
        return segment
    }()
    
    private lazy var collection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .systemTeal
        return collectionView
    }()
    
    var viewModel: ViewModelProtocol?
    var dataList: [Result] = []
    var colums: CGFloat = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel?.load()
        initDelegate()
        configure()
    }
    
    private func initDelegate() {
        viewModel?.delegate = self
        collection.dataSource = self
        collection.delegate = self
        collection.register(CustomCollectionViewCell.self, forCellWithReuseIdentifier: CustomCollectionViewCell.Identifier.path.rawValue)
        searchBar.searchBar.delegate = self
    }
    
    private func configure() {
        navigationItem.searchController = searchBar
        view.addSubview(segmentControl)
        view.addSubview(collection)
        title = "RickAndMorty"
        view.backgroundColor = .white
        makeSegment()
        makeCollection()
        createSegmentControl()
    }
    
    func createSegmentControl() {
        segmentControl.addTarget(self, action: #selector(click(_:)), for: .valueChanged)
        segmentControl.selectedSegmentIndex = 0
    }
    
    @objc func click(_ sender: UISegmentedControl) {
        let selectedIndex = sender.selectedSegmentIndex
        switch selectedIndex {
        case 0:
            colums = 1
            collection.reloadData()
        case 1:
            colums = 2
            collection.reloadData()
        default:
            print("hata")
        }
    }
    
    func update(value: [Result]) {
        let data = value
        dataList = data
    }
}

extension HomeViewController: ViewModelDelegate {
    func handleOutPut(_ output: ViewModelOutPut) {
        switch output {
        case .showList(let list):
            update(value: list)
        }
        DispatchQueue.main.async {
            self.collection.reloadData()
        }
    }
}

extension HomeViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {

        if searchBar.text != "" {
            viewModel?.searchCharacter(key: searchText)
            print(searchText)
        } else {
            viewModel?.load()
        }
    }
}

extension HomeViewController: CollectionViewDelegate{
    func onSelected(value: Result) {
        let vc = DetailPageBuilder.make(value: value)
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension HomeViewController {
    func makeSegment() {
        segmentControl.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(0)
            make.centerX.equalTo(view.snp.centerX)
        }
    }
    
    func makeCollection() {
        collection.snp.makeConstraints { make in
            make.top.equalTo(segmentControl.snp.bottom).offset(10)
            make.left.equalTo(view).offset(10)
            make.right.equalTo(view).offset(-10)
            make.bottom.equalToSuperview()
        }
    }
}

extension HomeViewController:
    UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let dataTwo = dataList[indexPath.row]
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCollectionViewCell.Identifier.path.rawValue, for: indexPath) as? CustomCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.saveModel(value: dataTwo)
        cell.layer.borderColor = UIColor.black.cgColor
        cell.layer.borderWidth = 0.9
        cell.layer.masksToBounds = true
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let collectioViewWith = collectionView.bounds.width
        let flowLayout = collectionViewLayout as! UICollectionViewFlowLayout
        let spaceBetweenCells = flowLayout.minimumInteritemSpacing * (colums - 1)
        let adjustedWith = collectioViewWith - spaceBetweenCells
        let width: CGFloat = floor(adjustedWith / colums)
        var height: CGFloat = 0
        if colums == 1 {
            height = 250
        } else if colums == 2 {
            height = 300
        }
            
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        onSelected(value: dataList[indexPath.row])
    }
}
