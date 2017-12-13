import { Component, OnInit } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { environment } from '../../environments/environment';

@Component({
  selector: 'app-enrollment-summary',
  templateUrl: './enrollment-summary.component.html',
  styleUrls: ['./enrollment-summary.component.css']
})
export class EnrollmentSummaryComponent implements OnInit {

  coursetopicsummary = [];

  constructor(private http: HttpClient) { }

  ngOnInit() {
  }

  getEnrollmentSummary(semester:String){
    this.http.get(environment.baseURL + `api/report/coursetopicsummary/semester/${semester}`)
      .subscribe((res:any) => {
        if(res == null) {
          this.coursetopicsummary = [];
          return;
        }
        console.log(res.coursetopicsummary);
        this.coursetopicsummary = res.coursetopicsummary;
      })
  }
}
