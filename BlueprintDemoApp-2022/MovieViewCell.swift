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
    static let movieCellId = "movieViewCell"
    
    let title = UILabel()
    let synopsis = UILabel()
    let rating = UILabel()
    let releaseDate = UILabel()
    let poster = UIImageView()
        
    // initializes a cell with a style and identifier
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .systemBackground
    }
        
    // required protocol when subclassing some UI classes
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        addSubview(title)
        addSubview(synopsis)
        addSubview(rating)
        addSubview(releaseDate)
        addSubview(poster)
        
        title.backgroundColor = .red
        synopsis.backgroundColor = .green
        rating.backgroundColor = .blue
        releaseDate.backgroundColor = .yellow
        poster.backgroundColor = .purple
        
        poster.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            poster.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            poster.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            poster.widthAnchor.constraint(equalToConstant: 150),
            poster.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10)
        ])
        poster.image = UIImage(named: "late_sunset_1")
        
        title.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            title.leadingAnchor.constraint(equalTo: poster.trailingAnchor, constant: 5),
            title.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            title.topAnchor.constraint(equalTo: self.topAnchor, constant: 5),
            title.heightAnchor.constraint(equalToConstant: 60)
        ])
        
        rating.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            rating.leadingAnchor.constraint(equalTo: synopsis.trailingAnchor, constant: 5),
            rating.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            rating.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 5),
            rating.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -5)
        ])
        
        synopsis.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            synopsis.leadingAnchor.constraint(equalTo: poster.trailingAnchor, constant: 5),
            synopsis.widthAnchor.constraint(equalToConstant: 160),
            synopsis.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 5),
            synopsis.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -5)
        ])
    }

}
