//
//  MovieView.swift
//  BlueprintDemoApp-2022
//
//  Created by Mindy Long on 2/19/22.
//

import Foundation
import UIKit

class MovieView: UIViewController {
    
    // TODO: Why a scrollview and stackview?
    let scrollView = UIScrollView()
    let infoStack = UIStackView()
    
    // Contents inside infoStack
    var posterImage = UIImageView()
    var posterImageURL = ""
    let descriptions = ["Title", "Synopsis", "Release Date", "Genres", "Rating"]
    
    // Contents to be passed in
    var contents: [Any] = [] // should be same length as `descriptions`
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        buildViews()
    }
    
}

// ** Style tip: Use extensions to make your code clean! ** //
extension MovieView {
    
    // Create the views of our movie page
    func buildViews() {
        
        // First, make the entire page scrollable
        view.addSubview(scrollView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
        
        
        // Next, add our stackview that displays the information
        scrollView.addSubview(infoStack)
        // infoStack.backgroundColor = .blue
        
        infoStack.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            infoStack.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            infoStack.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            infoStack.topAnchor.constraint(equalTo: scrollView.topAnchor),
            infoStack.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor)
        ])
        
        infoStack.axis = .vertical
        infoStack.alignment = .fill
        infoStack.spacing = 5
        infoStack.distribution = .fillProportionally
        
        
        // Our first section is our movie's poster image
        infoStack.addArrangedSubview(posterImage)
        let imgURL = URL(string: posterImageURL)!
        
        // Since loading the poster image takes a long time, let's do it async
        DispatchQueue.global().async {
            guard let data = try? Data(contentsOf: imgURL) else { return }
            DispatchQueue.main.async {
                print("loading movie poster")
                let img = UIImage(data: data)
                self.posterImage.contentMode = .scaleAspectFit
                self.posterImage.image = img
            }
        }
        posterImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            posterImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            posterImage.heightAnchor.constraint(equalToConstant: 300)
        ])
        posterImage.backgroundColor = .clear
        
        
        // Build the rest of the sections
        for i in 0..<descriptions.count {
            
            // TODO: How would you describe 'section'?
            let section = UIView()
            infoStack.addArrangedSubview(section)
            
            // Shape of our section
            section.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                section.leadingAnchor.constraint(equalTo: infoStack.leadingAnchor, constant: 10),
                section.trailingAnchor.constraint(equalTo: infoStack.trailingAnchor, constant: -10),
                section.heightAnchor.constraint(equalToConstant: 105)
            ])
            
            // Let's make the section title
            let title = UILabel(frame: CGRect(x: 0, y: 2, width: self.view.frame.width - 16, height: 20))
            title.text = descriptions[i]
            title.font = UIFont.boldSystemFont(ofSize: 20)
            
            // Associated data for that section
            let info = UILabel(frame: CGRect(x: 0, y: 22, width: self.view.frame.width - 16, height: 60))

            info.text = contents[i] as? String
            info.textColor = .black
            // info.backgroundColor = .purple
            
            // Use a view's layer to access its border properties and to draw elements on it. Note how layers use cgColor (core graphics), not UIColor.
            // section.layer.borderColor = UIColor.black.cgColor
            // section.layer.borderWidth = 1
                        
            section.addSubview(title)
            section.addSubview(info)
            
        }
    }
    
}


// /////////////////////////////////////// //
// Remember to setup your content preview! //
// /////////////////////////////////////// //
import SwiftUI

struct MoviePreview: PreviewProvider {
    static var previews: some View {
        Group {
            ContainerView().edgesIgnoringSafeArea(.all)
        }
    }
    
    struct ContainerView: UIViewControllerRepresentable {

            func makeUIViewController(context: UIViewControllerRepresentableContext<MoviePreview.ContainerView>) -> UIViewController {
                return UINavigationController(rootViewController: MovieView())
            }

            func updateUIViewController(_ uiViewController: MoviePreview.ContainerView.UIViewControllerType, context: UIViewControllerRepresentableContext<MoviePreview.ContainerView>) {

            }

        }
}
