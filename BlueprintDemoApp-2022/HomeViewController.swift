//
//  ViewController.swift
//  BlueprintDemoApp-2022
//
//  Created by Mindy Long on 2/15/22.
//

import UIKit

class HomeViewController: UIViewController {
    
    // Initialize some UI components
    let myLabel = UILabel()
    let myButton = UIButton()
    let myForm = UITextField()
    let myImage = UIImageView()
    
    override func viewDidLoad() {
        
        // Add subviews to view of UIViewController
        self.view.addSubview(myForm)
        self.view.addSubview(myLabel)
        self.view.addSubview(myButton)
        self.view.addSubview(myImage)
        
        // We can only apply constraints AFTER we place them in the view.
        myForm.backgroundColor = .red
        myForm.borderStyle = .roundedRect
        myForm.placeholder = "Your text here..."
        myForm.translatesAutoresizingMaskIntoConstraints = false
        
        /* Anchor rundowns */
        /*
         topAnchor: top
         bottomAnchor: bottom
         leadingAnchor: left
         trailingAnchor: right
         centerXAnchor: horizontal center
         centerYAnchor: vertical center
         heightAnchor: height (can't use with BOTH top/bottom at once)
         widthAnchor: width (can't use with BOTH leading/trailing at once)
         
         constant (param): -x (move left x), +x (move right x)
         
         Very useful anchor: self.view.safeAreaLayoutGuide (defines where view is actually seen)
        */
        
        NSLayoutConstraint.activate([
            myForm.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            myForm.heightAnchor.constraint(equalToConstant: 50),
            myForm.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 50),
            myForm.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -50)
        ])
        // Assign a response to an action on the button
        myForm.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .allEditingEvents)
        
        myLabel.text = "Hello World!"
        myLabel.backgroundColor = .green
        myLabel.translatesAutoresizingMaskIntoConstraints = false
        myLabel.numberOfLines = 3
        myLabel.textAlignment = .center
        NSLayoutConstraint.activate([
            myLabel.topAnchor.constraint(equalTo: myForm.bottomAnchor),
            myLabel.heightAnchor.constraint(equalToConstant: 200),
            myLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 50),
            myLabel.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -50)
        ])
        
        myButton.setTitle("Press me!", for: .normal)
        myButton.setTitle("Pressed!", for: .highlighted)
        myButton.backgroundColor = .blue
        myButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            myButton.topAnchor.constraint(equalTo: myLabel.bottomAnchor),
            myButton.heightAnchor.constraint(equalToConstant: 50),
            myButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 50),
            myButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -50)
        ])
        myButton.addTarget(self, action: #selector(changeText(_:)), for: .allTouchEvents)
        
        // Add images to your Assets.xcassets folder. Images that are displayed on screen are known as UIImages.
        myImage.image = UIImage(named: "late_sunset_1")
        myImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            myImage.topAnchor.constraint(equalTo: myButton.bottomAnchor, constant: 20),
            myImage.heightAnchor.constraint(equalToConstant: 200),
            myImage.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 25),
            myImage.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -25)
        ])
        
    }
    
    /* @objc means this is an Objective-C function. Objective-C was an earlier programming language used for iOS apps before Swift. Basically all target functions need @objc as a description.
     
        _ is used before a parameter if you don't want to name the parameter in a function call. In this case, changeText() could just be called like that instead of changeText(sender: myButton). Target functions all use (_ sender: ) in their parameter calls. Senders may vary (could be UISlider, UISwitch, etc.)
     
    */
    @objc func changeText(_ sender: UIButton!) {
        
        // Part 1: Button changes text on label
        /* if myLabel.text == "Hello World!" {
            myLabel.text = "Welcome to Blueprint 2021!"
        } else {
            myLabel.text = "Hello World!"
        } */
        
        // Part 2: Button changes label text to value of text field
        myLabel.text = myForm.text
        
    }
    
    @objc func textFieldDidChange(_ sender: UITextField!) {
        myLabel.text = myForm.text
    }
    
}


import SwiftUI
// This struct from SwiftUI shows us the content preview in the canvas page.
struct MainPreview: PreviewProvider {
    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
    }
    
    struct ContainerView: UIViewControllerRepresentable {
        

            func makeUIViewController(context: UIViewControllerRepresentableContext<MainPreview.ContainerView>) -> UIViewController {
                return UINavigationController(rootViewController: HomeViewController())
            }

            func updateUIViewController(_ uiViewController: MainPreview.ContainerView.UIViewControllerType, context: UIViewControllerRepresentableContext<MainPreview.ContainerView>) {

            }

        }
}
