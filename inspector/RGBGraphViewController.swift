//
//  RGBGraphViewController.swift
//  inspector
//
//  Created by Jeremy Storer on 6/12/17.
//  Copyright © 2017 Jeremy Storer. All rights reserved.
//

import UIKit
import Charts

class RGBGraphViewController: UIViewController {

    @IBOutlet weak var rgbGraph: LineChartView!
    @IBOutlet weak var rawImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        rawImageView.image = rawImage1
        
        var redVals: [ChartDataEntry] = [ChartDataEntry]()
        for i in 0...rawRedArray.count-1{
            redVals.append(ChartDataEntry(x: Double(i), y: Double(rawRedArray[i])))
        }
        var greenVals: [ChartDataEntry] = [ChartDataEntry]()
        for i in 0...rawGreenArray.count-1{
            greenVals.append(ChartDataEntry(x: Double(i), y: Double(rawGreenArray[i])))
        }
        var blueVals: [ChartDataEntry] = [ChartDataEntry]()
        for i in 0...rawBlueArray.count-1{
            blueVals.append(ChartDataEntry(x: Double(i), y: Double(rawBlueArray[i])))
        }
        
        let redSet: LineChartDataSet = LineChartDataSet(values: redVals, label: "red channel")
        redSet.axisDependency = .left
        redSet.setColor(UIColor.red)
        redSet.lineWidth = 0.5
        redSet.circleRadius = 0
        redSet.fillColor = UIColor.red
        redSet.highlightColor = UIColor.clear
        redSet.highlightLineWidth = 1.2
        
        let greenSet: LineChartDataSet = LineChartDataSet(values: greenVals, label: "green channel")
        greenSet.axisDependency = .left
        greenSet.setColor(UIColor.green)
        greenSet.lineWidth = 0.5
        greenSet.circleRadius = 0
        greenSet.fillColor = UIColor.green
        greenSet.highlightColor = UIColor.clear
        greenSet.highlightLineWidth = 1.2
        
        let blueSet: LineChartDataSet = LineChartDataSet(values: blueVals, label: "blue channel")
        blueSet.axisDependency = .left
        blueSet.setColor(UIColor.blue)
        blueSet.lineWidth = 0.5
        blueSet.circleRadius = 0
        blueSet.fillColor = UIColor.blue
        blueSet.highlightColor = UIColor.clear
        blueSet.highlightLineWidth = 1.2
        
        var dataSets:[LineChartDataSet] = [LineChartDataSet]()
        dataSets.append(redSet)
        dataSets.append(greenSet)
        dataSets.append(blueSet)
        
        let data: LineChartData = LineChartData(dataSets: dataSets)
        self.rgbGraph.data = data
        self.rgbGraph.backgroundColor = UIColor.white
        self.rgbGraph.leftAxis.drawLabelsEnabled = false
        self.rgbGraph.rightAxis.drawLabelsEnabled = true
        self.rgbGraph.xAxis.drawLabelsEnabled = false
        self.rgbGraph.chartDescription?.text = "rgb values vs pixel"
        self.rgbGraph.pinchZoomEnabled = false
        self.rgbGraph.doubleTapToZoomEnabled = false

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
