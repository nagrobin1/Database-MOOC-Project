import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { AuthenticateFacultyComponent } from './authenticate-faculty.component';

describe('AuthenticateFacultyComponent', () => {
  let component: AuthenticateFacultyComponent;
  let fixture: ComponentFixture<AuthenticateFacultyComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ AuthenticateFacultyComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(AuthenticateFacultyComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should be created', () => {
    expect(component).toBeTruthy();
  });
});
