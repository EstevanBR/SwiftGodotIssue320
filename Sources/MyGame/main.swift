import Foundation
import MyLibrary
import SwiftGodot
import SwiftGodotKit

private func main() {
    guard let projectPath = Bundle.module.path(forResource: "Project", ofType: nil) else {
        fatalError("Could not load resource path")
    }
    runGodot(
        args: ["--path", projectPath],
        initHook: registerTypes,
        loadScene: loadScene,
        loadProjectSettings: { projectSettings in
            print(projectSettings)
        },
        verbose: true
    )
}

private func loadScene (scene: SceneTree) {
    guard let root = scene.root else {
        fatalError("scene.root was nil")
    }

    guard let packedScene = GD.load(path: "my_level.tscn") as? PackedScene else {
        fatalError("Could not load PackedScene")
    }

    guard let node = packedScene.instantiate() else {
        fatalError("Could not instantiate packedScene")
    }

    guard let myLevel = node as? MyLevel else {
        fatalError("node as? MyLevel was nil; description: \(node.description)")
    }

    root.addChild(node: myLevel)
}

private func registerTypes (level: GDExtension.InitializationLevel) {
    switch level {
    case .core: break
    case .servers: break
    case .scene:
        register(type: MyLevel.self)
    
    case .editor: break
    }
}

main()
