import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { FavouriteQuestionsComponent } from './favourite-questions.component';

describe('FavouriteQuestionsComponent', () => {
  let component: FavouriteQuestionsComponent;
  let fixture: ComponentFixture<FavouriteQuestionsComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ FavouriteQuestionsComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(FavouriteQuestionsComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should be created', () => {
    expect(component).toBeTruthy();
  });
});
