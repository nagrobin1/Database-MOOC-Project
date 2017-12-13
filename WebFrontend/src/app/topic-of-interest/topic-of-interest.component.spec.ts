import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { TopicOfInterestComponent } from './topic-of-interest.component';

describe('TopicOfInterestComponent', () => {
  let component: TopicOfInterestComponent;
  let fixture: ComponentFixture<TopicOfInterestComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ TopicOfInterestComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(TopicOfInterestComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should be created', () => {
    expect(component).toBeTruthy();
  });
});
