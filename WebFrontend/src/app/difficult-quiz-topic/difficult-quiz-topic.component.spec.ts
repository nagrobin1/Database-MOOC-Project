import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { DifficultQuizTopicComponent } from './difficult-quiz-topic.component';

describe('DifficultQuizTopicComponent', () => {
  let component: DifficultQuizTopicComponent;
  let fixture: ComponentFixture<DifficultQuizTopicComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ DifficultQuizTopicComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(DifficultQuizTopicComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should be created', () => {
    expect(component).toBeTruthy();
  });
});
