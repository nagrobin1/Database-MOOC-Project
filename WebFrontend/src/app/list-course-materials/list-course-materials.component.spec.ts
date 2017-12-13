import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { ListCourseMaterialsComponent } from './list-course-materials.component';

describe('ListCourseMaterialsComponent', () => {
  let component: ListCourseMaterialsComponent;
  let fixture: ComponentFixture<ListCourseMaterialsComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ ListCourseMaterialsComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(ListCourseMaterialsComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should be created', () => {
    expect(component).toBeTruthy();
  });
});
