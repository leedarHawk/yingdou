package com.zmsport.iyuesai.service;

import com.zmsport.iyuesai.mapper.Admin;
import com.zmsport.iyuesai.mapper.City;
import com.zmsport.iyuesai.mapper.CityMapper;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.Arrays;
import java.util.List;

/**
 * Created by ken.kang on 2016/2/19.
 */
public class CityServiceImpl implements CityService {

    @Autowired
    private CityMapper mapper;

    public City findCityByName(String cityName) {
       return mapper.findCityByName(cityName) ;
    }

    public List<City> getCitys(int page, int pageSize) {
        return mapper.getCitys(page, pageSize);
    }

    public int getTotalNum() {
        return mapper.getTotalNum();
    }

    public void insert(City city) {
        mapper.insert(city);
    }

    public void update(City city) {
        mapper.update(city);
    }

    public City findCityById(long id) {
        return mapper.findCityById(id);
    }


    public void delete(String ids) {
        mapper.delete(Arrays.asList(ids.split(",")));
    }
}
