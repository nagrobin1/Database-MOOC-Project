import { Component, OnInit } from '@angular/core';
import { HttpClient } from "@angular/common/http";
import { environment } from "../../environments/environment";
import * as _ from 'lodash';
import { HttpHeaders } from "@angular/common/http";

@Component({
  selector: 'app-authenticate-faculty',
  templateUrl: './authenticate-faculty.component.html',
  styleUrls: ['./authenticate-faculty.component.css']
})
export class AuthenticateFacultyComponent implements OnInit {
  listofAdmins = [];
  listofNonAdmins = [];

  constructor(private http: HttpClient) { }

  ngOnInit() {
    this.getListOfUsers();
  }

  getListOfUsers() {
    this.http.get(environment.baseURL + "api/users/json")
      .subscribe((res:any)=>{
        this.listofAdmins = _.filter(res.user, (user)=>{
          return user.isAdministrator === "1";
        });
        this.listofNonAdmins = _.filter(res.user, (user)=>{
          return user.isAdministrator !== "1";
        });
      });
  }

  approve(adminId, userId){
    console.log(adminId, "is approving", userId);

    let headers = new HttpHeaders();
    headers = headers.set('Content-Type', 'application/json; charset=utf-8');

    return this.http.post(
      environment.baseURL + "api/task/authorize/admin",
      JSON.stringify({adminID: adminId, userID: userId}),
      {headers: headers}
    ).subscribe(resp => {}, err => {
      if(err.status === 200){
        alert("User made Admin!");
      }else {
        alert("User already approved");
      }
    });
  }

}
