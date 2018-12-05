import Foundation

public struct TreeNode: Codable {

  public let nodes: [TreeNode]?
  public let value: String?
  public let displayName: String?

}

extension TreeNode: CustomStringConvertible {
  public var description: String {
    return displayName ?? value ?? ""
  }
}
