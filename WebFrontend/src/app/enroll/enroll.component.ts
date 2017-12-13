import { Component, OnInit } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { environment } from '../../environments/environment';
import * as _ from 'lodash';

@Component({
  selector: 'app-enroll',
  templateUrl: './enroll.component.html',
  styleUrls: ['./enroll.component.css']
})
export class EnrollComponent implements OnInit {

  listOfStudents = [];
  listOfCourses = [];

  constructor(private http: HttpClient) { }

  ngOnInit() {
    this.getCourses();
    this.getStudents();
    console.log(this.makeid())
  }

  getStudents() {
    this.http.get(environment.baseURL + "api/users/json")
      .subscribe((res:any)=>{
        this.listOfStudents = _.filter(res.user, (user)=>{
          return user.isStudent === "1";
        });
      });
  }

  getCourses() {
    this.http.get(environment.baseURL + 'api/courses/json')
      .subscribe((res:any) => {
        this.listOfCourses = res.courses;
        console.log(this.listOfCourses);
      })
  }

  enroll(studentId, courseId){
    console.log(studentId, courseId);
    let headers = new HttpHeaders();
    headers = headers.set('Content-Type', 'application/json; charset=utf-8');

    return this.http.post(
      environment.baseURL + "api/task/enroll",
      JSON.stringify({
        studentID: studentId,
        courseID: courseId,
        enrolledTime: new Date().toISOString(),
        confirmationCode: this.makeid(),
        paymentTime: new Date().toISOString()
      }),
      {headers: headers}
    ).subscribe((resp:any) => {}, (err:any) =>{
      if(err.status === 200){
        alert("Enrolled Student");
      }else{
        alert("Enrollment failed");
      }
    })
  }

  makeid() {
    let text = "";
    const possible = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";

    for (let i = 0; i < 5; i++)
      text += possible.charAt(Math.floor(Math.random() * possible.length));

    return text;
  }
}
