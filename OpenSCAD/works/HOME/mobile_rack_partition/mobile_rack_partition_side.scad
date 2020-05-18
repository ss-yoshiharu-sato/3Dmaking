echo(version=version());

translate([-1, 0, 0]){
    translate([7, 2.5, 2]) cube([2, 5, 30]);
    translate([11, 2.5, 2]) cube([2, 5, 30]);

    difference(){
        translate([10, 6, 12]) rotate([90, 270, 0]) scale([20,9,1]) cylinder(h=2, r=1, center=false, $fn=3);
        translate([9, 2.5, 2]) cube([2, 5, 30]);
    }
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