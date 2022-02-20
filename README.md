# Blueprint Demo App (2022)

This is the repository for the Blueprint 2022 mobile development (iOS) track. This repository was used to teach 4 sessions on iOS development. The branches are labeled by session number. Each session has a starter and completed branch, reflecting the code in each. Below is a brief rundown of each session's content:

1. Introduction to XCode/iOS development (SwiftUI vs UIKit), Swift syntax overview (bpDemoApp/SwiftSyntax.playground)
2. Common UI components (UILabel, UIButton, UITextField, UIImageView), importing assets, basic functions including @objc types, NSLayoutConstraint
3. UITableView and UITableViewCell
4. Reading data from a `.json` file using SwiftyJSON, displaying data in UITableView, asynchronous and synchronous processes,
5. **NOT TAUGHT DURING A WORKSHOP** Sending URL requests, populating table views and table cells with data, delegates, passing data to view controllers, UIStackView, UIScrollView

This code is documented with information on Swift components and coding concepts. All code was written using UIKit.

Check back soon for recordings of the workshop!

## Running our code
Make sure you have the latest version of XCode (13+) to run our app on iOS 15+. Clone this repository using `git clone https://github.com/mlong93/BlueprintDemoApp-2022.git` and checkout a branch with `git checkout <branch-name>`.

## Session 1
I provide a XCode playground titled `SwiftSyntax`. I cover variable declarations (`var`, `let`), data types (tuples, arrays, sets, dictionaries, typealiases), optionals (including unwrapping), functions, classes, enums, and structs.

## Session 2
In `HomeViewController.swift`, I build a single-view app, demonstrating the use of layout constraints and basic functionality of UI elements such as labels, buttons, text fields, and image views.

I also introduce briefly a UITableView.

## Session 3
In this session, I begin by building a UITableViewController, which will be used to display movie data. I create a sample MovieViewCell that displays a movie's poster image, title, release date, and rating.

## Session 4
This session focuses on managing and passing data between consecutive views. I create a new object `Movies` that holds an array of `Movie` structs. I provide a `.json` file of movie data provided by the [Movie Database API](https://www.themoviedb.org/documentation/api) and parse the data using [SwiftyJSON](https://github.com/SwiftyJSON/SwiftyJSON).

I describe the difference between asynchronous/synchronous processes and a sample use (loading images on a global thread).

## Bonus session (uncovered)
I add a delegate and subscribe `MovieViewController` to it. I also replace loading of data from  a `.json` with directly fetching data from the [Movie Database API](https://www.themoviedb.org/documentation/api).

I also allow cells to be pressed and display more detailed contents of the movie they contain in a UIScrollView-contained UIStackView.


## Disclaimer
This curriculum and content was designed by Mindy Long. Feel free to copy/modify code but please cite [this repo](https://github.com/mlong93/BlueprintDemoApp-2022.git) if you do.
