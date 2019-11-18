package com.atlantis.service.impl;

import com.atlantis.dao.DataCountDao;
import com.atlantis.domain.Category;
import com.atlantis.domain.JSONOfECharts;
import com.atlantis.service.DataCountService;
import com.atlantis.utils.DateUtils;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service()
public class DataCountServiceImpl implements DataCountService {
    @Autowired
    private DataCountDao dataCountDao;

    @Override
    public JSONObject writeJOSNOfUserCount() {
        String xAxisData[] = new String[7];
        int[] seriesData = new int[7];
        for (int i = 0, index = -6; i < 7; i++, index++) {
            xAxisData[i] = DateUtils.getDaysOfNow(index,"MM-dd");
            seriesData[i] = dataCountDao.getUserCountOfDay(index);
        }
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("xAxisData", xAxisData);
        map.put("seriesData", seriesData);
        return new JSONObject(map);
    }

    @Override
    public JSONObject writeJOSNOfProductCategory() {
        Map<String, List<JSONOfECharts>> json = new HashMap<String, List<JSONOfECharts>>();
        List<JSONOfECharts> jsonOfEChartsList = new ArrayList<>();
        // 获取全部商品分类信息
        List<Category> categories = dataCountDao.getAllCategoryName();
        for (Category category : categories) {
            int count = 0;
            count = dataCountDao.getCategoryOfProduct(category.getCid());
            JSONOfECharts jsonobj = new JSONOfECharts();
            jsonobj.setDepartment(category.getCname());
            jsonobj.setNum(count);
            jsonOfEChartsList.add(jsonobj);
        }
        json.put("list", jsonOfEChartsList);
        return new JSONObject(json);
    }

    @Override
    public JSONObject writeJOSNOfOrder() {
        Map<String, Object> json = new HashMap<>();
        List<Object> seriesDataList = new ArrayList<>();
        String xAxisData[] = new String[7];
        for (int i = 0, index = -6; i < 7; i++, index++) {
            xAxisData[i] = DateUtils.getDaysOfNow(index,"MM-dd");
        }
        // ----------订单未完成----------
        int[] seriesData1 = new int[7];
        for (int j = 0, index = -6; j < 7; j++, index++) {
            seriesData1[j] = dataCountDao.getUnSuccessOrderCount(index);
        }
        seriesDataList.add(seriesData1);
        // ----------取消订单----------
        int[] seriesData2 = new int[7];
        for (int j = 0, index = -6; j < 7; j++, index++) {
            seriesData2[j] = dataCountDao.getFailOrderCount(index);
        }
        seriesDataList.add(seriesData2);
        // ----------完成订单----------
        int[] seriesData3 = new int[7];
        for (int j = 0, index = -6; j < 7; j++, index++) {
            seriesData3[j] = dataCountDao.getSuccessOrderCount(index);
        }
        seriesDataList.add(seriesData3);
        // ----------订单总数----------
        int[] seriesData4 = new int[7];
        for (int j = 0, index = -6; j < 7; j++, index++) {
            seriesData4[j] = dataCountDao.getAllOrderCount(index);
        }
        seriesDataList.add(seriesData4);
        // ----------订单总额----------
        double[] seriesData5 = new double[7];
        for (int j = 0, index = -6; j < 7; j++, index++) {
            if (dataCountDao.getOrderTotal(index) != null) {
                seriesData5[j] = dataCountDao.getOrderTotal(index);
            } else {
                seriesData5[j] = 0.00;
            }
        }
        seriesDataList.add(seriesData5);
        json.put("xAxisData", xAxisData);
        json.put("seriesDataList", seriesDataList);
        return new JSONObject(json);
    }
}
