echo(version=version());
$fn=60;
baseW = 30;
baseH = 10;
poleW = 20;
poleH = 20;
daboR = ((poleW/2)-2)/2;
daboA = daboR/10;
daboH = daboR*1.5;
daboAjst = 0.4;
daboSP = (poleW - (daboR*4))/2;
daboMV = daboAjst+(daboR*2)+daboSP;
daboHsub = 1;


union() {
	cube([baseW, baseW, baseH]);
	dabo();
}

*difference() {
	translate([0, 0, baseH]) cube([poleW, poleW, poleH]);
	dabo_ana();
}

module dabo(){
	translate([daboR+daboAjst, daboR+daboAjst, 0]){
		translate([daboAjst, daboAjst, baseH]) cylinder(h=daboH, r=daboR-daboAjst);
		hull(){
			translate([daboAjst, daboAjst, baseH+daboH]) cylinder(h=0.1, r=daboR-daboAjst);
			translate([daboAjst, daboAjst, baseH+daboH+daboHsub-daboAjst]) cylinder(h=0.1, r=daboR-daboHsub-daboAjst);
		}
		translate([daboAjst, daboMV, baseH]) cylinder(h=daboH, r=daboR-daboAjst);
		hull(){
			translate([daboAjst, daboMV, baseH+daboH]) cylinder(h=0.1, r=daboR-daboAjst);
			translate([daboAjst, daboMV, baseH+daboH+daboHsub-daboAjst]) cylinder(h=0.1, r=daboR-daboHsub-daboAjst);
		}
		translate([daboMV, daboAjst, baseH]) cylinder(h=daboH, r=daboR-daboAjst);
		hull(){
			translate([daboMV, daboAjst, baseH+daboH]) cylinder(h=0.1, r=daboR-daboAjst);
			translate([daboMV, daboAjst, baseH+daboH+daboHsub-daboAjst]) cylinder(h=0.1, r=daboR-daboHsub-daboAjst);
		}
		translate([daboMV, daboMV, baseH]) cylinder(h=daboH, r=daboR-daboAjst);
		hull(){
			translate([daboMV, daboMV, baseH+daboH]) cylinder(h=0.1, r=daboR-daboAjst);
			translate([daboMV, daboMV, baseH+daboH+daboHsub-daboAjst]) cylinder(h=0.1, r=daboR-daboHsub-daboAjst);
		}
	}
}

module dabo_ana(){
	translate([daboR+daboAjst, daboR+daboAjst, 0]){
		translate([daboAjst, daboAjst, baseH]) cylinder(h=daboH, r=daboR);
		hull(){
			translate([daboAjst, daboAjst, baseH+daboH]) cylinder(h=0.1, r=daboR);
			translate([daboAjst, daboAjst, baseH+daboH+daboHsub]) cylinder(h=0.1, r=daboR-daboHsub);
		}
		translate([daboAjst, daboMV, baseH]) cylinder(h=daboH, r=daboR);
		hull(){
			translate([daboAjst, daboMV, baseH+daboH]) cylinder(h=0.1, r=daboR);
			translate([daboAjst, daboMV, baseH+daboH+daboHsub]) cylinder(h=0.1, r=daboR-daboHsub);
		}
		translate([daboMV, daboAjst, baseH]) cylinder(h=daboH, r=daboR);
		hull(){
			translate([daboMV, daboAjst, baseH+daboH]) cylinder(h=0.1, r=daboR);
			translate([daboMV, daboAjst, baseH+daboH+daboHsub]) cylinder(h=0.1, r=daboR-daboHsub);
		}
		translate([daboMV, daboMV, baseH]) cylinder(h=daboH, r=daboR);
		hull(){
			translate([daboMV, daboMV, baseH+daboH]) cylinder(h=0.1, r=daboR);
			translate([daboMV, daboMV, baseH+daboH+daboHsub]) cylinder(h=0.1, r=daboR-daboHsub);
		}
	}
}

// module dabo_ana(){
// 	translate([daboR, daboR, 0]){
// 		translate([daboAjst, daboAjst, baseH]) cylinder(h=daboH+daboA, r=daboR);
// 		translate([daboAjst, 5.5, baseH]) cylinder(h=daboH+daboA, r=daboR);
// 		translate([5.5, daboAjst, baseH]) cylinder(h=daboH+daboA, r=daboR);
// 		translate([5.5, 5.5, baseH]) cylinder(h=daboH+daboA, r=daboR);
// 	}
// }