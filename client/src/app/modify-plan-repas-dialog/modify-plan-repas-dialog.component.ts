import { Component, Inject, OnInit } from '@angular/core';
import { MAT_DIALOG_DATA } from '@angular/material/dialog';
import { PlanRepas } from '../interfaces/plan-repas-interface';
import { CommunicationService } from '../services/communication.service';

@Component({
  selector: 'app-modify-plan-repas-dialog',
  templateUrl: './modify-plan-repas-dialog.component.html',
  styleUrls: ['./modify-plan-repas-dialog.component.css']
})
export class ModifyPlanRepasDialogComponent implements OnInit {

  numeroPlan: number;
  numeroFournisseur: number;
  categorie: string;
  frequence: number;
  nbrPersonnes: number;
  nbrCalories: number;
  prix: number;

  constructor(private communicationService: CommunicationService, @Inject(MAT_DIALOG_DATA) public data: PlanRepas) {
    this.numeroPlan = this.data.numeroplan;
    this.numeroFournisseur = this.data.numerofournisseur;
    this.prix = this.data.prix;
    this.nbrCalories = this.data.nbrcalories;
    this.frequence = this.data.frequence;
    this.nbrPersonnes = this.data.nbrpersonnes
    this.categorie = this.data.categorie;
  }

  ngOnInit(): void {

  }



  modifyPlanRepas() {
    this.communicationService.modifyPlanRepas({
      categorie: this.categorie,
      frequence: this.frequence,
      nbrcalories: this.nbrCalories,
      nbrpersonnes: this.nbrPersonnes,
      prix: this.prix,
      numerofournisseur: this.numeroFournisseur,
      numeroplan: this.numeroPlan
    } as PlanRepas).subscribe(()=>{window.location.reload();});
    
  }
}
