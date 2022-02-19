//
//  ViewController.swift
//  BlueprintDemoApp-2022
//
//  Created by Mindy Long on 2/15/22.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    /* @objc means this is an Objective-C function. Objective-C was an earlier programming language used for iOS apps before Swift. Basically all target functions need @objc as a description.
     
     _ is used before a parameter if you don't want to name the parameter in a function call. In this case, changeText() could just be called like that instead of changeText(sender: myButton). Target functions all use (_ sender: ) in their parameter calls. Senders may vary (could be UISlider, UISwitch, etc.)
         
    */
    @objc func changeText(_ sender: UIButton!) {
        // TODO: Configure label //
    }
        
    @objc func textFieldDidChange(_ sender: UITextField!) {
        // TODO: Configure text field //
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
