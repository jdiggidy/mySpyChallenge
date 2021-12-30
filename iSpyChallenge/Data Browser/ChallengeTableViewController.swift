//
//  ChallengeTableViewController.swift
//  iSpyChallenge
//
//

import Foundation
import UIKit
import CoreData

enum ChallengeSectionType: String {
    case attributes
    case relationships
}

enum ChallengeRowType: String {
    case hint
    case latitude
    case longitude
    case photoHref
    case creator
    case matches
    case ratings
}

struct ChallengeRow {
    let type: ChallengeRowType
    let title: String?
    let detail: String?
}

struct ChallengeSection {
    let type: ChallengeSectionType
    let rows: [ChallengeRow]
}

struct ChallengeViewModel {
    let sections: [ChallengeSection]
    
    init(challenge: Challenge?) {
        let attributeSection = ChallengeSection(type: .attributes, rows: [
            ChallengeRow(type: .hint, title: challenge?.hint, detail: "hint"),
            ChallengeRow(type: .latitude, title: String(format: "%.5f", challenge!.latitude), detail: "latitude"),
            ChallengeRow(type: .longitude, title: String(format: "%.5f", challenge!.longitude), detail: "longitude"),
            ChallengeRow(type: .photoHref, title: challenge?.photoHref, detail: "photoHref")
        ])
        
        let relationshipSection = ChallengeSection(type: .relationships, rows: [
            ChallengeRow(type: .creator, title: "Creator", detail: nil),
            ChallengeRow(type: .matches, title: "Matches", detail: nil),
            ChallengeRow(type: .ratings, title: "Ratings", detail: nil),
        ])
        
        self.sections = [attributeSection, relationshipSection]
    }
}

class ChallengeTableViewController: UITableViewController {
    var photoController: PhotoController!
    var challenge: Challenge?
    var viewModel: ChallengeViewModel?

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = ChallengeViewModel(challenge: challenge)
    }

    // MARK: - UITableViewDataSource & UITableViewDelegate
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        viewModel?.sections.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel?.sections[safe: section]?.rows.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let section = viewModel?.sections[safe: indexPath.section]
        let row = section?.rows[safe: indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChallengeCell")!
        cell.textLabel?.text = row?.title
        cell.detailTextLabel?.text = row?.detail
        
        if section?.type == .attributes {
            cell.accessoryType = .none
        }
        else {
            cell.accessoryType = .disclosureIndicator
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        viewModel?.sections[safe: section]?.type.rawValue
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let row = viewModel?
            .sections[safe: indexPath.section]?
            .rows[safe: indexPath.row]
        
        switch row?.type {
        case .creator:
            performSegue(withIdentifier: "ShowUser", sender: self)
        case .matches:
            performSegue(withIdentifier: "ShowMatches", sender: self)
        case .ratings:
            performSegue(withIdentifier: "ShowRatings", sender: self)
        default:
            break
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }

    // MARK: - Segues
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        injectProperties(viewController: segue.destination)
    }
    
    // MARK: - Injection
    
    func injectProperties(viewController: UIViewController) {
        if let vc = viewController as? UserTableViewController {
            vc.photoController = photoController
            vc.user = self.challenge?.creator
        }
        
        if let vc = viewController as? MatchesTableViewController {
            vc.photoController = photoController
            vc.matches = challenge?.matches.sorted(by: { !$0.verified || $1.verified }) ?? []
        }
        
        if let vc = viewController as? RatingsTableViewController {
            vc.ratings = challenge?.ratings.sorted(by: { $0.stars < $1.stars }) ?? []
        }
    }
}