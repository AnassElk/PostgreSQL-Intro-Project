import { Component, OnInit } from "@angular/core";
import { CommunicationService } from "../services/communication.service";
import { MatFormFieldModule } from "@angular/material/form-field";
import { MatInputModule } from "@angular/material/input";
import { PlanRepas } from "../interfaces/plan-repas-interface";

@Component({
  selector: "app-add-plan-repas-dialog",
  templateUrl: "./add-plan-repas-dialog.component.html",
  styleUrls: ["./add-plan-repas-dialog.component.css"],
  providers: [MatFormFieldModule, MatInputModule],
})
export class AddPlanRepasDialogComponent implements OnInit {
  numeroPlan: number;
  numeroFournisseur: number;
  categorie: string;
  frequence: number;
  nbrPersonnes: number;
  nbrCalories: number;
  prix: number;
  numerosFournisseur: number[] = [1,2,3,4,5];

  constructor(private communicationService: CommunicationService) {
    this.numeroFournisseur = 1;
    this.categorie = 'categorie fictive';
    this.frequence = 3;
    this.nbrPersonnes = 4;
    this.nbrCalories = 1800;
    this.prix = 12.99;

  }

  ngOnInit(): void {
    this.communicationService.getNumerosFournisseur().subscribe((numeroFournisseurArray) => {
      // this.numerosFournisseur = numeroFournisseurArray;
    })
  }

  addPlanRepas() {
    this.communicationService.addPlanRepas({
      categorie: this.categorie,
      frequence: this.frequence,
      nbrcalories: this.nbrCalories,
      nbrpersonnes: this.nbrPersonnes,
      prix: this.prix,
      numerofournisseur: this.numeroFournisseur,
    } as PlanRepas).subscribe((res)=>{
      res === -1 ? window.alert(
            "Une erreur est survenue. Veuillez vérifiez la validité de vos entrées"
          )
        : window.location.reload();
    });
    
  }

  formIsValid(): boolean {
    // const twoDecimalsRegex = /^(\d+(?:,\d{1,2})?).*/
    return (
      this.categorie.trim().length > 0 &&
    this.frequence >= 0 &&
    this.nbrCalories >= 0 &&
    this.nbrPersonnes >= 0 &&
    this.prix > 0
    )
  }
}
