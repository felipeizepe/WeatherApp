public struct DesignSystem {
    public init() {
    }
}

public class Resources {
    public static var pallets: [CollorPallet] { [LightPallet(), DarkPallet()] }
}
