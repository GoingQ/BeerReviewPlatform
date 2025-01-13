package com.davidprojects.beerreviewplatform.countries;

import com.davidprojects.beerreviewplatform.beers.Beer;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.stream.Stream;

@RestController
@RequestMapping("countries")
public class CountryController {
    private final CountryService countryService;

    public CountryController(CountryService countryService) {
        this.countryService = countryService;
    }

    private record CountryName(long id, String name) {
        CountryName(Country country) {
            this(country.getId(), country.getName());
        }
    }
    @GetMapping
    Stream<CountryName> findAll() {
        return countryService.findAll()
                .stream()
                .map(CountryName::new);

    }

    private record BeerInfo(long id, String name) {
        BeerInfo(Beer beer) {
            this(beer.getId(), beer.getName());
        }
    }

    @GetMapping("{id}/beers")
    Stream<BeerInfo> findBeersById(@PathVariable long id) {
        return countryService.findById(id)
                .orElseThrow(CountryNietGevondenException::new)
                .getBeers()
                .stream()
                .map(beer -> new BeerInfo(beer));
    }
}
