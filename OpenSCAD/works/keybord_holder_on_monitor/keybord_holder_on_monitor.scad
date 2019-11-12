echo(version=version());
// Base Config
base_W = 40;
base_H = 53;
// fix num
base_T = 3;
baee_R = 12;
$fn = 60;

translate([0, 0, 0]) cube([24 + base_T + base_T, base_W, base_T]);
translate([0, 0, 0]) cube([base_T, base_W, 15 + base_T]);
translate([24 + base_T, 0, 0]) cube([base_T, base_W, 50 + base_T + base_T]);
translate([24 + base_T, 0, 53]) cube([40 + base_T + base_T, base_W, base_T]);
translate([70, 0, 0]) cube([base_T, base_W, 50 + base_T + base_T]);

// translate([60, 5, 10]) cube([7 + base_T + base_T, 10, 2]);
// translate([60, 25, 10]) cube([7 + base_T + base_T, 10, 2]);
translate([0, -10, 0]) union(){
	translate([70, 0, 40 + base_T]) cube([base_T, 60, 60 + base_T]);
	translate([70, 0, 100 + base_T]) cube([40 + base_T + base_T, 60, base_T]);
	translate([113, 0, 40 + base_T]) cube([base_T, 20, 60 + base_T]);
	translate([113, 40, 40 + base_T]) cube([base_T, 20, 60 + base_T]);
	translate([70, 0, 40 + base_T]) cube([40 + base_T + base_T, base_T, 20]);
	translate([70, 60 - base_T, 40 + base_T]) cube([40 + base_T + base_T, base_T, 20]);
}


// // main hock body
// cube(size=[base_T, base_H, base_W], center=false);
// // Top hock
// translate([-6, base_H, 0]) cube(size=[8.5, base_T, base_W], center=false);
// translate([-6, base_H - 6, 0]) cube(size=[base_T, 6.5, base_W], center=false);
// translate([-3, base_H - 5.2, 0]) cylinder(h=base_W, r=1, center=false, $fn=3);
// // stable parts
// // main hock r
// translate([12, 0, 0]) difference() {
//     cylinder(h=base_W, r=baee_R, center=false);
//     cylinder(h=base_W + 2, r=baee_R-base_T, center=false);
//     translate([-9.5, 0, -1]) cube(size=[25, 14, base_W + 2], center=false);
//     translate([0, 0, -1]) rotate([0, 0, -30]) cube(size=[25, 14, base_W + 2], center=false);
// }
// // main hock extend
// translate([20, -5.1, 0]) rotate([0, 0, -20]) cube(size=[base_T, 10, base_W], center=false);
// // bottom fuck
// translate([-6, -2.5, 0]) cube(size=[8.5, base_T, base_W], center=false);
// translate([-5.15, 0.5, 0]) rotate([0, 0, 90]) cylinder(h=base_W, r=1, center=false, $fn=3);
// translate([-6, 4, 0]) cube(size=[8.5, base_T, base_W], center=false);
