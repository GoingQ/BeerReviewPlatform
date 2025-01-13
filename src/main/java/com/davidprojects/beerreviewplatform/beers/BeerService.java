package com.davidprojects.beerreviewplatform.beers;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Optional;

@Service
@Transactional(readOnly = true)
public class BeerService {
    private final BeerRepository beerRepository;

    public BeerService(BeerRepository beerRepository) {
        this.beerRepository = beerRepository;
    }

    Optional<Beer> findById(long id) {
        return beerRepository.findById(id);
    }

    @Transactional
    void modifyLikes(long id) {
        beerRepository.findById(id)
                .orElseThrow(BeerNietGevondenException::new)
                .increaseLikes();
    }
    @Transactional
    void modifyDislikes(long id) {
        beerRepository.findById(id)
                .orElseThrow(BeerNietGevondenException::new)
                .increaseDislikes();
    }

    List<Beer> findByNameContaining(String nameContains) {
        return beerRepository.findBeersByNameContainingIgnoreCaseOrderByName(nameContains);
    }

}
