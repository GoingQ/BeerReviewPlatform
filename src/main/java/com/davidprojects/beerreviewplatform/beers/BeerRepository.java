package com.davidprojects.beerreviewplatform.beers;

import org.springframework.data.jpa.repository.EntityGraph;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface BeerRepository extends JpaRepository<Beer, Long> {

    @EntityGraph(attributePaths = {"country", "abv"})
    List<Beer> findBeersByNameContainingIgnoreCaseOrderByName(String nameContains);

}
