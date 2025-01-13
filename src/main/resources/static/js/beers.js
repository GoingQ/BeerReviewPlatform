"use strict";
import {byId, setText, show, hide, deleteChildElementFrom} from "./util.js";

const country = JSON.parse(sessionStorage.getItem("country"));
const titel = `${country.name}`;
const id = `${country.id}`;
setText("nameCountry", titel);


const response = await fetch(`countries/${id}/beers`);
if (response.ok) {
    hide("error");
    const beers = await response.json();
    console.log(beers);
    const ul = byId("beers");

    for (const beer of beers) {
        console.log("ok");
        const li = document.createElement("li");
        const hyperlink = document.createElement("a");

        hyperlink.href = "details.html"
        hyperlink.innerText = `${beer.name}`;
        li.appendChild(hyperlink);
        ul.appendChild(li);

        hyperlink.onclick = function() {
            sessionStorage.setItem("beer", JSON.stringify(beer))
        }
    }
} else {
    show("error");
}

