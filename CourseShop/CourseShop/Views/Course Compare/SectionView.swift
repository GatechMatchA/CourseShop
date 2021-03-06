//
//  SectionView.swift
//  CourseShop
//
//  Created by Rahil Patel on 2/11/20.
//  Copyright © 2020 MatchA. All rights reserved.
//

import SwiftUI

struct SectionView: View {
    var course: Course
    var professor: Professor?
    var reviewsViewable: Bool
    @State var reviewsPresented: Bool = false
    
    @EnvironmentObject var dataModel: DataModel
    var body: some View {
        Group {
            if professor != nil {
                VStack {
                    HStack {
                        VStack {
                            HStack {
                                Text("\(professor!.name)")
                                Spacer()
                                if reviewsViewable {
                                    Button(action: {
                                        self.reviewsPresented = true
                                    }) {
                                        Image(systemName: "info.circle.fill").resizable().frame(width: 22, height: 22)
                                    }
                                }
                            }
                            ForEach(professor!.sections, id: \.self) { section in
                                HStack {
                                    Text("Section \(section.letter) | \(section.daysStr()) | \(section.startTime)-\(section.endTime)").font(Font.system(size: 8))
                                    Spacer()
                                }
                            }
                        }
                        Spacer()
                        
                    }
                    .padding([.top, .leading], 10)
                    Divider()
                    HStack {
                        HStack {
                            Spacer()
                            VStack {
                                Text("GPA").bold()
                                Text(String(format: "%.1f", professor!.avgGPA)) + Text("/4").font(.footnote)
                            }
                            Spacer()
                        }
                        Divider()
                        HStack {
                            Spacer()
                            VStack {
                                Text("Quality").bold()
                                Text(String(format: "%.1f", professor!.avgQuality)) + Text("/5").font(.footnote)
                            }
                            Spacer()
                        }
                        Divider()
                        HStack {
                            Spacer()
                            VStack {
                                Text("Easiness").bold()
                                Text(String(format: "%.1f", professor!.avgEasiness)) + Text("/5").font(.footnote)
                            }
                            Spacer()
                        }
                    }
                    .padding(.bottom, 10)
                }
                .background(Color("item_unselected"))
                .foregroundColor(Color("primary_text_color"))
            } else {
                VStack {
                    Spacer()
                    HStack {
                        Spacer()
                        Text("Tap to select a professor")
                            .foregroundColor(Color("primary_text_color"))
                        Spacer()
                    }
                    Spacer()
                }.background(Color("item_unselected"))
            }
        }
        .sheet(isPresented: $reviewsPresented) {
            ProfessorDetailView(professorDetailViewModel: ProfessorDetailViewModel(course: self.course, professor: self.professor!)).environmentObject(self.dataModel)
        }
    }
}

struct SectionView_Previews: PreviewProvider {
    static var previews: some View {
        SectionView(course: Constants.sampleCourse, professor: Constants.sampleProfessor, reviewsViewable: true)
    }
}
