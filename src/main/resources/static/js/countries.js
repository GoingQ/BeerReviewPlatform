"use strict";
import {byId, setText, show, hide, deleteChildElementFrom} from "./util.js";

const response = await fetch("countries");
if (response.ok) {
    hide("error");
    const countries = await response.json();
    const ul = byId("country");

    for (const country of countries) {
        const li = document.createElement("li");
        const hyperlink = document.createElement("a");

        hyperlink.href = "beers.html";
        hyperlink.innerText = `${country.name}`;
        li.appendChild(hyperlink);
        ul.appendChild(li);

        hyperlink.onclick = function() {
            sessionStorage.setItem("country", JSON.stringify(country))
        }
    }
} else {
    show("error");
}

