//
//  IntroductionView.swift
//  Roadkill
//
//  Created by hongssup on 6/29/24.
//

import SwiftUI

struct IntroductionView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 30) {
            VStack(spacing: 5) {
                Text("로드킬 신고를 위한 음성을 남겨주세요. 🙌")
                Text("해당 정보를 참고하여 남겨주시기 바랍니다.")
            }
            .font(.headline)
            
            content
        }
        .padding(.horizontal, 10)
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    var content: some View {
        VStack(spacing: 20) {
            VStack(alignment: .leading, spacing: 10) {
                Text("1. 위치 📍")
                    .font(.title2)
                
                Group {
                    Text("• 위치에 대한 추가 설명")
                    Text("• 주행 방향")
                    Text("• 로드킬 차선 위치")
                }
                .font(.subheadline)
            }
            
            VStack(alignment: .leading, spacing: 10) {
                Text("2. 사체 정보")
                    .font(.title2)
                
                Group {
                    Text("• 동물 종류")
                    Text("• 형태 확인 가능 여부")
                }
                .font(.subheadline)
            }
            
            VStack(alignment: .leading, spacing: 10) {
                Text("3. 발견 시간 🕐")
                    .font(.title2)
            }
        }
    }
}

#Preview {
    IntroductionView()
}
