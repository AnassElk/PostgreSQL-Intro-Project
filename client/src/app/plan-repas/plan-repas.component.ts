import { Component, OnInit, ViewChild } from '@angular/core';
import { MatDialog, MatDialogConfig } from '@angular/material/dialog';
import { Sort } from '@angular/material/sort';
import { MatTable } from '@angular/material/table';
import { AddPlanRepasDialogComponent } from '../add-plan-repas-dialog/add-plan-repas-dialog.component';
import { PlanRepas } from '../interfaces/plan-repas-interface';
import { ModifyPlanRepasDialogComponent } from '../modify-plan-repas-dialog/modify-plan-repas-dialog.component';
import { CommunicationService } from '../services/communication.service';

@Component({
  selector: 'app-plan-repas',
  templateUrl: './plan-repas.component.html',
  styleUrls: ['./plan-repas.component.css']
})
export class PlanRepasComponent implements OnInit {
  planRepasTable: PlanRepas[];
  planRepas: PlanRepas;
  displayedColumns: string[] = ['numeroplan', 'numeroFournisseur', 'prix', 'categorie', 'nbrCalories', 'nbrPersonnes', 'frequence'];

  @ViewChild(MatTable) table: MatTable<any>;

  constructor(private communicationService: CommunicationService, public dialog: MatDialog) {
   }

  ngOnInit(): void {
    this.communicationService.getAllPlanRepas().subscribe((planRepasTable: PlanRepas[])=>{
      this.planRepasTable = planRepasTable? planRepasTable : [];
    }
    )
  }


  openModifyDialog(planRepas: PlanRepas): void{
    const dialogConfig = new MatDialogConfig();
    dialogConfig.disableClose = false;
    dialogConfig.autoFocus = true;
    dialogConfig.minWidth = '650px';
    dialogConfig.maxWidth = '650px';
    dialogConfig.data = planRepas;

    this.dialog.open(ModifyPlanRepasDialogComponent, dialogConfig);
  }

  deletePlanRepas(planRepas: PlanRepas): void{
    this.communicationService.deletePlanRepas(planRepas).subscribe(()=>{
      window.location.reload();
    });

    
  }

  openAddDialog() {
    const dialogConfig = new MatDialogConfig();
    dialogConfig.disableClose = false;
    dialogConfig.autoFocus = true;
    dialogConfig.minWidth = '650px';
    dialogConfig.maxWidth = '650px';
    this.dialog.open(AddPlanRepasDialogComponent, dialogConfig);
  }

  private doSort(dir: string): void {
    switch(dir) {
      case 'asc':
        this.planRepasTable.sort((a: PlanRepas, b: PlanRepas) => a.numeroplan < b.numeroplan ? 1 : -1)
        break;
      default:
        this.planRepasTable.sort((a: PlanRepas, b: PlanRepas) => a.numeroplan < b.numeroplan ? -1 : 1)
      }
  }
  sortData(sort: Sort): void {
    this.doSort(sort.direction);
    this.table.renderRows();
  }
}


