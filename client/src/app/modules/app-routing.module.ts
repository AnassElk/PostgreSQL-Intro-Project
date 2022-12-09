import { NgModule } from "@angular/core";
import { RouterModule, Routes } from "@angular/router";
import { AddPlanRepasDialogComponent } from "../add-plan-repas-dialog/add-plan-repas-dialog.component";
import { AppComponent } from "../app.component";
import { PlanRepasComponent } from "../plan-repas/plan-repas.component";

const routes: Routes = [
  { path: "plan-repas", component: PlanRepasComponent, },
  {path: "insererPlanRepas", component: AddPlanRepasDialogComponent},
  { path: "app", component: AppComponent, },
];


@NgModule({
  imports: [ RouterModule.forRoot(routes) ],
  exports: [ RouterModule ]
})
export class AppRoutingModule { }
