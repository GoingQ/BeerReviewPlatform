package com.davidprojects.beerreviewplatform.countries;

import com.davidprojects.beerreviewplatform.beers.Beer;
import jakarta.persistence.*;

import java.util.Collections;
import java.util.Set;


@Entity
@Table(name = "countries")
public class Country {
    @Id
    private long id;
    private String name;

    @OneToMany(mappedBy = "country")
    @OrderBy("name")
    private Set<Beer> beers;

    public long getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public Set<Beer> getBeers() {
        return Collections.unmodifiableSet(beers);
    }
}
