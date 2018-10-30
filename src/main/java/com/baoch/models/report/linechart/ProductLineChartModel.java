package com.baoch.models.report.linechart;

import java.util.List;

public class ProductLineChartModel {

    private List<ProductLineChartItem> modelList;

    public ProductLineChartModel() {
    }

    public List<ProductLineChartItem> getModelList() {
        return modelList;
    }

    public void setModelList(List<ProductLineChartItem> modelList) {
        this.modelList = modelList;
    }
}
