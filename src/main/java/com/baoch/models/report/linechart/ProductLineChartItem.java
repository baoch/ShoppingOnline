package com.baoch.models.report.linechart;

public class ProductLineChartItem {
    private int id;
    private String name;
    private float max;
    private float min;
    private float avg;

    public ProductLineChartItem() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public float getMax() {
        return max;
    }

    public void setMax(float max) {
        this.max = max;
    }

    public float getMin() {
        return min;
    }

    public void setMin(float min) {
        this.min = min;
    }

    public float getAvg() {
        return avg;
    }

    public void setAvg(float avg) {
        this.avg = avg;
    }

    public void fromObject(Object[] objects) {
        id = Integer.parseInt(String.valueOf(objects[0]));
        name = String.valueOf(objects[1]);
        max = Float.parseFloat(String.valueOf(objects[2]));
        min = Float.parseFloat(String.valueOf(objects[3]));
        avg = Float.parseFloat(String.valueOf(objects[4]));
    }
}
