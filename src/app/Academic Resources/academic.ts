import { Component } from '@angular/core';

@Component({
    selector: 'academic-resources',
    templateUrl: 'AcademicResources.html',
  })

  // tslint:disable-next-line: component-class-suffix
  export class AcademicRes {
    btnClicked() {
        console.log('btn clicked');
    }
  }
