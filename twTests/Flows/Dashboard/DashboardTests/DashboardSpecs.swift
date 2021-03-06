//
//  DashboardTests.swift
//  twTests
//
//  Created by Stephen Parker on 1/2/2021.
//

import Quick
import Nimble
import RealmSwift
@testable import tw

class DashboardSpecs: QuickSpec {
    override func spec() {
        var dashboardVC: DashboardViewController!
        var dashboardVM: DashboardViewModel!
        var dashboardCoordinator: DashboardCoordinator!
        let userService = MockUserService(realmClient: MockRealmClient())
        
        beforeEach {
            dashboardVC = DashboardViewController.instantiate(storyboard: "Dashboard")
            dashboardCoordinator = DashboardCoordinator(navigationController: UINavigationController())
            dashboardVM = DashboardViewModel(userService: userService, coordinator: dashboardCoordinator)
            dashboardVC.viewModel = dashboardVM
        }
        
        describe("The dashboard screen") {
            beforeEach {
                _ = dashboardVC.view
            }
            it("Has a username") {
                expect(dashboardVC.usernameLabel?.text).toEventually(equal("Mr Octocat"))
            }
            it("Has a location") {
                expect(dashboardVC.locationLabel?.text).toEventually(equal("The Sea"))
            }
            it("Has a repository count") {
                expect(dashboardVC.repositoryCountLabel.text).toEventually(equal("2"))
            }
            it("Has a follower count") {
                expect(dashboardVC.followerCountLabel.text).toEventually(equal("3500"))
            }
            it("Has a following count") {
                expect(dashboardVC.followingCountLabel.text).toEventually(equal("0"))
            }
        }
    }
}
