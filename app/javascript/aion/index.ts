import { AionControllerToolbar } from "./controllers/toolbar";

export class Aion {
  constructor() {

  }

  setup() {
    let toolbarControllers = document.querySelectorAll(".aion-controllers-toolbar");

    toolbarControllers.forEach(function(controller: HTMLElement) {
      $(controller).data("aion-controller", new AionControllerToolbar(controller));
    });

    return self;
  }
}
