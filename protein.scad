$fn = 180;

*union(){
    difference(){
        cylinder(r=13, h=20, center=true);
        cylinder(r=11, h=22, center=true);
    }
    difference(){
        hull(){
            translate([0, 0, 10]) cylinder(r=13, h=0.1, center=true);
            translate([0, 0, 25]) cylinder(r=20, h=0.1, center=true);
        }
        hull(){
            translate([0, 0, 10]) cylinder(r=11, h=0.1, center=true);
            translate([0, 0, 25.5]) cylinder(r=18, h=0.1, center=true);
        }
    }
}


union(){
    difference(){
        cube([25,25,25],center=true);
        cube([23,23,27],center=true);
    }
    difference(){
        hull(){
            translate([0, 0, 12.5]) cube([25,25,0.1],center=true);
            translate([0, 0, 55]) cube([95,95,0.1],center=true);
        }
        hull(){
            translate([0, 0, 55.1]) cube([93,93,0.1],center=true);
            translate([0, 0, 12.4]) cube([23,23,0.1],center=true);
        }
    }
}