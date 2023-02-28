package com.ebix.restapi.repository;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.ebix.restapi.entity.ThemeParkRide;

import java.util.List;

@Repository
public interface ThemeParkRideRepository extends CrudRepository<ThemeParkRide, Long> {
    List<ThemeParkRide> findByName(String name);
}