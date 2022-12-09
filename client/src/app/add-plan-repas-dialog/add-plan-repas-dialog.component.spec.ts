import { ComponentFixture, TestBed } from '@angular/core/testing';

import { AddPlanRepasDialogComponent } from './add-plan-repas-dialog.component';

describe('AddPlanRepasDialogComponent', () => {
  let component: AddPlanRepasDialogComponent;
  let fixture: ComponentFixture<AddPlanRepasDialogComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ AddPlanRepasDialogComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(AddPlanRepasDialogComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
