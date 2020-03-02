export class AionControllerToolbar {
  private container: HTMLElement;
  private nextButton: HTMLElement;
  private previousButton: HTMLElement;
  private timezoneSelect: HTMLElement;
  private displayDateContainer: HTMLElement;
  private modeToggleContainer: HTMLElement;

  constructor(controllerContainer: HTMLElement) {
    this.container = controllerContainer;
  }
}
