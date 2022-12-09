import { CommonModule } from "@angular/common";
import { HttpClientModule } from "@angular/common/http";
import { NgModule } from "@angular/core";
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { BrowserModule } from "@angular/platform-browser";
import { AppRoutingModule } from "./modules/app-routing.module";
import { AppComponent } from "./app.component";
import { CommunicationService } from "./services/communication.service";
import { AppMaterialModule } from './modules/material.module';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import { PlanRepasComponent } from './plan-repas/plan-repas.component';
import { AddPlanRepasDialogComponent } from './add-plan-repas-dialog/add-plan-repas-dialog.component';
import { ModifyPlanRepasDialogComponent } from './modify-plan-repas-dialog/modify-plan-repas-dialog.component';
import { DeletePlanRepasComponent } from './delete-plan-repas/delete-plan-repas.component';

@NgModule({
  declarations: [
    AppComponent,
    PlanRepasComponent,
    AddPlanRepasDialogComponent,
    ModifyPlanRepasDialogComponent,
    DeletePlanRepasComponent
  ],
  imports: [
    CommonModule,
    BrowserModule,
    HttpClientModule,
    FormsModule,
    AppRoutingModule,
    BrowserAnimationsModule,
    ReactiveFormsModule,
    AppMaterialModule
  ],
  providers: [CommunicationService],
  entryComponents: [],
  bootstrap: [AppComponent],
})
export class AppModule { }
