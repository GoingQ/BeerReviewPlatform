package com.davidprojects.beerreviewplatform.beers;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ResponseStatus;

@ResponseStatus(HttpStatus.CONFLICT)
public class EenAndereGebruikerWijzigdeDeBeerException extends RuntimeException {
    public EenAndereGebruikerWijzigdeDeBeerException() {
        super("Een andere gebruiker wijzigde de cheese.");
    }
}
