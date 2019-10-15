echo(version=version());

difference() {
	hull(){
		translate([0, 17, 0]) cube([210, 17, 0.1]);
		translate([0, 0, 85]) cube([210, 35, 0.1]);
	}
	hull(){
		translate([5, 5, 70]) cube([200, 30, 0.1]);
		translate([5, 3.5, 85]) cube([200, 32, 0.1]);
	}
	translate([40, 28, 35]) rotate([90, 90, 0]) cylinder(h=20, r=23, center=true);
	translate([170, 28, 35]) rotate([90, 90, 0]) cylinder(h=20, r=23, center=true);
	translate([120, 22, 50]) rotate([90, 90, 90]) cylinder(h=30, r=8.1, center=true);
	translate([120, 24, 20]) rotate([90, 90, 90]) cylinder(h=30, r=6.1, center=true);

	*translate([105, 0, -10]) cube([110, 50, 110]);
	translate([0, 0, -10]) cube([110, 50, 110]);
}


*translate([105, 22, 50]) rotate([90, 90, 90]) cylinder(h=30, r=8, center=true);
*translate([105, 24, 20]) rotate([90, 90, 90]) cylinder(h=30, r=6, center=true);