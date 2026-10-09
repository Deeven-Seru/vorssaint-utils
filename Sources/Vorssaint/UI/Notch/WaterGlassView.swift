import SwiftUI

struct WaterGlassView: View {
    @State private var waterLevel: CGFloat = 0.0

    var body: some View {
        GeometryReader { geo in
            ZStack(alignment: .bottom) {
                // Glass background
                Path { path in
                    let width = geo.size.width
                    let height = geo.size.height
                    path.move(to: CGPoint(x: width * 0.2, y: 0))
                    path.addLine(to: CGPoint(x: width * 0.8, y: 0))
                    path.addLine(to: CGPoint(x: width * 0.7, y: height))
                    path.addLine(to: CGPoint(x: width * 0.3, y: height))
                    path.closeSubpath()
                }
                .stroke(Color.white.opacity(0.8), lineWidth: 2)
                
                // Water
                Path { path in
                    let width = geo.size.width
                    let height = geo.size.height
                    let currentWaterHeight = height * waterLevel
                    
                    let topY = height - currentWaterHeight
                    
                    let topLeftX = width * 0.3 - (width * 0.1 * waterLevel)
                    let topRightX = width * 0.7 + (width * 0.1 * waterLevel)
                    
                    path.move(to: CGPoint(x: topLeftX, y: topY))
                    path.addLine(to: CGPoint(x: topRightX, y: topY))
                    path.addLine(to: CGPoint(x: width * 0.7, y: height))
                    path.addLine(to: CGPoint(x: width * 0.3, y: height))
                    path.closeSubpath()
                }
                .fill(Color.cyan.opacity(0.8))
                .animation(.easeInOut(duration: 2.0).repeatForever(autoreverses: true), value: waterLevel)
            }
        }
        .onAppear {
            waterLevel = 0.9
        }
    }
}
