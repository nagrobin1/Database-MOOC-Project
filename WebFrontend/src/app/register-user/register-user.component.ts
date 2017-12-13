import { Component, OnInit } from '@angular/core';
import { environment } from '../../environments/environment'
import { HttpClient } from '@angular/common/http';
import { HttpHeaders } from "@angular/common/http";

@Component({
  selector: 'app-register-user',
  templateUrl: './register-user.component.html',
  styleUrls: ['./register-user.component.css']
})
export class RegisterUserComponent implements OnInit {

  // user = {
  //   email: 'Alice@somewhere.com',
  //   firstName: 'Bob',
  //   lastName: 'Alice',
  //   password: '12345',
  //   picture: 'my picture',
  //   isStudent: 1,
  //   isFaculty: 0,
  //   isAdmin: 0,
  //   street: '136 Hemenway St',
  //   city: 'Boston',
  //   postalCode: '02115',
  //   country: 'USA'
  // };

  user = {
    email: '',
    firstName: '',
    lastName: '',
    password: '',
    picture: ' ',
    isStudent: 1,
    isFaculty: 0,
    isAdmin: 0,
    street: '',
    city: '',
    postalCode: '',
    country: ''
  };

  constructor(private http: HttpClient) { }

  ngOnInit() {
  }

  printUser() {
    console.log(this.user);

    let headers = new HttpHeaders();
    headers = headers.set('Content-Type', 'application/json; charset=utf-8');

    return this.http.post(
      environment.baseURL + "api/task/create/user",
      JSON.stringify(this.user),
      {headers: headers}
    ).subscribe(resp => {
      console.log(resp);
    });
  }
}
