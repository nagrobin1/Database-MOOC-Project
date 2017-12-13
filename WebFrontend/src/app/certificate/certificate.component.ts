import { Component, OnInit } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { environment } from '../../environments/environment';
import * as _ from 'lodash';

@Component({
  selector: 'app-certificate',
  templateUrl: './certificate.component.html',
  styleUrls: ['./certificate.component.css']
})
export class CertificateComponent implements OnInit {

  listOfStudents = [];
  listOfCourses = [];
  isCertified = false;

  constructor(private http:HttpClient) { }

  ngOnInit() {
    this.getUsers();
  }

  getUsers(){
    this.http.get(environment.baseURL + "api/users/json")
      .subscribe((res:any)=>{
        this.listOfStudents = _.filter(res.user, (user)=>{
          return user.isStudent === "1";
        });
      });
  }

  getUsersCourses(studentId:String){
    this.http.get(environment.baseURL + `api/task/courseinfo/student/${studentId}`)
      .subscribe((res:any) => {
        console.log(res);
        if(res == null){
          this.listOfCourses = [];
          return
        }
        this.listOfCourses = res.courseinfo;
      })
  }

  getCertificate(userID, courseID){
    this.http.get(environment.baseURL + `api/task/certificate/${userID}/${courseID}`)
      .subscribe((res:any) => {
         this.isCertified = res != null && res.status === "Yes Certificate"
      });
  }
}
