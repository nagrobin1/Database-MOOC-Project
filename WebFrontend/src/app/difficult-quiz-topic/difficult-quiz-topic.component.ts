import { Component, OnInit } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { environment } from '../../environments/environment';

@Component({
  selector: 'app-difficult-quiz-topic',
  templateUrl: './difficult-quiz-topic.component.html',
  styleUrls: ['./difficult-quiz-topic.component.css']
})
export class DifficultQuizTopicComponent implements OnInit {

  difficultquiz = []

  constructor(private http: HttpClient) { }

  ngOnInit() {
    this.http.get(environment.baseURL + 'api/report/difficultquiz/json')
        .subscribe((res:any) => {
          this.difficultquiz = res.difficultquiz;
          console.log(res.difficultquiz);
        })
  }

}
