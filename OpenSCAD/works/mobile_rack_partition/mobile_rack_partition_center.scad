echo(version=version());

// base
difference(){
    cube([20, 5, 2]);
    translate([20, 1.5, 0]) {
        hull(){
            cube([0.1,2,2]);
            translate([-2, -0.5, 0]) cube([0.1,3,2]);
        }
    }
}

translate([0, 1.5, 0]) {
    hull(){
        cube([0.1,2,2]);
        translate([-2, -0.5, 0]) cube([0.1,3,2]);
    }
}

// main
translate([2.5, 1.5, 2]) cube([6.5, 2, 30]);
translate([11, 1.5, 2]) cube([6.5, 2, 30]);

translate([2.5, 2.5, 8.5]) scale([1, 2.8, 13]) rotate([90, 30, 90]) cylinder(h=6.5, r=1, center=false, $fn=3);
translate([11, 2.5, 8.5]) scale([1, 2.8, 13]) rotate([90, 30, 90]) cylinder(h=6.5, r=1, center=false, $fn=3);