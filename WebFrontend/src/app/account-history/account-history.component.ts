import { Component, OnInit } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { environment } from '../../environments/environment';
import * as _ from 'lodash';

@Component({
  selector: 'app-account-history',
  templateUrl: './account-history.component.html',
  styleUrls: ['./account-history.component.css']
})
export class AccountHistoryComponent implements OnInit {
  listOfStudents = [];
  userDetails = {completionInfoList:[], totalSpent:0};
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

  getUserDetails(uid){
      this.http.get(environment.baseURL + `api/task/userAccountHistory/${uid}`)
        .subscribe((res:any) => {
          console.log(res);
          this.userDetails = res;
        })
  }

}
