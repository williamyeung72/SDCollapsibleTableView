//
//  SDCollapsibleTableView.swift
//  Pods-SDCollapsibleTableView_Example
//
//  Created by MAC on 14/10/2019.
//

import Foundation
import UIKit

// MARK:SDCollapsibleTableView
open class SDTableView: UITableView {
    
    public var autoReleaseDelegate: Bool = true
    
    public var sdDelegate: SDTableViewDelegate? {
        didSet {
            self.dataSource = self
            self.delegate = self
        }
    }
    public var expandedSections: [Int: Bool] = [:]
    
    open override func willMove(toWindow newWindow: UIWindow?) {
        super.willMove(toWindow: newWindow)
        if newWindow == nil && self.autoReleaseDelegate {
            self.sdDelegate = nil
        }
    }
}

// MARK: Required methods
extension SDTableView: UITableViewDataSource, UITableViewDelegate {
    
    @objc public func handleExpandCollapse(section: Int) {
        
        if let isExpanded = expandedSections[section] {
            expandedSections[section] = !isExpanded
            var indexPaths = [IndexPath]()
            let count = sdDelegate?.sdTableView(self, numberOfRowsInSection: section) ?? 0
            
            if count > 0 {
                for i in 0 ... count - 1 {
                    indexPaths.append(IndexPath(row: i, section: section))
                }
                if isExpanded {
                    self.deleteRows(at: indexPaths, with: .fade)
                } else {
                    self.insertRows(at: indexPaths, with: .fade)
                }
            }
        }
    }
    
    public func numberOfSections(in tableView: UITableView) -> Int {
        guard let delegate = sdDelegate else { return 0 }
        
        let number = delegate.numberOfSections(in: self)
        
        if expandedSections.count != number {
            
            if number > 0 {
                for index in 0 ... number - 1 {
                    expandedSections[index] = true
                }
            }
        }

        return number
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if let isExpand = expandedSections[section] {
            
            if isExpand == true {
                return sdDelegate?.sdTableView(self, numberOfRowsInSection: section) ?? 0
            }
        }
        
        return 0
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return sdDelegate?.sdTableView(self, cellForRowAt: indexPath) ?? UITableViewCell()
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let delegate = sdDelegate else { return }
        return delegate.sdTableView(self, didSelectRowAt: indexPath)
    }
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        guard let delegate = sdDelegate else { return UITableViewAutomaticDimension }
        return delegate.sdTableView(self, heightForRowAt: indexPath)
    }
    
    //header
    public func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        guard let delegate = sdDelegate else { return nil }
        return delegate.sdTableView(self, titleForHeaderInSection: section)
    }
    
    public func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        guard let delegate = sdDelegate else { return 0 }
        return delegate.sdTableView(self, heightForHeaderInSection: section)
    }
    
    public func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let delegate = sdDelegate else { return nil }
        return delegate.sdTableView(self, viewForHeaderInSection: section)
    }
    
    //footer
    public func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        guard let delegate = sdDelegate else { return nil }
        return delegate.sdTableView(self, titleForFooterInSection: section)
    }
    
    public func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        guard let delegate = sdDelegate else { return 0 }
        return delegate.sdTableView(self, heightForFooterInSection: section)
    }
    
    public func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        guard let delegate = sdDelegate else { return nil }
        return delegate.sdTableView(self, viewForFooterInSection: section)
    }
    
    
    @objc(tableView:willDisplayCell:forRowAtIndexPath:) public func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard let delegate = sdDelegate else { return }
        delegate.sdTableView(self, willDisplay: cell, forRowAt: indexPath)
    }
    
    public func tableView(_ tableView: UITableView, didEndDisplaying cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard let delegate = sdDelegate else { return }

        delegate.sdTableView(self, didEndDisplaying: cell, forRow: indexPath)
      
    }
    
    public func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        guard let delegate = sdDelegate else { return }
        return delegate.sdTableView(self, willDisplayHeaderView: view, forSection: section)
    }
    
    public func tableView(_ tableView: UITableView, willDisplayFooterView view: UIView, forSection section: Int) {
        guard let delegate = sdDelegate else { return }
        return delegate.sdTableView(self, willDisplayFooterView: view, forSection: section)
    }
    
    public func tableView(_ tableView: UITableView, shouldHighlightRowAt indexPath: IndexPath) -> Bool {
         guard let delegate = sdDelegate else { return false }
        return delegate.sdTableView(self, shouldHighlightRowAt: indexPath)
    }
    
    public func tableView(_ tableView: UITableView, didHighlightRowAt indexPath: IndexPath) {
        guard let delegate = sdDelegate else { return }
        return delegate.sdTableView(self, didHighlightRowAt: indexPath)
    }
    
    public func tableView(_ tableView: UITableView, didUnhighlightRowAt indexPath: IndexPath) {
        guard let delegate = sdDelegate else { return }
        return delegate.sdTableView(self, didUnhighlightRowAt: indexPath)
    }
    
}
