import { Component, OnInit } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { environment } from '../../environments/environment';
import * as _ from 'lodash';

@Component({
  selector: 'app-list-course-materials',
  templateUrl: './list-course-materials.component.html',
  styleUrls: ['./list-course-materials.component.css']
})
export class ListCourseMaterialsComponent implements OnInit {

  listOfStudents = [];
  listOfCourses = [];
  listofMaterials = [];

  constructor(private http: HttpClient) { }

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

  getCourseMaterials(userId, courseId){
    this.http.get(environment.baseURL + `api/task/materialinfo/${userId}/${courseId}`)
      .subscribe((res:any)=>{
        console.log(res);
        this.listofMaterials = res.materialinfoforstudentinclass;
      });
  }

  finishMaterial(enrollment, sequence){
    console.log(enrollment, sequence);
    let headers = new HttpHeaders();
    headers = headers.set('Content-Type', 'application/json; charset=utf-8');

    return this.http.post(
      environment.baseURL + "api/task/markMaterialCompleted",
      JSON.stringify({enrollmentID: enrollment, sequenceID: sequence}),
      {headers: headers}
    ).subscribe(resp => {
      console.log(resp);
    });
  }
}
