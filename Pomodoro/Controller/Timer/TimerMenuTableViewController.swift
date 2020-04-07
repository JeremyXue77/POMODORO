//
//  TimerMenuTableViewController.swift
//  Pomodoro
//
//  Created by Jeremy Xue on 2020/4/6.
//  Copyright © 2020 jeremyxue. All rights reserved.
//

import UIKit

// MARK: - Menu enumeration
/// Menu enum used to TimerMenuTableViewController's tableView structures
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
        case duration, breakTime, `autoRepeat`
        
        var title: String {
            switch self {
            case .duration:    return "Duration"
            case .breakTime:   return "Break Time"
            case .autoRepeat:  return "Auto-Repeat"
            }
        }
    }

    enum Feature: CaseIterable {
        case vibrate, sound
        
        var title: String {
            switch self {
            case .vibrate:    return "Vibrate"
            case .sound:      return "Sound"
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
        switch sections[indexPath.section] {
        case .setting(let settings): return configurationSettingCell(settings, indexPath)
        case .feature(let features): return configurationFeatureCell(features, indexPath)
        case .other(let others):     return configurationOtherCell(others, indexPath)
        }
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        sections[section].title
    }
    
    // MARK: - CofigurationCells
    fileprivate func configurationSettingCell(_ settings: ([Menu.Setting]),
                                              _ indexPath: IndexPath) -> UITableViewCell {
        let cell = TimerMenuTableViewCell(style: .default, reuseIdentifier: nil)
        let setting = settings[indexPath.row]
        cell.textLabel?.text = setting.title
        return cell
    }
    
    fileprivate func configurationFeatureCell(_ features: ([Menu.Feature]),
                                              _ indexPath: IndexPath) -> UITableViewCell {
        let cell = SwitchTableViewCell(style: .default, reuseIdentifier: nil)
        let feature = features[indexPath.row]
        cell.textLabel?.text = feature.title
        cell.cellSwitch.isOn = true
        return cell
    }
    
    fileprivate func configurationOtherCell(_ others: ([Menu.Other]),
                                            _ indexPath: IndexPath) -> UITableViewCell {
        let cell = TimerMenuTableViewCell(style: .default, reuseIdentifier: nil)
        let other = others[indexPath.row]
        cell.textLabel?.text = other.title
        return cell
    }
    
    // MARK: - Table view delegate
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        guard let headerView = view as? UITableViewHeaderFooterView else { return }
        headerView.textLabel?.textColor = .white
    }
}
