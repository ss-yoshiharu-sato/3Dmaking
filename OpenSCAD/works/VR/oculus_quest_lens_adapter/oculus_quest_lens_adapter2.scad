// translate([0, 0, 0]) rotate([0, 0, 0]) 
$fn = 60;

*difference(){
	translate([90, 90, 0]) rotate([0, 0, 0]) import("LensBaseLeft.stl", convexity=3);
	translate([102.9, 61, 1]) rotate([0, 0, 0]) cylinder(h=3, r=3, center=false);
	translate([100.9, 112.8, 1]) rotate([0, 0, 0]) cylinder(h=3, r=3, center=false);
}

*difference(){
	translate([20, 33, 0]) rotate([0, 0, 0]) import("LensBaseRight.stl", convexity=3);
	translate([76.6, 3.8, 1]) rotate([0, 0, 0]) cylinder(h=3, r=3, center=false);
	translate([78.6, 56, 1]) rotate([0, 0, 0]) cylinder(h=3, r=3, center=false);
}

*union() {
	difference(){
		translate([-123.6, -120, 0]) rotate([0, 0, 0]) import("LensTopRight.stl", convexity=3);
		translate([38, 56, 0]) rotate([0, 0, 0]) cylinder(h=3, r=3, center=false);
		translate([36.1, 4, 0]) rotate([0, 0, 0]) cylinder(h=3, r=3, center=false);
		translate([0, 0, 2.67]) rotate([0, 0, 0]) cube([55, 55, 10]);
	}
	translate([52.3, -60, 0]) rotate([0, 0, 180]) mirror([0,1,0]) tume_set();
}

union() {
	difference(){
		translate([-123.6, -60, 0]) rotate([0, 0, 0]) import("LensTopLeft.stl", convexity=3);
		translate([16.8, 64, 0]) rotate([0, 0, 0]) cylinder(h=3, r=3, center=false);
		translate([14.9, 115.8, 0]) rotate([0, 0, 0]) cylinder(h=3, r=3, center=false);
		translate([0, 60, 2.67]) rotate([0, 0, 0]) cube([55, 55, 10]);
	}
	translate([0, 0, 0]) rotate([0, 0, ]) tume_set();
}

module tume_set() {
	translate([4, 85, 0]) rotate([0, 0, 17]) tume();
	#translate([19, 113, 0]) rotate([0, 0, -80]) tume();
	translate([50.2, 92, 0]) rotate([0, 0, 180]) tume();
	translate([40, 70, 0]) rotate([0, 0, 110]) tume();
}

module tume() {
	translate([0, 0, 2.67]) rotate([0, 0, 0]) cube([1, 8, 2]);
	translate([0, 0, 4.67]) rotate([0, 0, 0]) cube([1.5, 8, 1]);
	hull() {
		translate([-2, 0, 2.67]) rotate([0, 0, 0]) cube([2, 8, 0.1]);
		translate([0, 0, 5.57]) rotate([0, 0, 0]) cube([0.5, 8, 0.1]);
	}
	hull() {
		translate([-2, 0, 2.67]) rotate([0, 0, 0]) cube([2, 8, 0.1]);
		translate([0, 0, 0]) rotate([0, 0, 0]) cube([1, 8, 0.1]);
	}
}

module tume2() {
	translate([0, 0, 2.67]) rotate([0, 0, 0]) cube([1, 8, 2]);
	translate([0, 0, 4.67]) rotate([0, 0, 0]) cube([1.5, 8, 1]);
	hull() {
		translate([-2, 0, 2.67]) rotate([0, 0, 0]) cube([2, 8, 0.1]);
		translate([0, 0, 5.57]) rotate([0, 0, 0]) cube([0.5, 8, 0.1]);
	}
}


