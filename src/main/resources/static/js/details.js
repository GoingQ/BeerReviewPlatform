"use strict";
import {byId, setText, show, hide, deleteChildElementFrom} from "./util.js";

const country = JSON.parse(sessionStorage.getItem("country"));
const beer = JSON.parse(sessionStorage.getItem("beer"));
const beerId = `${beer.id}`;
const beerName = `${beer.name}`;
setText("nameBeer", beerName);

if (!sessionStorage.getItem("country")) {
    setText("country", beer.nameCountry);
} else {
    const countryName = `${country.name}`;
    setText("country", countryName);
}

const detailBeer = await fetch(`beers/${beerId}/detailBeer`);
if (detailBeer.ok) {
    hide("error");
    const beer = await detailBeer.json();

    const beerABV = `${beer.abv}`;
    const beerStyle = `${beer.style}`;

    const beerLikes = `${beer.likes}`;
    const beerDislikes = `${beer.dislikes}`;
    const total = beer.likes + beer.dislikes;

    setText("abv", beerABV);
    setText("style", beerStyle);

    setText("likes", beerLikes + " = " + beerLikes/total*100 + " % ");
    setText("dislikes", beerDislikes + " = " + beerDislikes/total*100 + " % ");

    const ul = byId("websiteLinks");

    const urls = beer.urls;

    for (const url of urls) {
        const li = document.createElement("li");
        const hyperlink = document.createElement("a");

        hyperlink.href = url;
        hyperlink.innerText = url;
        li.appendChild(hyperlink);
        ul.appendChild(li);
    }
} else {
    show("error");
}

const detailFlavours = await fetch(`beers/${beerId}/detailFlavours`);
if (detailFlavours.ok) {
    hide("error");
    const flavours = await detailFlavours.json();
    const ul = byId("flavours");

    for (const flavour of flavours) {
        const li = document.createElement("li");
        const p = document.createElement("p");

        p.innerText = `${flavour.name}`;
        li.appendChild(p);
        ul.appendChild(li);
    }
} else {
    show("error");
}


byId("buttonLike").onclick = async function () {
    const response3 = await fetch(`beers/${beerId}/likes`,
        {
            method: 'PATCH'
        });
    if(response3.ok) {
        hide("error");
        location.reload();
    }  else {
        show("error");
    }
}
byId("buttonDislike").onclick = async function () {
    const response4 = await fetch(`beers/${beerId}/dislikes`,
        {
            method : 'PATCH'
        });
    if(response4.ok) {
        hide("error");
        location.reload();
    } else {
        show("error");
    }
}
