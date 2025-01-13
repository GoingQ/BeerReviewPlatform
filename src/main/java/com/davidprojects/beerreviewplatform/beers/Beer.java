package com.davidprojects.beerreviewplatform.beers;

import com.davidprojects.beerreviewplatform.countries.Country;
import jakarta.persistence.*;

import java.util.Objects;
import java.util.Set;

@Entity
public class Beer {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;

    private String name;
    private int likes;
    private int dislikes;

    @Version
    private int version;

    @ManyToOne(optional = false, fetch = FetchType.LAZY)
    @JoinColumn(name = "countryId")
    private Country country;

    @ManyToOne(optional = false, fetch = FetchType.LAZY)
    @JoinColumn(name = "abvId")
    private ABV abv;

    @ManyToOne(optional = false, fetch = FetchType.LAZY)
    @JoinColumn(name = "styleId")
    private Style style;



    @ManyToMany(mappedBy = "beers")
    @OrderBy("name")
    private Set<Flavour> flavours;

    @ElementCollection
    @CollectionTable(name = "webpages",
            joinColumns = @JoinColumn(name = "beerId"))
    @Column(name = "url")
    private Set<String> urls;

    public long getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public int getLikes() {
        return likes;
    }

    public int getDislikes() {
        return dislikes;
    }

    public int getVersion() {
        return version;
    }

    public Country getCountry() {
        return country;
    }

    public ABV getAbv() {
        return abv;
    }

    public Style getStyle() {
        return style;
    }

    public Set<Flavour> getFlavours() {
        return flavours;
    }

    public Set<String> getUrls() {
        return urls;
    }

    void increaseLikes() {
        this.likes++;
    }
    void increaseDislikes() {
        this.dislikes++;
    }

    @Override
    public boolean equals(Object o) {
        if (!(o instanceof Beer beer)) return false;
        return Objects.equals(name, beer.name) && Objects.equals(country, beer.country);
    }

    @Override
    public int hashCode() {
        return Objects.hash(name, country);
    }
}
