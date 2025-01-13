"use strict";
import {byId, setText, show, hide, deleteChildElementFrom} from "./util.js";

byId("search").onclick = async function () {
    hideBeersAndErrors();
    const wordInput = byId("word");
    if (wordInput.checkValidity()) {
        findByWord(wordInput.value);
    } else {
        show("wordError");
        wordInput.focus();
    }
}
function hideBeersAndErrors() {
    hide("beersTable");
    hide("wordError");
    hide("error");
}

async function findByWord(word) {
    const response = await fetch(`beers?nameContains=${word}`);
    if (response.ok) {
        const beers = await response.json();
        show("beersTable");
        const beersBody = byId("beersBody");
        deleteChildElementFrom(beersBody);

        for (const beer of beers) {
            const tr = beersBody.insertRow();

            const hyperlink = document.createElement("a");
            hyperlink.href = "details.html";
            hyperlink.innerText = "Details";

            tr.insertCell().innerText = beer.name;
            tr.insertCell().innerText = beer.nameCountry;
            tr.insertCell().innerText = beer.abv;
            tr.insertCell().appendChild(hyperlink);

            hyperlink.onclick = function() {
                sessionStorage.clear();
                sessionStorage.setItem("beer", JSON.stringify(beer))
            }
        }
    } else {
        show("error");
    }
}