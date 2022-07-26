//
//  ViewController.swift
//  RandomPhoto
//
//  Created by Bolton Otieno on 26/07/2022.
//

import UIKit

class ViewController: UIViewController {

    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = .white
        return imageView
    }()

    private let buttonView: UIButton = {
        let button = UIButton()
        button.backgroundColor = .white
        button.setTitle("Generate", for: .normal)
        button.setTitleColor(.black, for: .normal)
        return button
    }()

    let colors: [UIColor] = [
        .systemBlue,
        .systemCyan,
        .systemTeal,
        .systemPurple,
        .systemBrown,
        .systemPink,
        .systemGreen,
        .systemYellow,
        .systemOrange,
        .systemGray,
        .systemMint
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        chooseRandomColor()

        view.addSubview(imageView)
        imageView.frame = CGRect(x: 0, y: 0, width: 300, height: 300)
        imageView.center = view.center

        view.addSubview(buttonView)
        buttonView.addTarget(self, action: #selector(didClickButton), for: .touchUpInside)
        getRandomPhoto()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        buttonView.frame = CGRect(x: 30, y: view.frame.size.height-150-view.safeAreaInsets.bottom, width: view.frame.size.width-60, height: 55)
    }

    @objc func didClickButton() {
        getRandomPhoto()

        chooseRandomColor()
    }

    func chooseRandomColor() {
        view.backgroundColor = colors.randomElement()
    }

    func getRandomPhoto() {
        let urlString = "https://source.unsplash.com/random/600x600"
        let url = URL(string: urlString)!

        guard let data = try? Data(contentsOf: url) else {
            return
        }

        imageView.image = UIImage(data: data)
    }

}

