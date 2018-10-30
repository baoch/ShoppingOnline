package com.baoch.services;

import com.baoch.models.report.linechart.ProductLineChartItem;
import com.baoch.models.report.linechart.ProductLineChartModel;
import com.baoch.models.report.piechart.PieChartItem;
import com.baoch.models.report.piechart.PieChartModel;
import com.baoch.repository.ProductRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class ReportService {

    private ProductRepository productRepository;

    @Autowired
    public void setProductRepository(ProductRepository productRepository) {
        this.productRepository = productRepository;
    }


    public PieChartModel getProductAmountPerCategory() {
        List<Object[]> objectList = productRepository.findProductAmountPerCategory();
        List<PieChartItem> modelList = new ArrayList<>();
        PieChartItem product;
        for (Object[] o : objectList) {
            product = new PieChartItem();
            product.fromObjects(o);
            modelList.add(product);
        }
        PieChartModel pieChart = new PieChartModel();
        pieChart.setModelList(modelList);
        return pieChart;
    }

    public PieChartModel getProductPerCategory() {
        List<Object[]> objectList = productRepository.findProductPerCategory();
        List<PieChartItem> modelList = new ArrayList<>();
        PieChartItem product;
        for (Object[] o : objectList) {
            product = new PieChartItem();
            product.fromObjects(o);
            modelList.add(product);
        }
        PieChartModel pieChart = new PieChartModel();
        pieChart.setModelList(modelList);
        return pieChart;
    }


    public ProductLineChartModel getProductLineChartReport() {
        List<Object[]> objectList = productRepository.findProductMaxMinAvgByCategory();
        List<ProductLineChartItem> modelList = new ArrayList<>();
        ProductLineChartItem p;
        for (Object[] o : objectList) {
            p = new ProductLineChartItem();
            p.fromObject(o);
            modelList.add(p);
        }
        ProductLineChartModel lineChart = new ProductLineChartModel();
        lineChart.setModelList(modelList);
        return lineChart;
    }

}
