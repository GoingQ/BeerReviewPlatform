"use strict";
export function byId(id) {
    return document.getElementById(id);
}
export function setText(id, text) {
    byId(id).innerText = text;
}
export function show(id) {
    byId(id).hidden = false;
}
export function hide(id) {
    byId(id).hidden = true;
}
export function deleteChildElementFrom(element) {
    while (element.lastChild !== null) {
        element.lastChild.remove();
    }
}