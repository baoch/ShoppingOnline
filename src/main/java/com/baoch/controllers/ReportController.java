package com.baoch.controllers;

import com.baoch.models.report.linechart.ProductLineChartModel;
import com.baoch.models.report.piechart.PieChartModel;
import com.baoch.services.ReportService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping(value = "/report")
public class ReportController {

    private ReportService reportService;

    @Autowired
    public void setReportService(ReportService reportService) {
        this.reportService = reportService;
    }

    @RequestMapping(value = "", method = RequestMethod.GET)
    public ModelAndView report() {
        ModelAndView mav = new ModelAndView("/report/report");
        PieChartModel productAmountModel = reportService.getProductAmountPerCategory();
        PieChartModel productModel = reportService.getProductPerCategory();
        ProductLineChartModel productLineChart = reportService.getProductLineChartReport();
        mav.addObject("minMaxAvgProduct", productLineChart);
        mav.addObject("productAmountModel", productAmountModel);
        mav.addObject("productModel", productModel);
        return mav;
    }
}
