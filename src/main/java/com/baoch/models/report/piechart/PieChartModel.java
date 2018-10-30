package com.baoch.models.report.piechart;

import java.util.ArrayList;
import java.util.List;

public class PieChartModel {
    private List<PieChartItem> modelList;

    public PieChartModel() {
        modelList = new ArrayList<>();
    }

    public List<PieChartItem> getModelList() {
        return modelList;
    }

    public void setModelList(List<PieChartItem> modelList) {
        this.modelList = modelList;
    }
}
