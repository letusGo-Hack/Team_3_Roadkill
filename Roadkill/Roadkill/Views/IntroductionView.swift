//
//  IntroductionView.swift
//  Roadkill
//
//  Created by hongssup on 6/29/24.
//

import SwiftUI

struct IntroductionView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("로드킬 신고를 위한 음성을 남겨주세요. 🙌\n해당 정보를 참고하여 남겨주시기 바랍니다.")
                .font(.headline)
            
            VStack(alignment: .leading, spacing: 10) {
                Text("1. 위치 📍")
                    .font(.headline)
                
                Text("• 위치에 대한 추가 설명\n• 주행 방향\n• 로드킬 차선 위치")
                    .font(.caption)
            }
            
            VStack(alignment: .leading, spacing: 10) {
                Text("2. 사체 정보")
                    .font(.headline)
                
                Text("• 동물 종류\n• 형태 확인 가능 여부")
                    .font(.caption)
            }
            
            VStack(alignment: .leading, spacing: 10) {
                Text("3. 발견 시간 🕐")
                    .font(.headline)
            }
        }
        .padding(.horizontal, 20)
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

#Preview {
    IntroductionView()
}
