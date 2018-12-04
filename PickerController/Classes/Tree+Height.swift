//
//  Tree+Extensible.swift
//  CorrelationPicker
//
//  Created by 王继荣 on 08/11/2016.
//  Copyright © 2016 snowflyer. All rights reserved.
//

extension TreeNode {
    public var height: Int {
        return getTreeHeight(treeNode: self)
    }
    
    func getTreeHeight(treeNode: TreeNode) -> Int {
        return treeNode.children.isEmpty ? {
            return 1
            }() : {
                return (treeNode.children.map({ (treeNode) -> Int in
                    return getTreeHeight(treeNode: treeNode)
                }).max() ?? 0) + 1
            }()
    }
}
