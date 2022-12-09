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

  constructor(private communicationService: CommunicationService) {}

  ngOnInit(): void {}

  addPlanRepas() {
    this.communicationService.addPlanRepas({
      categorie: this.categorie,
      frequence: this.frequence,
      nbrcalories: this.nbrCalories,
      nbrpersonnes: this.nbrPersonnes,
      prix: this.prix,
      numerofournisseur: this.numeroFournisseur,
    } as PlanRepas).subscribe(()=>{window.location.reload();});
    
  }
}
