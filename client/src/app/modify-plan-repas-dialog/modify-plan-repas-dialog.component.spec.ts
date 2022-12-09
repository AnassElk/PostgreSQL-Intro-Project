import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ModifyPlanRepasDialogComponent } from './modify-plan-repas-dialog.component';

describe('ModifyPlanRepasDialogComponent', () => {
  let component: ModifyPlanRepasDialogComponent;
  let fixture: ComponentFixture<ModifyPlanRepasDialogComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ ModifyPlanRepasDialogComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(ModifyPlanRepasDialogComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
