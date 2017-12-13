import { Component, OnInit } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { environment } from '../../environments/environment';

@Component({
  selector: 'app-favourite-questions',
  templateUrl: './favourite-questions.component.html',
  styleUrls: ['./favourite-questions.component.css']
})
export class FavouriteQuestionsComponent implements OnInit {
  courses = [];
  favouriteQuestions = [];

  constructor(private http: HttpClient) { }

  ngOnInit() {
      this.getCourses();
  }

  getCourses() {
    this.http.get(environment.baseURL + 'api/courses/json')
      .subscribe((res:any) => {
        this.courses = res.courses;
        console.log(this.courses);
      })
  }

  getCourseQuestion(courseId: string) {
    this.http.get(environment.baseURL + `api/report/favouritequestion/course/${courseId}`)
      .subscribe((res:any) => {
        if(res == null) {
          this.favouriteQuestions = [];
          return;
        }
        this.favouriteQuestions = [res.favouritequestion];
        console.log(this.favouriteQuestions);
      })
  }
}
