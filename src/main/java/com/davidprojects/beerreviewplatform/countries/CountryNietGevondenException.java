package com.davidprojects.beerreviewplatform.countries;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ResponseStatus;

@ResponseStatus(HttpStatus.NOT_FOUND)
public class CountryNietGevondenException extends RuntimeException {
    CountryNietGevondenException() {
        super("Country niet gevonden");
    }
}
