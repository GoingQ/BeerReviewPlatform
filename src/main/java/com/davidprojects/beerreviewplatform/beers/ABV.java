package com.davidprojects.beerreviewplatform.beers;

import jakarta.persistence.*;

@Entity
@Table(name = "abv")
public class ABV {
    @Id
    private long id;
    private String name;

    public long getId() {
        return id;
    }

    public String getName() {
        return name;
    }

}
