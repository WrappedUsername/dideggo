import { ComponentFixture, TestBed } from '@angular/core/testing';

import { NodeCitizensDashboardComponent } from './node-citizens-dashboard.component';

describe('NodeCitizensDashboardComponent', () => {
  let component: NodeCitizensDashboardComponent;
  let fixture: ComponentFixture<NodeCitizensDashboardComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ NodeCitizensDashboardComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(NodeCitizensDashboardComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
