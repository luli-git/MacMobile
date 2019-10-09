import { async, ComponentFixture, TestBed } from '@angular/core/testing';
import { IonicModule } from '@ionic/angular';

import { AcademicRes } from './academic';

describe('HomePage', () => {
  let component: AcademicRes;
  let fixture: ComponentFixture<AcademicRes>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [AcademicRes],
      imports: [IonicModule.forRoot()]
    }).compileComponents();

    fixture = TestBed.createComponent(AcademicRes);
    component = fixture.componentInstance;
    fixture.detectChanges();
  }));

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});