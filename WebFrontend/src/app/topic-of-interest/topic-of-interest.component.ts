import { Component, OnInit } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { environment } from '../../environments/environment';

@Component({
  selector: 'app-topic-of-interest',
  templateUrl: './topic-of-interest.component.html',
  styleUrls: ['./topic-of-interest.component.css']
})
export class TopicOfInterestComponent implements OnInit {

  topicsofinterest = [];

  constructor(private http: HttpClient) { }

  ngOnInit() {
  }

  getTopicOfInterest(semester: string){
      this.http.get(environment.baseURL + `api/report/topicsofinterest/semester/${semester}`)
        .subscribe((res:any) => {
          if(res == null)
            return;
          this.topicsofinterest = res.topicsofinterest;
          console.log(this.topicsofinterest);
        })
  }

}
