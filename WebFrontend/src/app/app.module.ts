import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';
import { FormsModule } from '@angular/forms';

import { AppComponent } from './app.component';
import { RouterModule } from '@angular/router';
import { RegisterUserComponent } from './register-user/register-user.component';
import { AuthenticateFacultyComponent } from './authenticate-faculty/authenticate-faculty.component';
import { ListStudentCoursesComponent } from './list-student-courses/list-student-courses.component';
import { EnrollComponent } from './enroll/enroll.component';
import { ListCourseMaterialsComponent } from './list-course-materials/list-course-materials.component';
import { CertificateComponent } from './certificate/certificate.component';
import { AccountHistoryComponent } from './account-history/account-history.component';
import { HttpClientModule } from "@angular/common/http";
import { TopicOfInterestComponent } from './topic-of-interest/topic-of-interest.component';
import { PopularCourseComponent } from './popular-course/popular-course.component';
import { DifficultQuizTopicComponent } from './difficult-quiz-topic/difficult-quiz-topic.component';
import { EnrollmentSummaryComponent } from './enrollment-summary/enrollment-summary.component';
import { FavouriteQuestionsComponent } from './favourite-questions/favourite-questions.component';

@NgModule({
  declarations: [
    AppComponent,
    RegisterUserComponent,
    AuthenticateFacultyComponent,
    ListStudentCoursesComponent,
    EnrollComponent,
    ListCourseMaterialsComponent,
    CertificateComponent,
    AccountHistoryComponent,
    TopicOfInterestComponent,
    PopularCourseComponent,
    DifficultQuizTopicComponent,
    EnrollmentSummaryComponent,
    FavouriteQuestionsComponent
  ],
  imports: [
    RouterModule.forRoot([
      {path: 'registerUser', component: RegisterUserComponent},
      {path: 'AuthenticateFacultyComponent', component: AuthenticateFacultyComponent},
      {path: 'ListStudentCoursesComponent', component: ListStudentCoursesComponent},
      {path: 'EnrollComponent', component: EnrollComponent},
      {path: 'ListCourseMaterialsComponent', component: ListCourseMaterialsComponent},
      {path: 'CertificateComponent', component: CertificateComponent},
      {path: 'AccountHistoryComponent', component: AccountHistoryComponent},
      {path: 'TopicOfInterest', component: TopicOfInterestComponent},
      {path: 'PopularCourses', component: PopularCourseComponent},
      {path: 'DifficultQuizQuestionTopic', component: DifficultQuizTopicComponent},
      {path: 'EnrollmentSummary', component: EnrollmentSummaryComponent},
      {path: 'FavouriteQuestion', component: FavouriteQuestionsComponent}
    ]),
    FormsModule,
    BrowserModule,
    HttpClientModule
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
