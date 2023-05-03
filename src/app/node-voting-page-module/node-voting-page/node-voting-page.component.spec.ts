import {ComponentFixture, TestBed} from "@angular/core/testing";

import {NodeVotingPageComponent} from "./node-voting-page.component";

describe("NodeVotingPageComponent", () => {
  let component: NodeVotingPageComponent;
  let fixture: ComponentFixture<NodeVotingPageComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [NodeVotingPageComponent],
    }).compileComponents();

    fixture = TestBed.createComponent(NodeVotingPageComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it("should create", () => {
    expect(component).toBeTruthy();
  });
});
