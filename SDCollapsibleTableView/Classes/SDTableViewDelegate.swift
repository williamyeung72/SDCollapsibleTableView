//
//  SDTableViewDelegate.swift
//  Pods-SDCollapsibleTableView_Example
//
//  Created by MAC on 15/10/2019.
//

import Foundation

public protocol SDTableViewDelegate {
    // MARK: Required Methods
    
    func numberOfSections(in sdTableView: SDTableView) -> Int
    
    func sdTableView(_ sdTableView: SDTableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    
    func sdTableView(_ sdTableView: SDTableView, numberOfRowsInSection section: Int) -> Int
    
    // MARK: Optional Methods
    func sdTableView(_ sdTableView: SDTableView, didSelectRowAt indexPath: IndexPath)
    
    func sdTableView(_ sdTableView: SDTableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    
    func sdTableView(_ sdTableView: SDTableView, titleForHeaderInSection section: Int) -> String?
    
    func sdTableView(_ sdTableView: SDTableView, heightForHeaderInSection section: Int) -> CGFloat
    
    func sdTableView(_ sdTableView: SDTableView, viewForHeaderInSection section: Int) -> UIView?
    
    func sdTableView(_ sdTableView: SDTableView, heightForFooterInSection section: Int) -> CGFloat
    
    func sdTableView(_ sdTableView: SDTableView, viewForFooterInSection section: Int) -> UIView?
    
    func sdTableView(_ sdTableView: SDTableView, titleForFooterInSection section: Int) -> String?
    
    func sdTableView(_ expandableTableView: SDTableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath)
    
    func sdTableView(_ expandableTableView: SDTableView, didEndDisplaying cell: UITableViewCell, forRow indexPath: IndexPath)
    
    func sdTableView(_ expandableTableView: SDTableView, willDisplayHeaderView view: UIView, forSection section: Int)
    
    func sdTableView(_ expandableTableView: SDTableView, willDisplayFooterView view: UIView, forSection section: Int)
    
    func sdTableView(_ expandableTableView: UITableView, shouldHighlightRowAt indexPath: IndexPath) -> Bool
    
    func sdTableView(_ expandableTableView: UITableView, didHighlightRowAt indexPath: IndexPath)
    
    func sdTableView(_ expandableTableView: UITableView, didUnhighlightRowAt indexPath: IndexPath)
    
}

public extension SDTableViewDelegate {
    
    func sdTableView(_ sdTableView: SDTableView, didSelectRowAt indexPath: IndexPath) { }
    
    func sdTableView(_ sdTableView: SDTableView, titleForHeaderInSection section: Int) -> String? { return nil }
    
    func sdTableView(_ sdTableView: SDTableView, heightForHeaderInSection section: Int) -> CGFloat { return 0 }
    
    func sdTableView(_ sdTableView: SDTableView, viewForHeaderInSection section: Int) -> UIView? { return nil }
    
    func sdTableView(_ sdTableView: SDTableView, heightForRowAt indexPath: IndexPath) -> CGFloat { return UITableViewAutomaticDimension }
    
    func sdTableView(_ expandableTableView: SDTableView, heightForFooterInSection section: Int) -> CGFloat { return 0 }
    
    func sdTableView(_ expandableTableView: SDTableView, viewForFooterInSection section: Int) -> UIView? { return nil }
    
    func sdTableView(_ expandableTableView: SDTableView, titleForFooterInSection section: Int) -> String? { return nil }
    
    func numberOfSections(in sdTableView: SDTableView) -> Int { return 1 }
    
    func sdTableView(_ sdTableView: SDTableView, willDisplay: UITableViewCell, forRowAt: IndexPath) { }
    
    func sdTableView(_ sdTableView: SDTableView, didEndDisplaying: UITableViewCell, forRow: IndexPath) { }
    
    func sdTableView(_ sdTableView: SDTableView, willDisplayHeaderView view: UIView, forSection section: Int) { }
    
    func sdTableView(_ sdTableView: SDTableView, willDisplayFooterView view: UIView, forSection section: Int) { }
    
    func sdTableView(_ sdTableView: UITableView, shouldHighlightRowAt indexPath: IndexPath) -> Bool { return false }
    
    func sdTableView(_ sdTableView: UITableView, didHighlightRowAt indexPath: IndexPath) { }
    
    func sdTableView(_ sdTableView: UITableView, didUnhighlightRowAt indexPath: IndexPath) { }
    
}

