package com.baoch.models.report.piechart;

public class PieChartItem {
    private int id;
    private String name;
    private int value;

    public PieChartItem() {
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

    public int getValue() {
        return value;
    }

    public void setValue(int value) {
        this.value = value;
    }

    public void fromObjects(Object[] objects) {
        id = Integer.parseInt(String.valueOf(objects[0]));
        name = String.valueOf(objects[1]);
        value = Integer.parseInt(String.valueOf(objects[2]));
    }
}
