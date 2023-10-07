import Inputmask from "inputmask"

const element = document.getElementsByClassName("mask-phone")
const im_phone = new Inputmask("(99) 99999-9999")
im_phone.mask(element)