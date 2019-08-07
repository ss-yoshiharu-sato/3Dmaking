echo(version=version());

// main
translate([-1, 2.5, 0]) {
    translate([2.5, 1.5, 2]) cube([6.5, 2, 30]);
    translate([11, 1.5, 2]) cube([6.5, 2, 30]);

    translate([2.5, 2.5, 8.5]) scale([1, 2.8, 13]) rotate([90, 30, 90]) cylinder(h=6.5, r=1, center=false, $fn=3);
    translate([11, 2.5, 8.5]) scale([1, 2.8, 13]) rotate([90, 30, 90]) cylinder(h=6.5, r=1, center=false, $fn=3);
}

// base
difference(){
    cube([20, 10, 2]);
    translate([20, 3.9, 0]) {
        hull(){
            cube([0.1,2.2,2]);
            translate([-2.1, -0.5, 0]) cube([0.1,3.2,2]);
        }
    }
}

translate([0, 4, 0]) {
    hull(){
        cube([0.1,2,2]);
        translate([-2, -0.5, 0]) cube([0.1,3,2]);
    }
}
