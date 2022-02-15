# Blueprint Demo App
 
This is the repository for the Blueprint 2022 mobile development (iOS) track. This repository will be used to teach 4  sessions on iOS development. The branches are labeled by session number. Each session has a starter and completed branch, reflecting the code in each. Here's a brief rundown of each session's content:

1. Swift syntax overview (bpDemoApp/SwiftSyntax.playground), common UI components (UILabel, UIButton, UITextField), basic functions including @objc types, NSLayoutConstraint
2. TableViews, TableViewCells, tab bars, stack views, scroll views
3. Sending URL requests, populating table views and table cells with data, delegates, asynchronous and synchronous processes, passing data to view controllers

Our code is documented with information on Swift components and coding concepts. All code was written using UIKit.

## Running our code
Make sure you have the latest version of XCode (13+) to run our app on iOS 14+. Clone this repository using `git clone https://github.com/mlong93/bpDemoApp.git` and checkout a branch with `git checkout <branch-name>`. 

## Session 1
We provide a XCode playground titled `SwiftSyntax`. We cover variable declarations (`var`, `let`), data types (tuples, arrays, sets, dictionaries, typealiases), optionals (including unwrapping), functions, classes, enums, and structs.

In `HomeViewController.swift`, we build a single-view app, demonstrating the use of layout constraints and basic functionality of UI elements such as labels, buttons, and text fields.

## Session 2
In this session, we begin by building a UITableViewController, which will be used to display movie data. We create a sample MovieViewCell that displays a movie's poster image, title, release date, and rating.

## Session 3
This session focuses on managing and passing data between consecutive views. We create a new object `Movies` that holds an array of `Movie` structs. We provide a json file of movie data provided by the [Movie Database API](https://www.themoviedb.org/documentation/api) and parse the data using [SwiftyJSON](https://github.com/SwiftyJSON/SwiftyJSON).  

## Session 4
We describe the difference between asynchronous/synchronous processes and when to use each. We also add a demonstration of a delegate but did not integrate it into our codebase. To see a working implementation of a delegate, please check back later for a `httpRequest` branch.
