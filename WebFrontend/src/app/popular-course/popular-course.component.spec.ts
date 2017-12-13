import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { PopularCourseComponent } from './popular-course.component';

describe('PopularCourseComponent', () => {
  let component: PopularCourseComponent;
  let fixture: ComponentFixture<PopularCourseComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ PopularCourseComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(PopularCourseComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should be created', () => {
    expect(component).toBeTruthy();
  });
});
