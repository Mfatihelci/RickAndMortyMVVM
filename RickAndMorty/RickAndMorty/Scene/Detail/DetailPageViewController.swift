//
//  DetailPageViewController.swift
//  RickAndMorty
//
//  Created by muhammed fatih elçi on 3.08.2023.
//

import UIKit

class DetailPageViewController: UIViewController {
    
    private lazy var Image: UIImageView = {
        let image = UIImageView()
        image.layer.borderColor = UIColor.black.cgColor
        image.layer.borderWidth = 2.0
        image.clipsToBounds = true
        image.layer.cornerRadius = 20
        view.addSubview(image)
        return image
    }()
    
    private lazy var Name: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 18)
        view.addSubview(label)
        return label
    }()
    
    private lazy var Status: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 18)
        view.addSubview(label)
        return label
    }()
    
    private lazy var Specise: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 18)
        view.addSubview(label)
        return label
    }()
    
    private lazy var Gender: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 18)
        view.addSubview(label)
        return label
    }()
    
    private lazy var Location: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 18)
        view.addSubview(label)
        return label
    }()
    
    private lazy var Episode: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 18)
        view.addSubview(label)
        return label
    }()
    
    private lazy var Origin: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 18)
        view.addSubview(label)
        return label
    }()
    
    
    var viewModel: DetailPageViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()

        viewModel?.load()
        configure()
        //view.backgroundColor = .systemGreen
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black]

    }
    
    private func configure() {
        makeImage()
        makeName()
        makeStatus()
        makeSpecise()
        makeGender()
        makeLocation()
        makeEpisode()
        makeOrigin()
    }
}

extension DetailPageViewController: DetailPageViewModelDelegate {
    func update(_ value: Result) {
        self.title = value.name
        Image.af.setImage(withURL: URL(string: value.image)!)
        Name.text = "Name: \(value.name)"
        Status.text = "Status: \(value.status)"
        Specise.text = "Specise: \(value.species)"
        Gender.text = "Gender: \(value.gender)"
        Location.text = "Location: \(value.location.name)"
        Episode.text = "Episode: \(value.episode.count)"
        Origin.text = "Origin: \(value.origin.name)"
        
        switch value.status {
        case .alive:
            view.backgroundColor = .systemGreen
        case .dead:
            view.backgroundColor = .systemCyan
        case .unknown:
            view.backgroundColor = .systemPink
        }
    }
}

extension DetailPageViewController {
    private func makeImage() {
        Image.snp.makeConstraints { make in
            make
                .top.equalTo(view.safeAreaLayoutGuide).offset(10)
            make
                .height.equalTo(view.frame.height/2.4)
            make
                .width.equalTo(view.frame.width/1.4)
            make
                .centerX.equalTo(view.snp.centerX)
        }
    }
    
    private func makeName() {
        Name.snp.makeConstraints { make in
            make
                .top.equalTo(Image.snp.bottom).offset(15)
            make
                .centerX.equalTo(view.snp.centerX)
        }
    }
    
    private func makeStatus() {
        Status.snp.makeConstraints { make in
            make
                .top.equalTo(Name.snp.bottom).offset(15)
            make
                .centerX.equalTo(view.snp.centerX)
        }
    }
    
    private func makeSpecise() {
        Specise.snp.makeConstraints { make in
            make
                .top.equalTo(Status.snp.bottom).offset(15)
            make
                .centerX.equalTo(view.snp.centerX)
        }
    }
    
    private func makeGender() {
        Gender.snp.makeConstraints { make in
            make
                .top.equalTo(Specise.snp.bottom).offset(15)
            make
                .centerX.equalTo(view.snp.centerX)
        }
    }
    
    private func makeLocation() {
        Location.snp.makeConstraints { make in
            make
                .top.equalTo(Gender.snp.bottom).offset(15)
            make
                .centerX.equalTo(view.snp.centerX)
        }
    }
    
    private func makeEpisode() {
        Episode.snp.makeConstraints { make in
            make
                .top.equalTo(Location.snp.bottom).offset(15)
            make
                .centerX.equalTo(view.snp.centerX)
        }
    }
    
    private func makeOrigin() {
        Origin.snp.makeConstraints { make in
            make
                .top.equalTo(Episode.snp.bottom).offset(15)
            make
                .centerX.equalTo(view.snp.centerX)
        }
    }
}
