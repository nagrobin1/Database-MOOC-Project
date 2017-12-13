import { Component, OnInit } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { environment } from '../../environments/environment';
import * as _ from 'lodash';

@Component({
  selector: 'app-list-student-courses',
  templateUrl: './list-student-courses.component.html',
  styleUrls: ['./list-student-courses.component.css']
})
export class ListStudentCoursesComponent implements OnInit {
  listofStudent = [];
  courseInfo = [];

  constructor(private http: HttpClient) { }

  ngOnInit() {
    this.getListOfStudent();
    console.log(_);
  }

  getListOfStudent() {
    this.http.get(environment.baseURL + 'api/users/json')
      .subscribe((res:any) => {
        console.log(res);
        this.listofStudent = _.filter(res.user, (user)=>{
          return user.isStudent === "1";
        });
      });
  }

  getCourses(studentId:String){
    this.http.get(environment.baseURL + `api/task/courseinfo/student/${studentId}`)
        .subscribe((res:any) => {
          console.log(res);
          if(res == null){
            this.courseInfo = [];
            return
          }
          this.courseInfo = res.courseinfo;
        })
  }

}
