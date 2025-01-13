package com.davidprojects.beerreviewplatform.beers;

import jakarta.validation.constraints.NotEmpty;
import org.springframework.orm.ObjectOptimisticLockingFailureException;
import org.springframework.web.bind.annotation.*;

import java.util.Set;
import java.util.stream.Stream;

@RestController
@RequestMapping("beers")
public class BeerController {
    private final BeerService beerService;

    public BeerController(BeerService beerService) {
        this.beerService = beerService;
    }

    private record BeerDetail(int likes, int dislikes, Set<String> urls, String style, String abv) {
        BeerDetail(Beer beer) {
            this(beer.getLikes(), beer.getDislikes(), beer.getUrls(), beer.getStyle().getName(), beer.getAbv().getName());
        }
    }

   @GetMapping("{id}/detailBeer")
    BeerDetail findDetail(@PathVariable long id) {
        return beerService.findById(id)
                .map(beer -> new BeerDetail(beer))
                .orElseThrow(BeerNietGevondenException::new);
    }

    private record BeerFlavours(String name) {
        BeerFlavours(Flavour flavour) {
            this(flavour.getName());
        }
    }
    @GetMapping("{id}/detailFlavours")
    Stream<BeerFlavours> findFlavours(@PathVariable long id) {
        return beerService.findById(id)
                .orElseThrow(BeerNietGevondenException::new)
                .getFlavours()
                .stream()
                .map(beer -> new BeerFlavours(beer));
    }

    @PatchMapping("{id}/likes")
    void modifyLikes(@PathVariable long id) {
        try {
            beerService.modifyLikes(id);
        } catch (EenAndereGebruikerWijzigdeDeBeerException ex) {
            throw new EenAndereGebruikerWijzigdeDeBeerException();
        }
    }
    @PatchMapping("{id}/dislikes")
    void modifyDislikes(@PathVariable long id) {
        try {
            beerService.modifyDislikes(id);
        } catch (EenAndereGebruikerWijzigdeDeBeerException ex) {
            throw new EenAndereGebruikerWijzigdeDeBeerException();
        }
    }

    private record BeerTable(long id, String name, String nameCountry, String abv) {
        BeerTable(Beer beer) {
            this(beer.getId(), beer.getName(), beer.getCountry().getName(), beer.getAbv().getName());
        }
    }
    @GetMapping(params = "nameContains")
    Stream<BeerTable> findByNameContaining(@NotEmpty String nameContains) {
        return beerService.findByNameContaining(nameContains)
                .stream()
                .map(beer -> new BeerTable(beer));
    }

}
