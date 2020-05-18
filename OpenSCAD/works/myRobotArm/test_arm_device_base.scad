echo(version=version());
// Config
base_W = 90;
base_H = 90;
base_T = 5;

union() {
    // base board
    cube([base_W,base_H,base_T]);
    // hook for angle
    translate([5, 0, 0]) {
        difference(){
        	union() {
        		translate([0, 60, 0]) myhook();
        		translate([70, 60, 0]) myhook();
        	}
        	translate([-5, 60, -4]) rotate([60, 0, 0])  rotate([0, 90, 0]) cylinder(h=90, r=5, center=false, $fn=3);
        }
        translate([0, 0, 0]) myhook();
        translate([70, 0, 0]) myhook();
    }
    // joint of frame on board
    translate([5.1, 5.1, 5]) cube([10,10,5]);
    translate([5.1, 74.9, 5]) cube([10,10,5]);
    translate([74.9, 5.1, 5]) cube([10,10,5]);
    translate([74.9, 74.9, 5]) cube([10,10,5]);
}

union() {
    //up unit
    difference(){
        union(){
            // frame 1
            translate([0, 0, 0]) cube([15,5,50]);
            translate([75, 0, 0]) cube([15,5,50]);
            translate([0, 85, 0]) cube([15,5,50]);
            translate([75, 85, 0]) cube([15,5,50]);
            // frame 2
            translate([90, 0, 0]) {
                rotate([0, 0, 90]) translate([0, 0, 0]) cube([15,5,50]);
                rotate([0, 0, 90]) translate([75, 0, 0]) cube([15,5,50]);
                rotate([0, 0, 90]) translate([0, 85, 0]) cube([15,5,50]);
                rotate([0, 0, 90]) translate([75, 85, 0]) cube([15,5,50]);
            }
            // top board
            translate([0, 0, 45]) cube([base_W,base_H,base_T]);
        }
        // base board for difference
        cube([base_W,base_H,base_T]);
    }
}

module myhook() {
    rotate([-90, 0, 0]) union() {
        translate([(10-5.6)/2, 0, 0]) cube([5.6, 3, 12]);
        translate([0, 2.3, 0]) hull() {
            cube([10, 1.2, 12]);
            translate([(10-4.4)/2, 3.6, 0])cube([4.4, 0.1, 12]);
        }
    }
}
