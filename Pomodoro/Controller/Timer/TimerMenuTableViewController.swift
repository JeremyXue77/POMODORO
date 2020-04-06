//
//  TimerMenuTableViewController.swift
//  Pomodoro
//
//  Created by Jeremy Xue on 2020/4/6.
//  Copyright © 2020 jeremyxue. All rights reserved.
//

import UIKit

/// Timer menu page structures
enum Menu {
    case setting([Setting])
    case feature([Feature])
    case other([Other])
    
    static let sections: [Menu] = [
        .setting(Setting.allCases),
        .feature(Feature.allCases),
        .other(Other.allCases)
    ]
    
    var title: String {
        switch self {
        case .setting:      return "Settings"
        case .feature:      return "Features"
        case .other:        return "Others"
        }
    }
    
    enum Setting: CaseIterable {
        case duration, vibrate, `repeat`
        
        var title: String {
            switch self {
            case .duration: return "Duration"
            case .vibrate:  return "Vibrate"
            case .repeat:   return "Repeat"
            }
        }
    }

    enum Feature: CaseIterable {
        case themeColor
        
        var title: String {
            switch self {
            case .themeColor: return "Theme Color"
            }
        }
    }

    enum Other: CaseIterable {
        case contact
        
        var title: String {
            switch self {
            case .contact: return "Contact Us"
            }
        }
    }
}

// MARK: - TimerMenuTableViewController
class TimerMenuTableViewController: UITableViewController {
    
    // MARK: Properties
    private let sections = Menu.sections
    weak var coordinator: TimerCoordinator?
    
    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Menu"
        tableView.backgroundColor = ThemeColor.darkRed
        tableView.separatorColor = ThemeColor.darkRed2
    }
    
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        sections.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch sections[section] {
        case .setting(let settings): return settings.count
        case .feature(let features): return features.count
        case .other  (let others):   return others.count
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        
        switch sections[indexPath.section] {
        case .setting(let settings):
            let setting = settings[indexPath.row]
            cell.textLabel?.text = setting.title
        case .feature(let features):
            let feature = features[indexPath.row]
            cell.textLabel?.text = feature.title
        case .other(let others):
            let other = others[indexPath.row]
            cell.textLabel?.text = other.title
        }
        cell.backgroundColor = ThemeColor.semiRed
        cell.textLabel?.textColor = ThemeColor.darkRed2
        cell.selectedBackgroundView = UIView()
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        guard let headerView = view as? UITableViewHeaderFooterView else { return }
        headerView.textLabel?.textColor = .white
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        sections[section].title
    }
}
