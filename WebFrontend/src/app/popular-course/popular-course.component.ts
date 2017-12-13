import { Component, OnInit } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { environment } from '../../environments/environment';

@Component({
  selector: 'app-popular-course',
  templateUrl: './popular-course.component.html',
  styleUrls: ['./popular-course.component.css']
})
export class PopularCourseComponent implements OnInit {

  popularcourse = {};
  
  constructor(private http: HttpClient) { }

  ngOnInit() {
    this.http.get(environment.baseURL + 'api/report/popularcourse/json')
        .subscribe((res:any) => {
          this.popularcourse = res.popularcourse;
          console.log(this.popularcourse);
        })
  }
}
