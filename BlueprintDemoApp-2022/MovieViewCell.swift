//
//  MovieViewCell.swift
//  BlueprintDemoApp-2022
//
//  Created by Mindy Long on 2/19/22.
//

import UIKit

class MovieViewCell: UITableViewCell {
    
    // TODO: Assign an identifier
    // IMPORTANT: Every type of cell must have a cell identifier so the TableView can deque it
    
        
    // initializes a cell with a style and identifier
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .systemBackground
    }
        
    // required protocol when subclassing some UI classes
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
        

}
