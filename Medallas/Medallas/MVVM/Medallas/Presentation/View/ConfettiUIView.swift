//
//  ConfettiUIView.swift
//  Medallas
//
//  Created by Alexander Ynoñan H. on 17/10/25.
//

import SwiftUI

struct ConfettiUIView: View {
    @State private var particles: [ConfettiParticle] = []
    
    var body: some View {
        ZStack {
            ForEach(particles) { particle in
                Circle()
                    .fill(particle.color)
                    .frame(width: particle.size, height: particle.size)
                    .position(particle.position)
                    .opacity(particle.opacity)
                    .animation(.easeOut(duration: 2), value: particle.position)
            }
        }
        .ignoresSafeArea()
        .onAppear(perform: generateParticles)
    }
    
    private func generateParticles() {
        particles = (0..<50).map { _ in
            ConfettiParticle.random()
        }
        withAnimation(.easeOut(duration: 3)) {
            for i in 0..<particles.count {
                particles[i].position.y += CGFloat.random(in: 400...800)
                particles[i].opacity = 0
            }
        }
    }
}

struct ConfettiParticle: Identifiable {
    let id = UUID()
    var position: CGPoint
    var color: Color
    var size: CGFloat
    var opacity: Double
    
    static func random() -> ConfettiParticle {
        ConfettiParticle(
            position: CGPoint(
                x: CGFloat.random(in: 0...UIScreen.main.bounds.width),
                y: CGFloat.random(in: -100...0)),
            color: [Color.red, .blue, .green, .yellow, .purple, .orange].randomElement() ?? .black,
            size: CGFloat.random(in: 6...14),
            opacity: 1.0
        )
    }
}
