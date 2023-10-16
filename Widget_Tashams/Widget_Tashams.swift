//
//  Widget_Tashams.swift
//  Widget_Tashams
//
//  Created by Samaa on 01/04/1445 AH.
//

import WidgetKit
import SwiftUI

struct Provider: TimelineProvider {
    let data = DataService()
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), Streak: data.progress())
    }

    func getSnapshot(in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date(), Streak: data.progress())
        completion(entry)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries: [SimpleEntry] = []

        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()
        for hourOffset in 0 ..< 5 {
            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
            let entry = SimpleEntry(date: entryDate, Streak: data.progress())
            entries.append(entry)
        }

        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    let Streak: Int
}

struct Widget_TashamsEntryView : View {
    var entry: Provider.Entry
    let data = DataService()
    var body: some View {
        VStack {
            VStack(alignment: .center){
                    
                    //add the days maching here so it display the streak days
                    HStack {
                        Text("01")
                        //Text(String(data.progress()))//get the data from the data service
                            .font(.system(size: 50))
                            .fontWeight(.medium)
                            .multilineTextAlignment(.leading)
                            .padding([.top, .leading])
                            .fontDesign(.rounded)
                            
                        //Text("☀️")
                            //.font(.system(size: 18))
                            }.offset(x:-20)
                   
                    Text("Steak Days")
                        .font(.system(size: 14))
                        .fontWeight(.semibold)
                        .multilineTextAlignment(.leading)
                        .fontDesign(.rounded)
                        .bold()
                        .offset(y:-7)
                    Image("Sun")
                        .resizable(capInsets: EdgeInsets())
                        .frame(width: 60, height: 60)
                        .offset(x: 10,y:-8.0)
                        .overlay(Image("Cloud").resizable().frame(width: 50, height: 40))
                        .scaleEffect(x: -1.0, y: 1.0)//filped the 3d img
                        .offset(y: -13)
                        .padding(.leading, 75)
                }.padding()

            //Text("Time:")
            //Text(entry.date, style: .time)

        }
    }
}

struct Widget_Tashams: Widget {
    let kind: String = "Widget_Tashams"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            if #available(iOS 17.0, *) {
                Widget_TashamsEntryView(entry: entry)
                    .containerBackground(.fill.tertiary, for: .widget)
                    .background(LinearGradient(gradient: Gradient(colors: [.white,.yellow]), startPoint: .topLeading, endPoint: .bottomTrailing))
            } else {
                Widget_TashamsEntryView(entry: entry)
                    .padding()
                    .background()
            }
        }
        .configurationDisplayName("My Widget")
        .description("This is an example widget.")
        
    }
}

#Preview(as: .systemSmall) {
    Widget_Tashams()
} timeline: {
    SimpleEntry(date: .now, Streak: 1)
    SimpleEntry(date: .now, Streak: 4   )
}
