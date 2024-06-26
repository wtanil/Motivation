//
//  SettingView.swift
//  Motivation
//
//  Created by William Tanil on 04/06/24.
//  Copyright (c) 2024 William Tanil. All rights reserved.
//

import SwiftUI

struct SettingView: View {
    
    @AppStorage("hasCustomGoal") private var hasCustomGoal = false
    @AppStorage("isGoalPublic") private var isGoalPublic = false
    @AppStorage("customGoal") private var customGoal = ""
    @AppStorage("notificationType") private var notificationType = 0
    
    #warning("For development only")
    @AppStorage("countOfYes") private var countOfYes = 0
    @AppStorage("countOfNo") private var countOfNo = 0
    @AppStorage("totalCount") private var totalCount = 0
    @AppStorage("storedDate") var storedDate = Double(0)
    
    @State private var toTrigger = false
    
    var body: some View {
        
        GeometryReader { geometry in
            ScrollView {
                
                VStack(alignment: .leading, spacing: 24) {

                    HStack() {
                        Text("Hello, what do you want to change today?")
                            .font(.title2)
                    }
                    
                    HStack {
                        VStack(alignment: .leading) {
                        #warning("For development only")
//                            helperSection
                            
                            customGoalSetting
                            
                            Spacer(minLength: 24)
                            
                            notificationSetting
                        }
                        Spacer()
                    }
                }
                .padding()
                
            }
        }
        
    }
    
    private var customGoalSetting: some View {
        VStack(alignment: .leading) {
            Text("Do you want to write your goal?")
            HStack {
                Button {
                    self.toTrigger.toggle()
                    self.hasCustomGoal = true
                } label: {
                    Text("Yes")
                }
                .modifier(SettingButton())
                .disabled(hasCustomGoal)
                
                Button {
                    self.toTrigger.toggle()
                    self.hasCustomGoal = false
                } label: {
                    Text("No")
                }
                .modifier(SettingButton())
                .disabled(!hasCustomGoal)
            }
            
            if hasCustomGoal {
                VStack(alignment: .leading) {
                    TextField("Write your goal here", text: $customGoal)
                        .modifier(SettingTextField())
                    Text("Do you want to show your goal by default?")
                    HStack {
                        Button {
                            self.toTrigger.toggle()
                            self.isGoalPublic = true
                            
                        } label: {
                            Text("Yes")
                        }
                        .modifier(SettingButton())
                        .disabled(isGoalPublic)
                        Button {
                            self.toTrigger.toggle()
                            self.isGoalPublic = false
                            
                        } label: {
                            Text("No")
                        }
                        .modifier(SettingButton())
                        .disabled(!isGoalPublic)
                        
                    }
                }
                .padding(.leading)
                
            }
        }
    }
    
    private var notificationSetting: some View {
        VStack(alignment: .leading) {
            Text("How do you want to be reminded?")
            VStack(alignment: .leading) {
                // Type 0
                Button {
                    self.toTrigger.toggle()
                    self.notificationType = 0
                    
                } label: {
                    Text("Don't notify me.")
                }
                .modifier(SettingButton())
                .disabled(notificationType == 0)
                // Type 1
                Button {
                    self.toTrigger.toggle()
                    self.notificationType = 1
                    
                } label: {
                    Text("Notify me once a day, at night.")
                }
                .modifier(SettingButton())
                .disabled(notificationType == 1)
                // Type 2
                Button {
                    self.toTrigger.toggle()
                    self.notificationType = 2
                    
                } label: {
                    Text("Notify me twice a day, at noon and night.")
                }
                .modifier(SettingButton())
                .disabled(notificationType == 2)
            }
        }
    }
    
    #warning("For development only")
    private var helperSection: some View {
        
        VStack(alignment: .leading) {
            Text("yes: \(countOfYes) no: \(countOfNo) total: \(totalCount)")
            Text("isToday: \(Date.isToday(Date.convertIntervalToDate(storedDate)) ? "true" : "false") lastDate: \(Date.convertIntervalToDate(storedDate))")
            Button {
                self.countOfNo = 0
                self.countOfYes = 0
                self.totalCount = 0
                self.storedDate = Double(0)
                self.hasCustomGoal = false
                self.isGoalPublic = false
                self.customGoal = ""
                self.notificationType = 0
                self.toTrigger.toggle()
                
            } label: {
                Text("reset")
            }
        }
        .padding()
        
    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView()
    }
}
