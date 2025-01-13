package com.davidprojects.beerreviewplatform.beers;

import jakarta.persistence.*;

import java.util.Collections;
import java.util.Set;

@Entity
@Table(name = "flavour")
public class Flavour {
    @Id
    private long id;
    private String name;

    @ManyToMany
    @JoinTable(
            name = "beerflavours",
            joinColumns = @JoinColumn(name = "flavourId"),
            inverseJoinColumns = @JoinColumn(name = "beerId"))
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

    @Override
    public boolean equals(Object object) {
        return object instanceof Flavour flavour &&
                name.equalsIgnoreCase(flavour.name);
    }
    @Override
    public int hashCode() {
        return name.toLowerCase().hashCode();
    }



}
